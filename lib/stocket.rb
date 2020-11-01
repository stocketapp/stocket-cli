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

    desc "build", "Build the app"
    option :scheme, :default => "Development"
    option :device => :boolean, :default => false
    def build
      device_type = options[:device] ? "--device" : "--simulator"
      device_name = options[:device] ? "'Henry’s iPhone 11 Pro'" : "'iPhone 12 Pro'"
      
      build_app(device_type, device_name, options[:scheme])
    end

    private
    def start_server(reset)
      system "npx react-native start#{reset}"
    end

    def build_app(device_type, device_name, scheme)
      stocket_brand_msg("Building Stocket on #{device_name} using the #{options[:scheme]} scheme.")
      stocket_brand_msg("npx react-native run-ios #{device_type} #{device_name} --scheme #{scheme}")

      system "npx react-native run-ios #{device_type} #{device_name} --scheme #{scheme}"

      puts_ascii
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
