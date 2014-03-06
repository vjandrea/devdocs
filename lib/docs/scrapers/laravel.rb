module Docs
  class Laravel < UrlScraper
    self.name = 'Laravel'
    self.slug = 'laravel'
    self.type = 'laravel'
    self.version = '4.1'
    self.base_url = 'http://laravel.com/docs'

    html_filters.push 'laravel/clean_html', 'laravel/entries'

    # Fix a loop into API documentation
    options[:fix_urls] = ->(url) do
      url.sub! '/docs/api/api/', '/docs/api/'
    end

    # Remove the Introduction repeated several times, release history and upgrade guide
    options[:skip] = ['/introduction', '/api/4.1', '/api', '/releases', '/upgrade']

    options[:attribution] = "&copy; Taylor Otwell"
  end
end