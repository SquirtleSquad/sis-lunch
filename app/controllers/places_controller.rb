class PlacesController < ApplicationController
  respond_to :html, :js
  before_filter :login_required
  
  def index
    @places = @current_user.group.places
    @place = Place.new
    respond_with(@places)
  end
  
  def periodic
    @places = @current_user.group.places
    render :partial => 'places'
  end
  
  def create
    @place = Place.create(params[:place].merge(:person => @current_user))
    @places = @current_user.group.places
  end
  
  def edit
    @place = @current_user.places.find(params[:id])
  end
  
  def update
    @place = @current_user.places.find(params[:id])
    @place.attributes = params[:place]
    @place.save
    
    @places = @current_user.group.places
  end
  
  def destroy
    @place = Place.first(:conditions => {:id => params[:id], :person_id => @current_user})
    @place.destroy
    respond_with(@place)
  end
  
  
end
