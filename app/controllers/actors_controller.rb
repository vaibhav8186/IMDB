# frozen_string_literal: true

# this class contains actors controller methods
class ActorsController < ApplicationController
  before_action :find_actor, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: [:index]
  def index
    @actors = Actor.all
  end

  def show
    @movies = @actor.movies
    @actors_movie = Movie.where('NOT EXISTS (SELECT 1 FROM
    	actors_movies WHERE movie_id = movies.id AND actor_id = ?)', @actor.id)
  end

  def edit; end

  def update
    if @actor.update(actor_params)
      redirect_to actor_path
    else
      render 'edit'
    end
  end

  def new
    @actor = Actor.new
  end

  def create
    @actor = Actor.new(actor_params)
    if @actor.save
      redirect_to actors_path
    else
      render 'new'
    end
  end

  def find_actor
    @actor = Actor.find(params[:id])
  end

  def destroy
    @actor.destroy
    redirect_to actor_path
  end

  private

  def actor_params
    params.require(:actor).permit(:name, :description, :actor_dob)
  end
end
