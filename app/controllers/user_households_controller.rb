class UserHouseholdsController < ApplicationController
    before_action :authenticate_user!


    #as a userhouseholder I can add new users (how?)
    def new
      @userhousehold = Userhousehold.new
    end
    
    
    def create
      @userhousehold = Userhousehold.new(userhousehold_params)

      if @userhousehold.save
        redirect_to household_path(@userhousehold)
      else
        render :new
    end

    def destroy
      
    end

    def user_params
      params.require(:userhousehold).permit(:user, :household)
    end
end
end
