require "esa"
require "date"
require_relative "./poster"

class Oyadori
  MAX_POST_COUNT = 50

  def self.sudukuri(*args)
    new(*args).sudukuri
  end

  def initialize(options, slack_options, dry_run: false)
    slack_webhook = options.delete(:slack_webhook)
    @root_category = options.delete(:root_category).gsub(/\/$/, "")

    @client = Esa::Client.new(options)
    @poster = Poster.new(dry_run, slack_webhook, slack_options)
  end

  def sudukuri
    today = Time.now.utc.to_date
    date = today.prev_day

    category = "#{@root_category}/#{date.strftime("%Y/%m/%d")}"
    $stdout.puts "#{category} の記事を取得します"

    posts = @client.posts(q: "in:#{category}", per_page: MAX_POST_COUNT).body["posts"]

    posts.each do |post|
      @poster.post(content(post))
      @poster.post(delimiter)
      print "."
    end
  end

  private

  def delimiter
    ":heavy_minus_sign: " * 15
  end

  def content(post)
    body = post["body_md"].gsub("\r\n", "\n")
    link = "<#{post['url']}|#{post['full_name']}>"

    ":esa: #{link} :esa: \n#{body}"
  end
end
