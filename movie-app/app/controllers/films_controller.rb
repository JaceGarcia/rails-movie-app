class FilmsController < ApplicationController
  # index
  def index
   @films = Film.all
 end

 # new
 def new
   @film = Film.new
 end

  # create
  def create
      @film = Film.create!(film_params)
      redirect_to film_path(@film)
  end

 #show
 def show
   @film = Film.find(params[:id])
 end

 # edit
 def edit
   @film = Film.find(params[:id])
 end


 # update
 def update
   @film = Film.find(params[:id])
   @film.update(film_params)

  redirect_to film_path(@film)
 end

 # destroy
 def destroy
   @film = Film.find(params[:id])
   @film.destroy

  redirect_to films_path
 end

 private
 def film_params
   params.require(:film).permit(:title, :genre, :year, :synopsis, :picture)
   end
 end