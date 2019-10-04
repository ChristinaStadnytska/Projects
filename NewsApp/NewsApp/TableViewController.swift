//
//  TableViewController.swift
//  NewsApp
//
//  Created by XP on 9/22/19.
//  Copyright © 2019 XP. All rights reserved.
//

import UIKit
import SafariServices

class TableViewController: UITableViewController {    
    
    // MARK: - Variables
    var url: URL?
    var articlesList = [NewsAPI]()
    lazy var searchResult = [NewsAPI]()
    lazy var filteredArticlesArray = [NewsAPI]()
    let indexPath = IndexPath(row: 0, section: 0)
        
    // For Pagination
    var currentPage = 1
    var pageSize = 6
    var isDataLoading = false
    
    // Search Bar
    let searchBar = UISearchBar()
    
    // MARK: - Life cycle View
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(loadData), name: Notification.Name("loadData"), object: nil)

        // Register cell for Table View
        let cell = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(cell, forCellReuseIdentifier: "myCell")

        // SearchBar delegate
        searchBar.delegate = self
        getData()
    }
    
    // MARK: - Method for NotificationCenter
    @objc func loadData() {
        articlesList.removeAll()
        getData()
    }
    
    // MARK: - Save data from API in our articleList
    func getData() {
        let category = UserDefaults.standard.object(forKey: "category") as? String ?? "general"
        let country = UserDefaults.standard.object(forKey: "country") as? String ?? "ua"
        
        url = URL(string: "https://newsapi.org/v2/top-headlines?country=\(country)&category=\(category)&pageSize=\(pageSize)&page=\(currentPage)&apiKey=bca9b711b1e445baa15da21825bc73e4")
        guard let url = url else { return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { return }

            do {
                let json = try JSONSerialization.jsonObject(with: data) as! [String:AnyObject]
                if let items = json["articles"] as? [[String : Any]] {
                    for item in items {
                        self.articlesList.append(NewsAPI(dictionary: item))
                    }

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                }
            } catch { print(error) }
        }.resume()
    }
    
    // MARK: - Show Safari with article
    func showSafari(articleURL: String, with: Int) {
        if let url = URL(string: articleURL) {
            let config = SFSafariViewController.Configuration()
            config.entersReaderIfAvailable = true
            
            let vc = SFSafariViewController(url: url, configuration: config)
            self.present(vc, animated: true)
        }
    }
    
    // MARK: - Sort method
    @IBAction func sortBarButtonItem(_ sender: UIBarButtonItem) {
        self.currentPage = 1
        self.tableView.scrollToRow(at: self.indexPath, at: .top, animated: true)
        searchResult.removeAll()
        navigationItem.titleView = nil
        searchBar.text = nil
        
        let alertController = UIAlertController()
        
        let category = UIAlertAction(title: "Sort by category", style: .default) { (action) in
            let sortVC = self.storyboard?.instantiateViewController(withIdentifier: "SortCategoryVC")
            self.navigationController?.pushViewController(sortVC!, animated: true)
        }
        alertController.addAction(category)
        
        let country = UIAlertAction(title: "Sort by country", style: .default) { (action) in
            let sortVC = self.storyboard?.instantiateViewController(withIdentifier: "SortCountryVC")
            self.navigationController?.pushViewController(sortVC!, animated: true)
        }
        alertController.addAction(country)
        
        self.present(alertController, animated: true)
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if !searchResult.isEmpty {
            return searchResult.count
        } else {
            return articlesList.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        
        filteredArticlesArray = !searchResult.isEmpty ? searchResult.sorted(by: { $0.publishedAt > $1.publishedAt }) : articlesList.sorted(by: { $0.publishedAt > $1.publishedAt })

        let article = filteredArticlesArray[indexPath.row]
        cell.sourceLabel.text = article.source.name
        cell.titleLabel.text = article.title
        cell.authorLabel.text = article.author
        cell.descriptionTextView.text = article.description
        if let url = URL(string: article.urlToImage) {
            cell.myImageView.load(url: url)
        }
        
        return cell
    }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }

    // MARK: - Table view delegate
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = filteredArticlesArray[indexPath.row]
        showSafari(articleURL: article.url, with: indexPath.row)
    }
    
    // Pagination
    override func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        isDataLoading = false
        tableView.tableFooterView = UIView()
    }
    
    override func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height

        if currentOffset > contentHeight - scrollView.frame.height {
            if !isDataLoading {
                self.currentPage += 1
                isDataLoading = true
                getData()
            }
        }
    }
    
}

// MARK: - UISearchBarDelegate
extension TableViewController: UISearchBarDelegate {
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchBar.becomeFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchResult.removeAll()
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchResult = articlesList.filter({ (article: NewsAPI) -> Bool in
            return article.title.lowercased().contains(searchText.lowercased())
        })
        
        self.tableView.reloadData()
    }
    
    @IBAction func searchBarButtonItem(_ sender: UIBarButtonItem) {
        UIView.animate(withDuration: 0.5) {
            if self.navigationItem.titleView == nil {
                self.navigationItem.titleView = self.searchBar
            } else {
                self.navigationItem.titleView = nil
            }
        }
    }
    
}
