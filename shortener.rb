require 'sinatra'
require 'active_record'
require 'pry'

###########################################################
# Configuration
###########################################################

set :public_folder, File.dirname(__FILE__) + '/public'

configure :development, :production do
    ActiveRecord::Base.establish_connection(
       :adapter => 'sqlite3',
       :database =>  'db/dev.sqlite3.db'
     )
end

# Handle potential connection pool timeout issues
after do
    ActiveRecord::Base.connection.close
end

###########################################################
# Models
###########################################################
# Models to Access the database through ActiveRecord.
# Define associations here if need be
# http://guides.rubyonrails.org/association_basics.html

class Link < ActiveRecord::Base
end

###########################################################
# Routes
###########################################################
get '/' do
  @links = Link.select("short_url")
  erb :index
end

get '/new' do
  erb :form
end

post '/new' do
	if Link.exists?(url: params[:url])
		@links = Link.select("short_url")
		erb :index
	else
		# PUT CODE HERE TO CREATE NEW SHORTENED LINKS
		@url = params[:url]
		rand = rand(url.length-5)
		@short_url = @url.split("").slice(3, 8).join("")
	  erb :layout do Link.create(url: @url, short_url: @short_url) end 
	end
end

# MORE ROUTES GO HERE

get '/:short_url' do
	short_url = Link.where(short_url: params[:short_url])[0].url
  redirect short_url
end



