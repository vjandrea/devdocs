module Docs
  class Laravel < UrlScraper
    self.name = 'Laravel'
    self.slug = 'laravel'
    self.type = 'laravel'
    self.version = '4.1'
    self.base_url = 'http://laravel.com/docs'

    html_filters.push 'laravel/clean_html', 'laravel/entries'

    options[:fix_urls] = ->(url) do
      url.sub! '/docs/api/api/', '/partials/api/'
    end

    # Remove the Introduction repeated several times
    options[:skip] = ['/introduction', '/api/4.1', '/api']

    options[:attribution] = "&copy; Taylor Otwell"
  end
end