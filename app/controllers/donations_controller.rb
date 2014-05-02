class DonationsController < ApplicationController

  before_action :authorize, except: [:new, :create]

  def new
    @donation = Donation.new
  end

  def admin_new
    # most of the same as create function. create your own separate function!
  end

  def create
    #no need to use permits if you are not passing in all params!
    if !params[:email].present? || !params[:name].present?
      flash[:error] = "Name, email, and amount are required fields"
      redirect_to contribute_online_path
    else
      @donation = Donation.new(:amount => params[:donation][:amount], :message => params[:donation][:message]) 
      token = params[:stripeToken]
      charge = (@donation[:amount].to_f * 100).to_i
      if @donation.save
        begin
          charge = Stripe::Charge.create(
            :amount => charge,
            :currency => "usd",
            :card => token,
            :description => "Donation from " + params[:email]
          )
        rescue Stripe::InvalidRequestError => e
          flash[:error] = "Invalid donation amount, #{e.message}"
          redirect_to contribute_online_path
        end
        @donor = Donor.find_by(email: params[:email])
        if @donor.nil?
          @donor = Donor.new(:amount => params[:donation][:amount], :email => params[:email], :name => params[:name], :title => params[:title], :profile => params[:profile])
          @donor.donations << @donation
          @donor.save
        else
          new_amt = @donor.amount.to_f + params[:donation][:amount].to_f
          @donor.update_attributes(:amount => new_amt)
          @donor.donations << @donation
          @donor.save
        end
      else
        flash[:error] = "Name, email, and amount are required fields"
        redirect_to contribute_online_path
      end
    end
  end

  def index
    @donations = Donation.includes(:donor).order("donors.name")
    respond_to do |format|
      format.html
      format.xls
    end
  end

  def show
    @donation = set_donation
  end

  def edit
    @donation = set_donation
  end 

  def update
    @donation = set_donation
    prev_amt = @donation.amount
    if @donation.update(:amount => params[:donation][:amount], :message => params[:donation][:message])
      @donor = @donation.donor
      new_amt = @donor.amount.to_f - prev_amt.to_f + params[:donation][:amount].to_f
      @donor.update_attributes(:amount => new_amt)

      redirect_to @donation, notice: 'Donation was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @donation = set_donation
    @donor = @donation.donor
    new_amt = @donor.amount.to_f - @donation.amount.to_f
    @donor.update_attributes(:amount => new_amt)
    @donation.destroy
    redirect_to donations_url
  end

  private
    def set_donation
      @donation = Donation.find(params[:id])
    end
end
