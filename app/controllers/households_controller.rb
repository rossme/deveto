class HouseholdsController < ApplicationController
  before_action :set_household, only: [:show, :random_pick, :start_game, :destroy]

  # As a user i can check the households that I am in
  def index
    @households = current_user.households
  end
  # As a user, within a household I can start the GAME.

  def show
    @userhousehold = UserHousehold.new
    @user_choices = User.where.not(id: @household.users.ids)
  end

  def random_pick
    # 2. if y turn is true do
    # if itsrn - I can chose between 3 randomize options ( the user has 3 turns)
    if params[:pick] == "evil"
      @movie = Movie.where("movies.rating <= 6.0 AND movies.media = 'movie'").sample
    elsif params[:pick] == "danny"
      @movie = Movie.where("movies.rating >= 7.5 AND movies.media = 'movie'").sample
    else params[:pick] == "krazy"
      #TODO add runtime over 80 mins to remove series classed as movies?
      @movie = Movie.where("movies.media = 'movie'").sample
    end
    @household_movie = HouseholdMovie.new(movie: @movie)

    HouseholdChannel.broadcast_to(
      @household,
      { action: 'ramdom_pick', movie_name: @movie.title, sender_id: current_user.id }
    )
  end

  def start_game
    # 3. give points
    @household = Household.find(params[:id])
    @user_playing_household = @household.user_households.find_by(user_turn: true)
    @user_veto = @household.user_households.find_by(user: current_user)
  end

  def veto

    # get the household
    @household = Household.find(params[:id])
    # get the guy using the veto
    @user_veto = @household.user_households.find_by(user: current_user)
    # update number of vetos
    # take points from the user_household
    @user_veto.vetos_remaining -= 1
    if @user_veto.total_points > 0
      @user_veto.total_points -= 1
    end
    @user_veto.save
    # broadcast message to all the user households
    HouseholdChannel.broadcast_to(
      @household,
      { action: 'veto', veto_from: current_user.name, sender_id: current_user.id }
    )

    redirect_to start_game_household_path(@household), notice: 'Veto POWER!!!'
  end

  # As a user I can create groups for watching movies together
  def new
    @household = Household.new
  end

  def create
    @household = Household.new(household_params)
    @household.user = current_user

    if @household.save
      @userhousehold = UserHousehold.new(user_id: current_user.id, household_id: @household.id, vetos_remaining: 1, total_points: 0)
      @userhousehold.save
      redirect_to household_path(@household)
    else
      render :new
    end
  end

  def destroy
    @household.destroy
    redirect_to households_path
  end

  private

  def household_params
    params.require(:household).permit(:name)
  end

  def set_household
    @household = Household.find(params[:id])
  end
end
