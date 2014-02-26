module Docs
  class Sqlite < UrlScraper
    self.name = 'SQLite'
    self.slug = 'sqlite'
    self.type = 'sqlite'
    self.version = '3.8.3.1'
    self.base_url = 'http://sqlite.com/docs'

    html_filters.push 'sqlite/clean_html', 'sqlite/entries'
  end
end