class DonorsController < ApplicationController
  # tier amounts
  @@gold_tier = 500
  @@silver_tier = 250
  @@bronze_tier = 50

  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(donor_params)
    respond_to do |format|
      if @donor.save
        format.html { redirect_to @donor, notice: 'Donor was successfully created.' }
        format.json { render action: 'show', status: :created, location: @donor }
      else
        format.html { render action: 'new' }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
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
      if donor.amount.to_i > @@gold_tier
        @golds << donor
      elsif donor.amount.to_i > @@silver_tier
        @silvers << donor
      elsif donor.amount.to_i > @@bronze_tier
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
    respond_to do |format|
      if @donor.update(donor_params)
        format.html { redirect_to @donor, notice: 'Donor was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @donor.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @donor = Donor.find(params[:id])
    @donor.destroy
    respond_to do |format|
      format.html { redirect_to donors_url }
      format.json { head :no_content }
    end
  end

  private
    def donor_params
      params[:donor].permit(:amount, :email, :name, :title, :profile)
    end

end
