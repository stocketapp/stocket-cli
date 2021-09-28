module Stocket
  class Commands
    def self.create_config(env)
      puts "#{Dir.pwd}"
      puts "\n***Exporting #{env} environment variables***\n"
      system "source #{Dir.pwd}/lib/env/#{env}-env.sh && ruby #{__dir__}/create_config.rb"
      puts "\n***Finished creating configuration***"
    end

    def self.start_rn_server(reset)
      system "cd ~/Projects/ReactNative/stocket && npx react-native start#{reset}"
    end

    def self.build_and_run(device_type, device_name, scheme)
      stocket_brand_msg("Building Stocket on #{device_name} using the #{options[:scheme]} scheme.")
      stocket_brand_msg("npx react-native run-ios #{device_type} #{device_name} --scheme #{scheme}")

      system "cd ~/Projects/ReactNative/stocket && npx react-native run-ios #{device_type} #{device_name} --scheme #{scheme}"

      puts_ascii
    end
  end
end
