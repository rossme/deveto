class UserHouseholdsController < ApplicationController
    before_action :authenticate_user!


    #as a userhouseholder I can add new users (how?)
    def new
      @userhousehold = UserHousehold.new
    end

    def create
      @user = User.find(params[:user_household][:user])
      #its working if we create a new household but if we add more than 1 member it will be user turn true for all the ones added
      @userhousehold = UserHousehold.new(household_id: params[:household_id], user_id: @user.id, vetos_remaining: 2, total_points: 10, user_turn: true)

      @household = Household.find(params[:household_id])

      if @userhousehold.save
        redirect_to household_path(@household)
      else
        render :new
      end
    end

    def destroy
      @household = Household.find(params[:household_id])
      @userhousehold = UserHousehold.find(params[:id])
      @userhousehold.destroy
      redirect_to household_path(@household)
    end

end
