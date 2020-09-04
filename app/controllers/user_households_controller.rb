class UserHouseholdsController < ApplicationController
    before_action :authenticate_user!

    #as a userhouseholder I can add new users (how?)
    def new
      @userhousehold = UserHousehold.new
    end

    def create
      @user = User.where(email: params[:user_household][:user]).first
      @userhousehold = UserHousehold.new(household_id: params[:household_id], user_id: @user.id)

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
