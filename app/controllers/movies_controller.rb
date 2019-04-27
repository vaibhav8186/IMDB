# frozen_string_literal: true

# this class is for movies controller
class MoviesController < ApplicationController
  before_action :find_movie, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index allmovies]
  def index
   end

  def addactormovie
    @act_id = params[:actor]
    @mov_id = params[:movie]
    @actor = Actor.find(@act_id)
    a = ActorsMovie.new(actor_id: @act_id, movie_id: @mov_id)
    # a.actor_id = @act_id
    # a.movie_id = @mov_id
    a.save
    redirect_to actor_path(@actor)
  end

  def new
    @movie = Movie.new
  end

  def show
    @actors_movie = ActorsMovie.all
    @actors = Actor.all
  end

  def create
    @movie = Movie.new(movie_param)
    if @movie.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @movie.update(movie_param)
      redirect_to movie_path
    else
      render 'edit'
    end
  end

  def destroy
    @movie.destroy
    @actor_movie.destroy
    redirect_to movie_path
  end

  def find_movie
    @movie = Movie.find(params[:id])
    # @actor_movie = Actor_movie.find(params[:id])
  end

  def allmovies
    @movies = Movie.all
  end

  def not_added_movies
    @movies = Movie.all
  end

  private

  def movie_param
    params.require(:movie).permit(:name, :description, :release, :rating)
  end
end
