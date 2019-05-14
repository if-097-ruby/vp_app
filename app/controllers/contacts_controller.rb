class ContactsController < ApplicationController
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      ContactsMailer.general_message(@contact).deliver
      render :create
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end
    
end