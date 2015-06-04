class AdminMailer < ActionMailer::Base
  default from: "info@happyshot.in"

  def welcome(user)
    mail(:to => user.email, :subject => "happyshot registeration", :body => "welcome to happyshot.in\nWe are glad to have you on board. You can always cancel your account anytime you want; you can find the details in (Edit your profile) section.")
  end

end
