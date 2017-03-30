class ServicesController < ApplicationController
  before_action :set_service, only: [:show, :edit, :update]
  before_action :authenticate_user!, except: [:show, :all]

  def index
    @services = current_user.services
  end

  def all
    @services = Service.all
  end

  def show
    @is_buyer = Order.where("service_id = ? AND user_id = ?", @service.id, current_user.id).present? if current_user

    @reviews = @service.reviews
    @reviewed = @reviews.find_by(user_id: current_user.id) if current_user
  end

  def new
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
    if @service.update(service_params)
      redirect_to @service
    else
      render :edit
    end
  end

  private

  def set_service
    @service = Service.find(params[:id])
  end

  def service_params
    params.require(:service).permit(:title, :description, :price, :requirements, :image)
  end
end
