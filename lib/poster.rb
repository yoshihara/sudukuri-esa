require "slack/poster"
require_relative "./dry_run_poster"

class Poster
  def initialize(dry_run, webhook, options)
    if dry_run
      @poster = DryRunPoster.new(webhook, options)
    else
      @poster = Slack::Poster.new(webhook, options)
    end
  end

  def post(text)
    @poster.send_message(text)
  end
end
