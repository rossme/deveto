class UserHouseholdsController < ApplicationController
    before_action :authenticate_user!

    #as a userhouseholder I can add new users (how?)
    def new
      @userhousehold = UserHousehold.new
    end

    def create
      @user = User.find(params[:user_household][:user])
      @userhousehold = UserHousehold.new(household_id: params[:household_id], user_id: @user.id, vetos_remaining: 5, total_points: 6)

      @household = Household.find(params[:household_id])

      if @userhousehold.save
        redirect_to household_path(@household)
      else
        render :new
      end
    end

    def destroy
    end

   # def userhousehold_params
    #  params.require(:user_household).permit(:user)
    #end

end
