require 'pry'
require 'pry-rails'
require 'pry-doc'
require 'pry-byebug'
require 'awesome_print'
require 'dotenv-rails'

if Rails.env.development?
  require 'better_errors'
  require 'binding_of_caller'
  require 'letter_opener'
end

AwesomePrint.pry!

module DevTools
  class Railtie < Rails::Railtie
    config.before_initialize do
      Rails.application.configure do
        config.action_mailer.delivery_method = :letter_opener if Rails.env.development?
      end
    end
  end
end
