ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "theliveboard.com",
  :user_name            => "donotreply@theliveboard.com",
  :password             => "73nfirst",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

Mail.defaults do
  delivery_method :smtp
end