require "stocket/version"
require "thor"
require "colorize"

module Stocket
  class Error < StandardError; end

  class CLI < Thor
    desc "start", "Starts the Stocket React Native server"
    option :reset, :type => :boolean, :default => false, :aliases => "-r"
    def start
      puts "

        ███████╗████████╗ ██████╗  ██████╗██╗  ██╗███████╗████████╗
        ██╔════╝╚══██╔══╝██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
        ███████╗   ██║   ██║   ██║██║     █████╔╝ █████╗     ██║   
        ╚════██║   ██║   ██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
        ███████║   ██║   ╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
        ╚══════╝   ╚═╝    ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
                                                                  
      ".green
      puts "Stocket - ".green + "Starting server"
      start_server(options[:reset] ? "--reset-cache" : "")
    end

    desc "build", "Build the app"
    option :scheme, :default => "Development"
    option :device => :boolean, :default => false
    def build
      device_type = options[:device] ? "--device" : "--simulator"
      device_name = options[:device] ? "'Henry’s iPhone 11 Pro'" : "iPhone 12 Pro"
      
      puts "Building Stocket on #{device_name} using the #{options[:scheme]}"
      build_app(device_type, device_name, options[:scheme])
    end

    private
    def start_server(reset)
      system "yarn start"
    end

    def build_app(device_type, device_name, scheme)
      system "npx react-native run-ios #{device_type} #{device_name} --scheme #{scheme}"
    end

    def self.exit_on_failure?
      true
    end
  end
end
