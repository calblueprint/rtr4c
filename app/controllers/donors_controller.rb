class DonorsController < ApplicationController
  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(params[:donor].permit(:amount, :email, :name, :title, :message, :profile))
    token = params[:stripeToken]
    charge = @donor[:amount].to_i * 100
    respond_to do |format|
      if @donor.save
        charge = Stripe::Charge.create(
          :amount => charge,
          :currency => "usd",
          :card => token,
          :description => "Donation from " + @donor.email
        )
        format.html { redirect_to @donor, notice: 'donor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @donor }
      else
        format.html { render action: 'new' }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  def index
    @donors = Donor.all
  end

  def show
    @donor = Donor.find(params[:id])
  end

  def destroy
    @donor = Donor.find(params[:id])
    @donor.destroy
    respond_to do |format|
      format.html { redirect_to donors_url }
      format.json { head :no_content }
    end
  end

end
