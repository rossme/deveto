class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    # @movies = Movie.pluck(:title).to_a.to_s.tr('[','').tr(']','')
    # @movies_ids = Movie.all.ids
    @movies = Movie.all.map do |movie|
      {
        id: movie.netflixid,
        title: movie.title
      }

    end
  end
end
