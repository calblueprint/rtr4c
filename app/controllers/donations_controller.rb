class DonationsController < ApplicationController
  def new
    @donation = Donation.new
  end

  def admin_new
    # most of the same as create function. create your own separate function!
  end

  def create
    @donation = Donation.new(params[:donation].permit(:amount, :email, :name, :title, :message, :profile))
    token = params[:stripeToken]
    charge = @donation[:amount].to_i * 100
    respond_to do |format|
      if @donation.save
        charge = Stripe::Charge.create(
          :amount => charge,
          :currency => "usd",
          :card => token,
          :description => "Donation from " + @donation.email
        )
        @donor = Donor.find(email: params[:email])
        if @donor.nil?
          Donor.create(params[:amount], params[:email], params[:name], params[:title], params[:profile])
          Donor.donations << @donation
        else
          new_amt = @donor[:amount].to_i + params[:amount]
          @donor.update_attributes(:amount => new_amt)
          @donor.donations << @donation
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

  def update
    @donation = Donation.find(params[:id])
    respond_to do |format|
      if @donation.update(params[:donation].permit(:amount, :email, :name, :title, :message, :profile))
        format.html { redirect_to @donation, notice: 'Donor was successfully updated.' }
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
