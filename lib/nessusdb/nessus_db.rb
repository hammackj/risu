ActiveRecord::Base.establish_connection(YAML::load(File.open('database.yml')))  

# normally disabled due to peformance, enable for debugging
#ActiveRecord.colorize_logging = false
#ActiveRecord::Base.logger = Logger.new("db.log")