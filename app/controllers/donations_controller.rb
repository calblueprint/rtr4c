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
    respond_to do |format|
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

        format.html { redirect_to @donation, notice: 'Donation was successfully created.' }
        format.json { render action: 'show', status: :created, location: @donation }

      else
        format.html { render action: 'new' }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @donations = Donation.all
  end

  def show
    @donation = Donation.find(params[:id])
  end

  def edit
    @donation = Donation.find(params[:id])
  end 

  def update
    @donation = Donation.find(params[:id])
    prev_amt = @donation.amount
    respond_to do |format|
      if @donation.update(:amount => params[:donation][:amount], :message => params[:donation][:message])
        @donor = @donation.donor
        new_amt = @donor.amount.to_i - prev_amt.to_i + params[:donation][:amount].to_i
        @donor.update_attributes(:amount => new_amt)

        format.html { redirect_to @donation, notice: 'Donation was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @donation.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @donation = Donation.find(params[:id])
    @donation.destroy
    respond_to do |format|
      format.html { redirect_to donations_url }
      format.json { head :no_content }
    end
  end
end
