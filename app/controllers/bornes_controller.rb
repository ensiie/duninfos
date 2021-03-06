class BornesController < ApplicationController
  respond_to :html, :json, :xml

  before_filter :auth, :only => [:create, :update, :destroy]
  
  def index
    if params[:batiment_id] && @batiment = Batiment.find(params[:batiment_id])
      @bornes = @batiment.bornes
    else
      @bornes = Borne.all
    end
    respond_with @bornes
  end
  
  def show
    @borne = Borne.find(params[:id])
    respond_with @borne
  end
  
  def edit
    @borne = Borne.find(params[:id])
    @campuses = Campus.all
    @batiments = Batiment.all
  end
  
  def edit_all
    @batiment = Batiment.find(params[:batiment_id])
    @bornes = @batiment.bornes
  end
  
  def create
    @batiment = Batiment.find(params[:batiment_id])
    respond_with(@batiment.campus, @batiment, @borne = @batiment.bornes.create(params[:borne]), :location => carte_campus_batiment_path(@batiment.campus, @batiment))
  end
  
  def update
    @borne = Borne.find(params[:id])
    @borne.update_attributes(params[:borne])
    respond_with(@borne.batiment.campus, @borne.batiment, @borne)
  end
  
  def destroy
    @borne = Borne.find(params[:id])
    @batiment = @borne.batiment
    @campus = @batiment.campus
    respond_with(@campus, @batiment, @borne.destroy)
  end
end
