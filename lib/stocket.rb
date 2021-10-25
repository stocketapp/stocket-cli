require "stocket/version"
require "thor"
require "colorize"
require "stocket/commands"

module Stocket
  class Error < StandardError; end
  
  class CLI < Thor
    desc "start", "Starts the Stocket React Native server"
    option :reset, :type => :boolean, :default => false, :aliases => "-r"
    def start
      stocket_brand_msg("Starting server")
      puts_ascii
      Commands.start_rn_server(options[:reset] ? " --reset-cache" : "")
    end

    desc "ios", "Build and run the app in the iOS simulator"
    option :scheme, :default => "Development"
    option :device, :type => :boolean, :default => false
    def ios
      device_type = options[:device] ? "--device" : "--simulator"
      device_name = options[:device] ? "'Henry’s iPhone 11 Pro'" : "'iPhone 13 Pro'"
      stocket_brand_msg("Building Stocket on #{device_name} using the #{options[:scheme]} scheme.")
      stocket_brand_msg("npx react-native run-ios #{device_type} #{device_name} --scheme #{options[:scheme]}")
      
      Commands.build_and_run(device_type, device_name, options[:scheme])
      puts_ascii
    end

    desc "config", "Create config file for Stocket"
    option :env, :default => "dev"
    def config
      Commands.create_config(options[:env])
      puts_ascii
    end

    desc "server", "Start Rails Server"
    def server
      system "cd ~/Projects/Stocket/stocket-api && rails s"
    end

    desc "update", "OTA update. Options available: Staging, Production"
    option :env
    def update
      Commands.update(options[:env])
    end

    # private methods
    private

    def stocket_brand_msg(msg)
      puts "Stocket - ".green + msg
    end

    def puts_ascii
      puts "

        ███████╗████████╗ ██████╗  ██████╗██╗  ██╗███████╗████████╗
        ██╔════╝╚══██╔══╝██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
        ███████╗   ██║   ██║   ██║██║     █████╔╝ █████╗     ██║   
        ╚════██║   ██║   ██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
        ███████║   ██║   ╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
        ╚══════╝   ╚═╝    ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
                                                                  
      ".green
    end

    def self.exit_on_failure?
      true
    end

    def self.clear
      system "clear"
      puts_ascii
    end
  end
end
