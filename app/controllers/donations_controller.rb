class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def admin_new
    # most of the same as create function. create your own separate function!
  end

  def create
    #no need to use permits if you are not passing in all params!
    @donation = Donation.new(:amount => params[:donation][:amount], :message => params[:donation][:message]) 
    token = params[:stripeToken]
    charge = @donation[:amount].to_i * 100
    if @donation.save
      charge = Stripe::Charge.create(
        :amount => charge,
        :currency => "usd",
        :card => token,
        :description => "Donation from " + params[:email]
      )
      @donor = Donor.find_by(email: params[:email])
      if @donor.nil?
        @donor = Donor.new(:amount => params[:donation][:amount], :email => params[:email], :name => params[:name], :title => params[:title], :profile => params[:profile])
        @donor.donations << @donation
        @donor.save
      else
        new_amt = @donor.amount.to_i + params[:donation][:amount].to_i
        @donor.update_attributes(:amount => new_amt)
        @donor.donations << @donation
        @donor.save
      end
      redirect_to @donation, notice: 'Donation was successfully created.'
    else
      render action: 'new'
    end
  end

  def index
    @donations = Donation.all
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
      new_amt = @donor.amount.to_i - prev_amt.to_i + params[:donation][:amount].to_i
      @donor.update_attributes(:amount => new_amt)

      redirect_to @donation, notice: 'Donation was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @donation = set_donation
    @donor = @donation.donor
    new_amt = @donor.amount.to_i - @donation.amount.to_i
    @donor.update_attributes(:amount => new_amt)
    @donation.destroy
    redirect_to donations_url
  end

  private
    def set_donation
      @donation = Donation.find(params[:id])
    end
end
