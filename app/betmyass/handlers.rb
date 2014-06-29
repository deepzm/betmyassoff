


require 'sinatra'
require 'haml'
require 'haml/options'

require 'betmyass/model/user'

module BetMyAss 
  class Application  < Sinatra::Base

    configure do
      set :session_secret, "My session secret"
      set :sessions => true
      enable :sessions
      Haml::Options.defaults[:format] = :html5
    end

    register do
        def auth (type)
          condition do
            redirect "/login" unless send("is_#{type}?")
          end
        end
    end

    helpers do
      def is_user?
        @user != nil
      end
    end

    before do
      @user = BetMyAss::Model::User.get(session[:user_id])
    end

    get '/' do
      redirect "/app"
    end


    get '/app', :auth => :user do
      haml :index
      # File.read(File.join('public/html', 'index.html'))
    end

    get "/login" do
      haml :login
    end

    post "/login" do
      @msg = ""
      puts "user login #{params}"
      user = 
      BetMyAss::Model::User.authenticate(
        params['user']['username'],
        params['user']['password']
        )
      if !user.nil? 
        session[:user_id] = user.id
        redirect "/app"
      else
        @msg = "Login failed!!!"

        haml :login
      end
    end

    get "/logout" do
      puts "Logging out"
      session[:user_id] = nil
      redirect '/login'
    end

  end

end