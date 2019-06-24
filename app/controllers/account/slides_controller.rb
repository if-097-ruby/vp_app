class Account::SlidesController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def index
    @slides = collection
  end

  def new
    @slide = Slide.new
  end

  def show
    
  end

  def create
    @slide = collection.build(slide_params)
    if @slide.save
      flash.now[:notice] = 'Successfully uploaded.'
      redirect_to account_presentations_path
    else
      flash[:error] = 'Failed to upload a presentation!'
      render 'new'
    end
  end

  def edit
    @slide = resource
  end

  def update
    @slide = resource
    if @slide.update(slide_params)
      flash.now[:notice] = 'Presentation updated!'
      redirect_to account_presentations_path
    else
      flash.now[:error] = 'Failed to update presentation!'
      render :edit
    end
  end

  def destroy
    @slide = resource
    @slide.destroy
    redirect_to account_presentations_path, notice: 'Successfully deleted.'
  end

  private

  def collection
    current_user.presentation.slides
  end

  def slide_params
    params.require(:presentation).permit(:image, :presentation_id)
  end

  def resource
    collection.find(params[:id])
  end

end