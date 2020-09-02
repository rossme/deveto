class HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :random_pick, :start_game]

  # As a user i can check the households that I am in
  def index
    @households = current_user.households
  end
  # As a user, within a household I can start the GAME.
  def show
  end

  def random_pick

    # if its my turn - I can chose between 3 randomize options ( the user has 3 turns)
    if params[:pick] == "danny"
      @movie = Movie.where("movies.imdb_rating > 7.5").sample

    elsif params[:pick] == "crazy"
      @movie = Movie.where("movies.imdb_rating < 7.5").sample

    else params[:pick] == "evil"
      @movie = Movie.all.sample
    end
  end

  def start_game
    @household = Household.find(params[:id])
    @userhousehold = UserHousehold.new
  end

  #As a user I can create groups for watching movies together
  def new
    @household = Household.new
  end
  def create

    @household = Household.new(household_params)
    @household.user = current_user

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

  def set_household
    @household = Household.find(params[:id])
  end
end
