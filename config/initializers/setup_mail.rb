ActionMailer::Base.smtp_settings = {
    :address              => "smtp.gmail.com",
    :port                 => 587,
    :domain               => "gmail.com",
    :user_name            => "alertsmall.email",
    :password             => "dontstealmypassword",
    :authentication       => "plain",
    :enable_starttls_auto => true
}

Delayed::Worker.backend = :active_record
Delayed::Job.attr_accessible :priority, :payload_object, :run_at
