MAIL_KEY =  ENV["GMAIL_PASSWORD"]
ActionMailer::Base.smtp_settings = {
	address: "smtp.gmail.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "happyshot.in@gmail.com",
	password: MAIL_KEY,
	authentication: "plain"
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"