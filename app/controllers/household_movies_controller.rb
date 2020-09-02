class HouseholdMoviesController < ApplicationController

  def index

    @household = Household.find(params[:household_id])
    @danny_deveto = Movie.all.sample # best movies
    @evil_deveto = Movie.all.sample # worst movies
    @kamikaze = Movie.all.sample # all movies

    # passar 1 movie para o link (esse link vai para o create)

    # else I can see who's turn is it
  end

  def create
    @household = Household.find(params[:household_id])
    @household_movies = HouseholdMovies.new(household_movies_params)

    if @household_movies.save
      redirect_to household_household_movies_path
    else
      render :new
    end
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
      params.require(:household_movies).permit(:movies_id, :household_id) #:randomize_id?
    end
end
