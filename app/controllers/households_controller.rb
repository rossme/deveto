class HouseholdsController < ApplicationController
  # As a user i can check the households that I am in
  def index
    @households = current_user.households
  end
  # As a user, within a household I can start the GAME.
  def show
    @household = Household.find(params[:id])
    @userhousehold = UserHousehold.new
  end

  #As a user I can create groups for watching movies together
  def new
    @household = Household.new
  end
  def create
    
    @household = Household.new(household_params)
    if @household.save
      @userhousehold = UserHousehold.new(user_id: current_user.id, household_id: @household.id)
      @userhousehold.save
      redirect_to household_path(@household)
    else
      render :new
    end
  end

  private
  def household_params
    params.require(:household).permit(:name)
  end
end
