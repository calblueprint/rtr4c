class ContactsController < ApplicationController

  def index
    @contacts = Contact.all
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(:fname => params[:contact][:fname], :lname => params[:contact][:lname], :email => params[:contact][:email], :phone => params[:contact][:phone], :message => params[:contact][:message])
    if @contact.save
      render action: 'create'
    end
  end

  def show
    @contact = set_contact
  end

  def destroy
    @contact = set_contact
    @contact.destroy
    redirect_to contacts_url
  end

  private
    def set_contact
      @contact = Contact.find(params[:id])
    end

end
