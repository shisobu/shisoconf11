get '/script.js' do
  coffee :script
end

get '/' do
  @pusherkey ||= ENV['PUSHER_KEY']
  haml :index
end
