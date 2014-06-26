ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.smtp_settings = {
  address: "smtp.gmail.com",
  port: 587,
  domain: "420friend.ly",
  user_name: "motherplant@420friend.ly",
  password: "74beb0a4-a9ed-420f-8ef3-bba92faa9a09",
  authentication: "plain",
  enable_starttls_auto: true
}