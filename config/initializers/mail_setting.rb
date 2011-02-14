ActionMailer::Base.smtp_settings = {
  :address              => "qfiteachers.net",
  :port                 => 25,
  :domain               => "qfiteachers.net",
  :user_name            => "noreply@qfiteachers.net",
  :password             => "changeme",
  :authentication       => "login",
  :enable_starttls_auto => true
} 

ActionMailer::Base.default_url_options[:host] = (Rails.env == 'production' ? "www.qfiteachers.net" : "localhost")