require 'rack-flash'

class ProjectsController < ApplicationController

    use Rack::Flash

    get '/projects' do
        @projects = Project.all
        erb :'projects/projects'
    end

    get '/projects/new' do
        erb :'projects/new'
    end

    post '/projects' do
        if logged_in?
            if params[:client] == '' || params[:summary] == ''
                redirect to '/projects/new'
            else
                @project = Project.new
                @project.client = params[:client]
                @project.summary = params[:summary]
                @project.user_id = params[:project][:user_id].to_i
                
                if @project.save
                    redirect to "/projects/#{@project.id}"
                else
                    redirect to '/projects/new'
                end
            end
        else
            redirect to '/login'
        end   
    end

    get '/projects/:id' do
        @project = Project.find_by_id(params[:id])
        @users = User.all
        erb :'/projects/show'
    end

    get '/projects/:id/edit' do
        @project = Project.find_by_id(params[:id])
        erb :'/projects/edit'
    end

    patch '/projects/:id' do
        @project = Project.find_by_id(params[:id])
        @project.client = params[:client]
        @project.summary = params[:summary]
        @project.user = params[:user_id]
        @project.save

        redirect to "/projects/#{@project.id}"
    end

    delete '/projects/:id' do
        @project = Project.find_by_id(params[:id])
        if @project.user_id == current_user.id
            @project.delete
        end
        redirect to '/projects'
    end

end