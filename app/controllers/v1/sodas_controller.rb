class V1::SodasController < ApplicationController
  def index
    sodas = Soda.all
    render json: sodas.as_json
  end

  def show
    soda = Soda.find_by(id: params[:id])
    render json: soda.as_json
  end

  def create
    soda = Soda.new(
      name: params[:name],
      flavor: params[:flavor],
      carbonated: params[:carbonated],
      price: params[:price]
      )
    if soda.save
      render json: soda.as_json
    else
      render json: {errors: soda.errors.full_messages}
    end
  end

  def update
    soda = Soda.find_by(id: params[:id])
    if soda.update(
    name: params[:name],
    flavor: params[:flavor],
    carbonated: params[:carbonated],
    price: params[:price]
    )
      render json: soda.as_json
    else
      render  json: {errors: soda.errors.full_messages} 
    end
  end

end

