source "https://rubygems.org"

gem "rails", github: "rails/rails", branch: "main"

gem "bcrypt", "~> 3.1.7"
gem "bootsnap", require: false
gem "cssbundling-rails"
gem "image_processing", "~> 1.2"
gem "jsbundling-rails"
gem "kamal", ">= 2.0.0.rc2", require: false
gem "loofah"
gem "pg", "~> 1.5"
gem "phlex-rails", "2.0.0.beta2"
gem "propshaft"
gem "puma", ">= 5.0"
gem "rbui", github: "rbui-labs/rbui", branch: "upgrade-to-phlex-v2-beta" # TODO: Upgrade to released version when available
gem "solid_cache"
gem "solid_queue"
gem "solid_cable"
gem "stimulus-rails"
gem "thruster", require: false
gem "turbo-rails"
gem "tzinfo-data", platforms: %i[ windows jruby ]

# gem "jbuilder"

group :development, :test do
  gem "brakeman", require: false
  gem "factory_bot_rails"
  gem "pry"
  gem "pry-rails"
  gem "rubocop-rails-omakase", require: false
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "minitest-rails"
  gem "minitest-spec-rails"
  gem "mocha"
  gem "rails-controller-testing"
  gem "selenium-webdriver"
  gem "shoulda-context"
  gem "shoulda-matchers"
end
