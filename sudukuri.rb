#!/usr/bin/env ruby

require "dotenv/load"
require_relative "./lib/oyadori"

ESA_TOKEN = ENV["ESA_TOKEN"].freeze
ESA_TEAMNAME = ENV["ESA_TEAMNAME"].freeze
SLACK_WEBHOOK = ENV["SLACK_WEBHOOK"].freeze
ESA_ROOT_CATEGORY = ENV["ESA_ROOT_CATEGORY"].freeze
SLACK_CHANNEL_NAME = ENV["SLACK_CHANNEL_NAME"].freeze

DRY_RUN = !(ENV["DRY_RUN"] || "").empty?

oyadori_options = {
  access_token: ESA_TOKEN,
  current_team: ESA_TEAMNAME,
  slack_webhook: SLACK_WEBHOOK,
  root_category: ESA_ROOT_CATEGORY
}

slack_options = {
  icon_emoji: ':memo:',
  username: 'sudukuri',
  channel: SLACK_CHANNEL_NAME
}

Oyadori.sudukuri(oyadori_options, slack_options, dry_run: DRY_RUN)
