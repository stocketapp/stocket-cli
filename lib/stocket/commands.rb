module Stocket
  class Commands
    def self.create_config(env)
      puts "#{Dir.pwd}"
      puts "\n***Exporting #{env} environment variables***\n"
      system "source #{__dir__}/env/#{env}-env.sh && ruby #{__dir__}/create_config.rb"
      puts "\n***Finished creating configuration***"
    end

    def self.start_rn_server(reset)
      system "cd ~/Projects/ReactNative/stocket && npx react-native start#{reset}"
    end

    def self.build_and_run(device_type, device_name, scheme)
      create_config("dev")
      puts "Set environment to DEVELOPMENT"

      system "#{cd_into_project} && npx react-native run-ios #{device_type} #{device_name} --scheme #{scheme}"
    end

    def self.update(env)
      create_config("prod")
      puts "Set environment to PRODUCTION"
      system "#{cd_into_project} && appcenter codepush release-react -a stocketapp/Stocket -d #{env}"
    end

    private

    def self.cd_into_project
      "cd ~/Projects/ReactNative/stocket"
    end
  end
end
