class DonorsController < ApplicationController
  def new
    @donor = Donor.new
  end

  def create
    @donor = Donor.new(params[:donor].permit(:amount, :email, :name, :title, :profile))
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
    @donors = Donor.all
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
      if @donor.update(params[:donor].permit(:amount, :email, :name, :title, :message, :profile))
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

end
