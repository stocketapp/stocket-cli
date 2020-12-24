require "stocket/version"
require "thor"
require "colorize"

module Stocket
  class Error < StandardError; end

  class CLI < Thor
    desc "start", "Starts the Stocket React Native server"
    option :reset, :type => :boolean, :default => false, :aliases => "-r"
    def start
      stocket_brand_msg("Starting server")
      puts_ascii
      start_server(options[:reset] ? " --reset-cache" : "")
    end

    desc "run-app", "Build and run the app in the simulator"
    option :scheme, :default => "Development"
    option :device, :type => :boolean, :default => false
    def run_app
      device_type = options[:device] ? "--device" : "--simulator"
      device_name = options[:device] ? "'Henry’s iPhone 11 Pro'" : "'iPhone 12 Pro'"
      
      build_and_run(device_type, device_name, options[:scheme])
    end

    desc "config", "Create config file for Stocket"
    option :env, :default => "dev"
    def config
      create_config(options[:env])
      puts_ascii
    end


    # private methods
    private
    def start_server(reset)
      system "npx react-native start#{reset}"
    end

    def build_and_run(device_type, device_name, scheme)
      stocket_brand_msg("Building Stocket on #{device_name} using the #{options[:scheme]} scheme.")
      stocket_brand_msg("npx react-native run-ios #{device_type} #{device_name} --scheme #{scheme}")

      system "npx react-native run-ios #{device_type} #{device_name} --scheme #{scheme}"

      puts_ascii
    end

    def create_config(env)
      system "sh #{__dir__}/env/#{env}-env.sh"
      puts __dir__
      system "ruby #{__dir__}/stocket/create_config.rb"
    end

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
