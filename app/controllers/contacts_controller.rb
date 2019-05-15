class ContactsController < ApplicationController
  add_flash_types :success
  
  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    
    if @contact.save
      ContactsMailer.general_message(@contact).deliver_now
      redirect_to root_path, success: "Message was successfully delivered"
    else
      render :new
    end
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end