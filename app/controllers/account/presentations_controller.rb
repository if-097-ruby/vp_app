class Account::PresentationsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def index
    @presentations = collection
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = collection.build(presentation_params)
    if @presentation.save
      flash.now[:notice] = 'Successfully uploaded.'
      redirect_to account_presentations_path
    else
      flash[:error] = 'Failed to upload a presentation!'
      render 'new'
    end
  end

  def edit
    @presentation = resource
  end

  def update
    @presentation = resource
    if @presentation.update(presentation_params)
      flash.now[:notice] = 'Presentation updated!'
      redirect_to account_presentations_path
    else
      flash.now[:error] = 'Failed to update presentation!'
      render :edit
    end
  end

  def destroy
    @presentation = resource
    @presentation.destroy
    redirect_to account_presentations_path, notice: 'Successfully deleted.'
  end

  private
  
  def collection
    current_user.presentations
  end

  def presentation_params
    params.require(:presentation).permit(:name, :attachment)
  end

  def resource
    collection.find(params[:id])
  end
  
end
