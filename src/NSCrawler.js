var NSCrawler = function NSCrawler() {
};

NSCrawler.prototype.crawl = function crawl() {
  var option = {
    muteHttpExceptions: true
  };
  var response = UrlFetchApp.fetch('https://www.amazon.co.jp/dp/B01NCXFWIZ', option);
  if (response.getResponseCode() !== 200) {
    Logger.log(response);
    return;
  }

  Logger.log(response.getContentText());
  var doc = Xml.parse(response.getContentText(), true);
  Logger.log(doc);
};
