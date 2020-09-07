class HouseholdMoviesController < ApplicationController
  def index
    @household = Household.find(params[:household_id])
  end

  def create
    @household = Household.find(params[:household_id])
    @household_movie = HouseholdMovie.new(household_movies_params)
    @household_movie.household = @household

    @household_movie.save
    userhousehold = @household.user_households.where(user: current_user).first
    userhousehold.total_points += 10 - @household_movie.movie.rating.to_i
    userhousehold.save
    redirect_to "https://www.netflix.com/watch/#{@household_movie.movie.netflixid}"
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
