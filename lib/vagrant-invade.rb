require 'bundler'

begin
  require 'vagrant'
rescue LoadError
  Bundler.require(:default, :development)
end

require 'vagrant-invade/plugin'

module VagrantPlugins
  module Invade

    require 'vagrant-invade/version'

    autoload :Validator, 'vagrant-invade/validator'
    autoload :Builder, 'vagrant-invade/builder'
    autoload :Generator, 'vagrant-invade/generator'

    def self.get_invade_config

      #Loading Invade configuration settings from file
      invade_config_file = Dir.pwd + '/invade.yml'

      if File.exists?(invade_config_file)
        begin
          return YAML.load_file(invade_config_file)
        rescue SyntaxError => e
          @logger.error e
          fail e
        end
      else
        @config_values = nil
      end

      @config_values
    end
  end
end
