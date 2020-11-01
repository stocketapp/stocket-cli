#!/usr/bin/env ruby

require 'thor'
require 'colorize'


class CLI < Thor
  @build_command = 
  desc "start", "Starts the Stocket React Native server"
  def start
    puts "

    ███████╗████████╗ ██████╗  ██████╗██╗  ██╗███████╗████████╗
    ██╔════╝╚══██╔══╝██╔═══██╗██╔════╝██║ ██╔╝██╔════╝╚══██╔══╝
    ███████╗   ██║   ██║   ██║██║     █████╔╝ █████╗     ██║   
    ╚════██║   ██║   ██║   ██║██║     ██╔═██╗ ██╔══╝     ██║   
    ███████║   ██║   ╚██████╔╝╚██████╗██║  ██╗███████╗   ██║   
    ╚══════╝   ╚═╝    ╚═════╝  ╚═════╝╚═╝  ╚═╝╚══════╝   ╚═╝   
                                                              
    ".green
    system "yarn start"
  end
end

StocketCLI.start(ARGV)