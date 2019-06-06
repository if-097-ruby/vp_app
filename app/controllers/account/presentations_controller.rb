class Account::PresentationsController < ApplicationController
  layout 'dashboard'

  def index
    @presentations = Presentation.all
  end

  def new
    @presentation = Presentation.new
  end

  def create
    @presentation = Presentation.new(presentation_params)
    if @presentation.save
      flash.now[:notice] = 'Successfully uploaded.'
      redirect_to account_presentations_path
    else
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
    @presentation = Presentation.find(params[:id])
    @presentation.destroy
    redirect_to account_presentations_path, notice: 'Successfully deleted.'
  end

  private

  def presentation_params
    params.require(:presentation).permit(:name, :attachment)
  end

  def resource
    Presentation.find(params[:id])
  end
  
end
