class SessionsController < ApplicationController
    def new
    end
    
    def create
        user = User.find_by(username: params[:session][:username])
        if user && user.authenticate(params[:session][:password])
            session[:user_id] = user.id
            flash[:notice] = "Welcome back #{params[:session][:username]}"
            redirect_to root_path
        else
            flash.now[:notice] = "ERROR while logging in"
            render :new
        end
    end

    def destroy
        session[:user_id] = nil
        flash[:notice] = "Logged out successfully"
        redirect_to root_path
    end
end