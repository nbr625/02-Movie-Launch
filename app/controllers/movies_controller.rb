class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :romance, :action, :animated, :new_release]

  def search
    if params[:serach].present?
      @movies = Movie.search(params[:search])
    else
      @movies = Movie.all
    end
  end


  def index
    @movies = Movie.all
    @new_releases = @movies.where(new_release: true)
    @romance_movies = @movies.where(genre: "Romance")
    @action_movies = @movies.where(genre: "Action")
    @animated_movies = @movies.where(genre: "Animated")
    @comedy_movies = @movies.where(genre: "Comedy")
  end

  def new_release
    @new_releases = Movie.where(new_release: true)
  end

  def romance
    @romance_movies = Movie.where(genre: "Romance")
  end

  def action
    @action_movies = Movie.where(genre: "Action")
  end

  def animated
    @animated_movies = Movie.where(genre: "Animated")
  end
  def comedy
    @comedy_movies = Movie.where(genre: "Comedy")
  end
 
  def show
    @reviews = Review.where(movie_id: @movie.id).order("created_at DESC")

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating).round(2)
    end
  end

  def new
    @movie = current_user.movies.build
  end
  
  def edit
  end


  def create
    @movie = current_user.movies.build(movie_params)

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render :show, status: :created, location: @movie }
      else
        format.html { render :new }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { render :show, status: :ok, location: @movie }
      else
        format.html { render :edit }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  
  
  def destroy
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url, notice: 'Movie was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    
    def set_movie
      @movie = Movie.find(params[:id])
    end

    def movie_params
      params.require(:movie).permit(:title, :description, :movie_length, :director, :rating, :image, :new_release, :genre, :grade, :year)
    end
end
