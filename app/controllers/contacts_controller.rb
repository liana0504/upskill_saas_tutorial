class ContactsController < ApplicationController
  def new
    @contact = Contact.new
  end
  
  def create
    @contact = Contact.new(contact_params)
    if @contact.save
      redirect_to new_contact_path, notice: "Thankyou for your feedback!! We'll chat soon."
    else
      redirect_to new_contact_path, notice: "Opps. Something goofed. Let's try that again.."
    end
  end
  
  private
    def contact_params
      params.require(:contact).permit(:name, :email, :comments)
    end
end