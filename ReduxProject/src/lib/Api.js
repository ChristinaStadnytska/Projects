class Api {
  static serverUrl = 'https://newsapi.org/v2/';

  static getParams() {
    const category = 'top-headlines';
    const country = 'country=us';
    const apiKey = 'apiKey=bca9b711b1e445baa15da21825bc73e4';

    return category + '?' + country + '&' + apiKey;
  }

  static _fetch() {
    fetch(Api.serverUrl + Api.getParams());
  }
}
