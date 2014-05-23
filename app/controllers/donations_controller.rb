class DonationsController < ApplicationController

  before_action :authorize, except: [:new, :create]

  def new
    @set_amount = params[:set_amount]
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
      success = true
      token = params[:stripeToken]
      charge = (params[:donation][:amount].to_f * 100).to_i
      begin
        charge = Stripe::Charge.create(
          :amount => charge,
          :currency => "usd",
          :card => token,
          :description => "Donation from " + params[:email]
        )
      rescue => e
        success = false
        flash[:error] = "#{e.message}"
        redirect_to contribute_online_path
      end
      if success
        @donation = Donation.new(:amount => params[:donation][:amount], :message => params[:donation][:message]) 
        if @donation.save
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
          # deliver donation email
          mail_info = {:mail => params[:email], :donor => @donor, :donation => @donation}
          StoreMailer.confirm_donation(mail_info).deliver
          redirect_to confirm_donations_path
        else
          flash[:error] = "Name, email, and amount are required fields"
          redirect_to contribute_online_path
        end
      end
    end
  end

  def confirm
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
