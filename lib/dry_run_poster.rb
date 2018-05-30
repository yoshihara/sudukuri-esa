class DryRunPoster
  def initialize(_webhook, options)
    @options = options
  end

  def send_message(text)
    username = @options[:username]
    icon_emoji = @options[:icon_emoji]
    channel = @options[:channel]

    message = <<MESSAGE
============================================================
#{username} (#{icon_emoji}) post message to #{channel}

#{text}


MESSAGE
    $stdout.puts(message)
  end
end
