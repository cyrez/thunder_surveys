logger = Logger.new('log/development.log')

 if defined?(PhusionPassenger)
    PhusionPassenger.on_event(:starting_worker_process) do |forked|
      MongoMapper.connection.connect_to_master if forked
    end
 end

if ENV['MONGOHQ_URL']
  MongoMapper.config = {RAILS_ENV => {'uri' => ENV['MONGOHQ_URL']}}
  MongoMapper.connect(RAILS_ENV)

  # elsif ENV['MONGO_URL']
  #   MongoMapper.config = {RAILS_ENV => {'uri' => ENV['MONGO_URL']}}
  #   MongoMapper.connect(RAILS_ENV)  

else
  MongoMapper.config = {RAILS_ENV => {'uri' => 'mongodb://localhost:27017/meedan-qfi-surveys'}}
  MongoMapper.connect(RAILS_ENV)
end


