require 'rack-flash'

class UsersController < ApplicationController
    use Rack::Flash

    get '/about' do
        erb :'/users/about'
    end

    get '/users' do
        @users = User.all
        erb :'users/users'
    end

    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        erb :'/users/show'
    end

    # get '/users/:slug' do
    #     @user = User.find_by_slug(params[:slug])
    #     erb :'/users/show'
    # end

    get '/signup' do
        if !logged_in?
            erb :'users/signup', locals: {message: "Please sign up before you login."}
        else
            redirect to '/projects'
        end
    end

    post '/signup' do
        if params[:username] == '' || params[:email] == '' || params[:password] == '' || params[:level] == '' || params[:discipline] == ''
            redirect to '/signup'
        else
            @user = User.new(username: params[:username], email: params[:email], password: params[:password], level: params[:level], discipline: params[:discipline])
            @user.save
            session[:user_id] = @user.id
            session[:username] = @user.username
            redirect to '/projects'
        end
    end

    get '/login' do
        if !logged_in?
            erb :'users/login'
        else
            redirect to '/projects'
        end
    end

    post '/login' do
        @user = User.find_by(username: params[:username])
        if @user.authenticate(params[:password])#@user.password_digest == params[:password]
            session[:user_id] = @user.id
            session[:username] = @user.username
            redirect to '/projects'
        else
            redirect to '/signup'
        end
    end

    get '/users/:id/edit' do
        @user = User.find_by_id(params[:id])
        erb :'/users/edit'
    end

    patch '/users/:id' do
        @user = User.find_by_id(params[:id])
        @user.update(level: params[:level], discipline: params[:discipline])
        erb :'/users/show'

    end

    get '/logout' do
        if logged_in?
            session.destroy
            erb :index
        end
    end
end
