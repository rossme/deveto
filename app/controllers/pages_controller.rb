class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @movies = Movie.pluck(:title).to_a.to_s.tr('[','').tr(']','')
  end
end
