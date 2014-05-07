class CheckoutsController < ApplicationController

  def new
  end

  def create
    @@cart = current_cart
    @cart = current_cart
    if @@cart.cart_items.present?
      @@name = params[:checkout][:firstname] + ", " + params[:checkout][:lastname]
      if (params[:checkout][:address2].blank?)
        @@address = params[:checkout][:address1] + ", " + params[:checkout][:city] + ", " + params[:state] + " " + params[:checkout][:zip]
      else
        @@address = params[:checkout][:address1] + ", " + params[:checkout][:address2] + ", " + params[:checkout][:city] + ", " + params[:state] + " " + params[:checkout][:zip]
      end
      @@token = params[:stripeToken]
      @@email = params[:checkout][:email]
      @tax_rate = get_state_rate(params[:state]) * 100
      @tax_amount = get_tax_amount(@@cart.total_price.to_f, params[:state])
      @shipping = 5.95  

      @@tax_amount = get_tax_amount(@@cart.total_price.to_f, params[:state])
      @grand_total = @@cart.total_price.to_f + @@tax_amount + @shipping  
      @@grand_total = @@cart.total_price.to_f + @@tax_amount + @shipping
    else
      render_404
    end
  end

  def confirm
    if @@cart.cart_items.present?
      charge = (@@grand_total.to_f * 100).to_i
      @purchase = Purchase.new(:name => @@name, :address => @@address, :email => @@email, :subtotal => @@cart.total_price, :total => @@grand_total)
      if @purchase.save
        charge = Stripe::Charge.create(
          :amount => charge,
          :currency => "usd",
          :card => @@token,
          :description => "Purchase from " + @@email
        )
        @@cart.cart_items.each do |citem|
          @purchase.cart_items << citem
        end
        # deliver email
        mail_info = {:mail => @@email, :purchase => @purchase}
        StoreMailer.confirm_email(mail_info).deliver
        @@cart.destroy
        @@cart.save
      else
        render action: 'new'
      end
    else
      render_404
    end
  end

  private
    def get_state_rate(state)
      rates = {
        'Alabama' => 0.04,
        'Alaska' => 0.00,
        'Arizona' => 0.056,
        'Arkansas' => 0.065,
        'California' => 0.075,
        'Colorado' => 0.029,
        'Connecticut' => 0.0635,
        'Delaware' => 0.00,
        'District of Columbia' => 0.0575,
        'Florida' => 0.06,
        'Georgia' => 0.04,
        'Hawaii' => 0.04,
        'Idaho' => 0.06,
        'Illinois' => 0.0625,
        'Indiana' => 0.07,
        'Iowa' => 0.06,
        'Kansas' => 0.0615,
        'Kentucky' => 0.06,
        'Louisiana' => 0.04,
        'Maine' => 0.055,
        'Maryland' => 0.06,
        'Massachusetts' => 0.0625,
        'Michigan' => 0.06,
        'Minnesota' => 0.06875,
        'Mississippi' => 0.07,
        'Missouri' => 0.04225,
        'Montana' => 0.00,
        'Nebraska' => 0.055,
        'Nevada' => 0.0685,
        'New Hampshire' => 0.00,
        'New Jersey' => 0.07,
        'New Mexico' => 0.05125,
        'New York' => 0.04,
        'North Carolina' => 0.0475,
        'North Dakota' => 0.05,
        'Ohio' => 0.0575,
        'Oklahoma' => 0.045,
        'Oregon' => 0.00,
        'Pennsylvania' => 0.06,
        'Rhode Island' => 0.07,
        'South Carolina' => 0.06,
        'South Dakota' => 0.04,
        'Tennessee' => 0.07,
        'Texas' => 0.0625,
        'Utah' => 0.047,
        'Vermont' => 0.06,
        'Virginia' => 0.043,
        'Washington' => 0.065,
        'West Virginia' => 0.06,
        'Wisconsin' => 0.05,
        'Wyoming' => 0.04
       }
      rates[state]
    end

    def get_tax_amount(amount, state)
      percentage = get_state_rate(state).to_f
      amount * percentage
    end
end
