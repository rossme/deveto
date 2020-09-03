class UserHouseholdsController < ApplicationController
    before_action :authenticate_user!

    #as a userhouseholder I can add new users (how?)
    def new
      @userhousehold = UserHousehold.new
    end


    def create
      @user = User.where(email: params[:user_household][:user]).first
      @adminuser = User.find(UserHousehold.find(params[:id]).user_id).email

      if @user == @adminuser
        @userhousehold = UserHousehold.new(household_id: params[:household_id], user_id: @user.id)
        #@userhousehold = UserHousehold.new(household_id: params[:household_id], user_id: @adminuser.id)
        @household = Household.find(params[:household_id])

        @userhousehold.save
        redirect_to household_path(@household)
      else
        render :new
      end
    end

    def points
      if params[:pick] == "watch"
        point = 10 - @movie.rating.to_i

        # update leaderboard
      end
    end

    def destroy
    end

   # def userhousehold_params
    #  params.require(:user_household).permit(:user)
    #end

end
