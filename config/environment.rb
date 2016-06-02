# Load the Rails application.
require File.expand_path('../application', __FILE__)

if Rails.env.development?
  ENV['SECRET_AUTH_TOKEN'] = 'securetoken'
  ENV['SECRET_USER'] = 'albin'
  ENV['SECRET_PASSWORD'] = '12'
end

# Initialize the Rails application.
Rails.application.initialize!

heroku config:set SECRET_AUTH_TOKEN="" SECRET_USER="user" 