ActionMailer::Base.sendmail_settings = {
        locaiton: "/usr/sbin/sendmail",
        arguments: '-i -t'
}

ActionMailer::Base.delivery_method = :sendmail
ActionMailer::Base.perform_deliveries = true
ActionMailer::Base.raise_delivery_errors = true
ActionMailer::Base.default charset: "utf-8"