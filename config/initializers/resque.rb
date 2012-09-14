ENV["REDISTOGO_URL"] ||= "redis://astein13:086ffbc0edf830a58f707899a949c5b3@barb.redistogo.com:9218"

uri = URI.parse(ENV["REDISTOGO_URL"])
Resque.redis = Redis.new(:host => uri.host, :port => uri.port, :password => uri.password, :thread_safe => true)

Dir["#{Rails.root}/app/jobs/*.rb"].each { |file| require file }