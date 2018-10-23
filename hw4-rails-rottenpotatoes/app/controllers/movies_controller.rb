class MoviesController < ApplicationController
  def movie_params
    params.require(:movie).permit(:title, :rating, :description, :release_date)
  end

  def index
    sort = params[:sort] || session[:sort]

    @all_ratings = Movie.all_ratings
    @selected_ratings = params[:ratings] || session[:ratings] || {}

    if @selected_ratings == {}
      @selected_ratings = Hash[@all_ratings.map {|rating| [rating, 1]}]
    end

    if params[:sort] != session[:sort] or params[:ratings] != session[:ratings]
      session[:sort] = sort
      session[:ratings] = @selected_ratings
    end
    @movies = Movie.where(rating: @selected_ratings.keys).order(sort)
  end

  def show
    id = params[:id]
    @movie = Movie.find(id)
    # will render app/views/movies/show.<extension> by default
  end

  def new
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.save
    redirect_to movie_path(@movie)
    # 也可以写作 redirect_to @movie
    # 因为不会有歧义，所以两者作用相同，index 页面中的 about 链接同理
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
    if @movie.update_attributes!(params[:movie])
      flash[:notice] = "#{@movie.title} was successfully updated."
      redirect_to movie_path(@movie)
    else
      redirect_to edit_movie_path
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    flash[:notice] = "Movie '#{@movie.title}' deleted."
    redirect_to movies_path
  end
end