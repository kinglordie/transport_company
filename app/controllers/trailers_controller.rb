class TrailersController < ApplicationController
    def index
      @trailers = Trailer.all
    end
  
    def show
      @trailer = Trailer.find(params[:id])
    end
    def new
      @trailer = Trailer.new
    end
    def edit
      @trailer = Trailer.find(params[:id])
    end
    def create
      @trailer = Trailer.new(trailer_params)
      if @trailer.save
        redirect_to trailers_path, notice: 'Прицеп успешно создан.'
      else
        render :new
      end
    end
    def update
      @trailer = Trailer.find(params[:id])
    if @trailer.update(trailer_params)
      redirect_to @trailer
    else
      render :edit
    end
    end
  
    private
  
    def trailer_params
      params.require(:trailer).permit(:car_number, :model, :year, :VIN, :STS, :status, :photo)
    end
  end
  