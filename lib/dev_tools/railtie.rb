require 'pry'
require 'pry-rails'
require 'pry-doc'
require 'pry-byebug'
require 'awesome_print'

if Rails.env.development?
  require 'quiet_assets'
  require 'better_errors'
  require 'binding_of_caller'
  require 'letter_opener'
end

AwesomePrint.pry!

module DevTools
  class Railtie < Rails::Railtie
    config.action_mailer.delivery_method = :letter_opener if Rails.env.development?

    initializer 'dev_tools.initialize' do |app|
      Pry.config.should_load_rc = false

      Pry.config.prompt_name = "\001\e[1;32m\002#{Rails.application.class.parent_name.downcase}\001\e[0m\002/\001\e[1;31m\002#{Rails.env.downcase}"

      Pry.prompt = [
        proc { |target_self, nest_level, pry|
          "[#{pry.input_array.size}] #{Pry.config.prompt_name} \001\e[0m\002(\001\e[0;33m\002#{Pry.view_clip(target_self)}\001\e[0m\002) #{":#{nest_level}" unless nest_level.zero?}> "
        },
        proc { |target_self, nest_level, pry|
          "[#{pry.input_array.size}] #{Pry.config.prompt_name} \001\e[0m\002(\001\e[0;33m\002#{Pry.view_clip(target_self)}\001\e[0m\002) #{":#{nest_level}" unless nest_level.zero?}< "
        }
      ]
    end
  end
end
