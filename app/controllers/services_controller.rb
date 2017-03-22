class ServicesController < ApplicationController
  before_action :authenticate_user!, except: [:show]

  def index
    @services = current_user.services
  end

  def show
    @service = Service.find(params[:id])
  end

  def new
    # @service = Service.new
    @service = current_user.services.build
  end

  def create
    @service = current_user.services.build(service_params)

    if @service.save
      redirect_to @service
    else
      # previous @service object is passed to template so errors can appear on the form
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def service_params
    params.require(:service).permit(:title, :description, :price, :requirements, :image)
  end
end
