class UsersController < ApplicationController



    # def self.slug
    #     a = self.paramatize 
    #     a 
    #      end
     

    get '/signup' do
     # binding.pry
        if logged_in?
            redirect '/tweets'
         
        else
           
         erb :"/users/create_user" 
        end
      end

      post '/signup' do
        
        @user = User.new(username: params["username"], email: params["email"], password: params["password"])
        if @user.save
            session[:user_id] = @user.id
          #  binding.pry
            redirect '/tweets'
        else
           redirect '/signup'
        end
      end

      get '/login' do
        if logged_in?
            redirect '/tweets'
        else
        
        erb :"/users/login"
        end
      end

      post '/login' do
     
        user = User.find_by(username: params["username"])
        if !!user && !!user.authenticate(params["password"])
        session[:user_id] = user.id
         # binding.pry
        redirect "/tweets"
        else
            redirect '/login'
      end
    end


    get '/users/:slug' do
     
      name = User.find_by_slug(params["slug"])
      @tweets = name.tweets
      erb :"/users/show"
     # binding.pry
    end
  
   

    get '/logout' do
    #  binding.pry
        logout!
        redirect '/login'
    end

end
