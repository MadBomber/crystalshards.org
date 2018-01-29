require "./initializers/**"
require "amber"
require "../src/models/**"
require "../src/controllers/application_controller"
require "../src/controllers/**"
require "uuid"

Amber::Server.configure do |settings|
  settings.logging.colorize = true
  settings.logging.severity = "info"
  settings.logging.context = %w(request headers cookies session params)
  settings.port = ENV["PORT"].to_i if ENV["PORT"]?
  settings.redis_url = ENV["REDIS_URL"] if ENV["REDIS_URL"]?
  settings.database_url = ENV["DATABASE_URL"] if ENV["DATABASE_URL"]?
  settings.session = { "key" => "crystalshards.session", "store" => "signed_cookie", "expires" => 0 }
  settings.logger = ::Logger.new(STDOUT)
end
