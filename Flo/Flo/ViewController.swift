//
//  ViewController.swift
//  Flo
//
//  Created by XP on 9/6/19.
//  Copyright © 2019 XP. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var medalView: MedalView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    //Label outputs
    @IBOutlet weak var averageWaterDrunk: UILabel!
    @IBOutlet weak var maxLabel: UILabel!
    @IBOutlet weak var stackView: UIStackView!
    
    var isGraphViewShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        counterLabel.text = String(counterView.counter)
        checkTotal()
    }
    
    func setupGraphDisplay() {
        let maxDayIndex = stackView.arrangedSubviews.count - 1
        
        //replace last day with today's actual data
        graphView.graphPoints[graphView.graphPoints.count - 1] = counterView.counter
        //indicate that the graph needs to be redrawn
        graphView.setNeedsDisplay()
        maxLabel.text = "\(graphView.graphPoints.max()!)"
        
        //calculate average from graphPoints
        let average = graphView.graphPoints.reduce(0, +) / graphView.graphPoints.count
        averageWaterDrunk.text = "\(average)"
        
        //setup date formatter and calendar
        let today = Date()
        let calendar = Calendar.current
        
        let formatter = DateFormatter()
        formatter.setLocalizedDateFormatFromTemplate("EEEEE")
        
        //set up the day name labels with correct days
        for i in 0...maxDayIndex {
            if let date = calendar.date(byAdding: .day, value: -i, to: today),
                let label = stackView.arrangedSubviews[maxDayIndex - i] as? UILabel {
                label.text = formatter.string(from: date)
            }
        }
    }
    
    func checkTotal() {
        if counterView.counter >= 8 {
            medalView.showMedal(show: true)
        } else {
            medalView.showMedal(show: false)
        }
    }

    @IBAction func pushButtonPressed(_ sender: PushButton) {
        
        if sender.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }

        counterLabel.text = String(counterView.counter)
        if isGraphViewShowing {
            counterViewTap(nil)
        }
        checkTotal()
    }
    
    @IBAction func counterViewTap(_ sender: UITapGestureRecognizer?) {
        if isGraphViewShowing {
            //hide Graph
            UIView.transition(from: graphView, to: counterView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        } else {
            //show Graph
            setupGraphDisplay()
            UIView.transition(from: counterView, to: graphView, duration: 1.0, options: [.transitionFlipFromLeft, .showHideTransitionViews], completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }
}

