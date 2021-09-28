module Stocket
  def create_config(env)
    puts "#{__dir__}"
    puts "\n***Exporting #{env} environment variables***\n"
    system "source #{__dir__}/env/#{env}-env.sh && ruby #{__dir__}/stocket/create_config.rb"
    puts "\n***Finished creating configuration***"
  end
end
