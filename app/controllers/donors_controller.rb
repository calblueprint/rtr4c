class DonorsController < ApplicationController
  # tier amounts
  @@gold_tier = 500.0
  @@silver_tier = 250.0
  @@bronze_tier = 50.0

  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(donor_params)
    if @donor.save
      redirect_to @donor, notice: 'Donor was successfully created.'
    else
      render action: 'new'
    end
  end

  def index
    # need to do donation tiers
    @donors = Donor.all
    @golds = []
    @silvers = []
    @bronzes = []
    @nonmedals = []
    @donors.each do |donor|
      if donor.amount.to_f > @@gold_tier
        @golds << donor
      elsif donor.amount.to_f > @@silver_tier
        @silvers << donor
      elsif donor.amount.to_f > @@bronze_tier
        @bronzes << donor
      else
        @nonmedals << donor
      end
    end
    @golds.sort_by! {|d| -d[:amount]}
    @silvers.sort_by! {|d| -d[:amount]}
    @bronzes.sort_by! {|d| -d[:amount]}
    @nonmedals.sort_by! {|d| -d[:amount]}
  end

  def edit
    @donor = Donor.find(params[:id])
  end 

  def show
    @donor = Donor.find(params[:id])
  end

  def update
    @donor = Donor.find(params[:id])
    if @donor.update(donor_params)
      redirect_to @donor, notice: 'Donor was successfully updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    @donor = Donor.find(params[:id])
    @donor.destroy
    redirect_to donors_url
  end

  private
    def donor_params
      params[:donor].permit(:amount, :email, :name, :title, :profile)
    end

end
