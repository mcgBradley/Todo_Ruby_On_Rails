class SessionsController < ApplicationController
    def new
    
    end

    def create
        current_email = params[:session][:email]
        redirect_to root_path
    end
end