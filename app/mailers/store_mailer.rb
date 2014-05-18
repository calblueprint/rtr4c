class StoreMailer < ActionMailer::Base
  default from: "no_reply@gmail.com"

  def confirm_email(mail_info)
    email = mail_info[:mail]
    @purchase = mail_info[:purchase]
    mail(:to => email, :subject => "Your Checkout Confirmation with RTR4C");
  end  

  def confirm_donation(mail_info)
    email = mail_info[:mail]
    @donor = mail_info[:donor]
    @donation = mail_info[:donation]
    mail(:to => email, :subject => "Your Donation with RTR4C");
  end
end