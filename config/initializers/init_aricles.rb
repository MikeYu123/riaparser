require 'rss'
require 'open-uri'

page_string = String.new
url = 'http://ria.ru/docs/about/rss.html'
require 'open-uri'
class Feedjira::Parser::ITunesRSSItem
  element 'category', :as => :category
end
open(url) do |f|
  page_string = f.read
end
urls = page_string.scan(/http\S*rss\S*.xml/).uniq
urls.each do |uri|
  begin
    feed = Feedjira::Feed.fetch_and_parse uri
    feed.entries.each do |item|
      @article = Article.new
      @article.title = item.title
      @article.link = item.url
      @article.description = item.summary
      @article.published = item.published
      @article.enc_url = item.enclosure_url
      @article.category = Category.find_or_create_by(name: item.category)
      @article.save
    end
  rescue Faraday::ConnectionFailed => e
    next
  end
end
