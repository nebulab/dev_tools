require 'pry'
require 'pry-rails'
require 'pry-doc'
require 'pry-byebug'
require 'awesome_print'

require 'letter_opener' if Rails.env.development?
require 'dotenv-rails' if Rails.env.development? || Rails.env.test?

AwesomePrint.pry!

module DevTools
  class Railtie < Rails::Railtie
    config.action_mailer.delivery_method = :letter_opener if Rails.env.development?

    initializer 'dev_tools.initialize' do
      Pry.config.should_load_rc = false

      parent_name = if Rails::VERSION::MAJOR >= 6
                      Rails.application.class.module_parent_name
                    else
                      Rails.application.class.parent_name
                    end

      Pry::Prompt.add(
        "\001\e[1;32m\002#{parent_name.downcase}\001\e[0m\002/\001\e[1;31m\002#{Rails.env.downcase}",
        'Includes the current Rails environment.',
        %w[> <]
      ) do |target_self, nest_level, pry, sep|
        "[#{pry.input_array.size}] " \
        "#{Pry.config.prompt_name} \001\e[0m\002(\001\e[0;33m\002#{Pry.view_clip(target_self)}" \
        "\001\e[0m\002) #{":#{nest_level}" unless nest_level.zero?}#{sep} "
      end
    end
  end
end
