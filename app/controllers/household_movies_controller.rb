class HouseholdMoviesController < ApplicationController
  def index
    @household = Household.find(params[:household_id])
  end

  def create
    @household = Household.find(params[:household_id])
    @household_movie = HouseholdMovie.new(household_movies_params)
    @household_movie.household = @household

    @household_movie.save
    @household.users.each do |user|
      userhousehold = @household.user_households.where(user: user).first
      userhousehold.total_points += 10 - @household_movie.movie.rating.to_i if userhousehold.total_points
      if userhousehold.total_points % 5 == 0
        userhousehold.vetos_remaining += 1
      end
      userhousehold.save
    end


    user_playing = @household.user_households.sample
    # @ or no @
    @household.user_households.update_all(user_turn: false)
    user_playing.update(user_turn: true)
    redirect_to "https://www.netflix.com/watch/#{@household_movie.movie.netflixid}"
    # ACTION CABLE BROADCAST BELOW
    # HouseholdChannel.broadcast_to(
    # @household,
    #   render_to_string(notice: "Movie has been picked, veto now?")
    # )
  end

  # As a user I will wait for 30 seconds for someone to veto the movie
  def show
    @household = Household.find(params[:household_id])
    @household_movies = HouseholdMovies.find(params[:id])

    # if its my turn - As a user I will wait for 30 seconds for someone to veto the movie

    # else  I can use my Veto within the time limit
  end

  private

  def household_movies_params
    params.require(:household_movie).permit(:movie_id) #:randomize_id?
  end
end

