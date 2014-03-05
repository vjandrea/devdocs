module Docs
#  class Laravel < UrlScraper
  class Laravel < FileScraper
    self.name = 'Laravel'
    self.slug = 'laravel'
    self.type = 'laravel'
    self.version = '4.1'
    self.base_url = 'http://laravel.com/docs'

    html_filters.push 'laravel/clean_html', 'laravel/entries'

    options[:attribution] = "&copy; Taylor Otwell"
  end
end