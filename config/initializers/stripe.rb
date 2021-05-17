
if Rails.env.development?
  Rails.configuration.stripe = {
      :publishable_key => Rails.application.credentials.stripe[:development][:publishable_key],
      :secret_key      => Rails.application.credentials.stripe[:development][:secret_key]
  }
end

if Rails.env.production?
  Rails.configuration.stripe = {
    :publishable_key => Rails.application.credentials.stripe[:production][:publishable_key],
    :secret_key      => Rails.application.credentials.stripe[:production][:secret_key]
  }

end

if Rails.env.test?
  Rails.configuration.stripe = {
    :publishable_key => Rails.application.credentials.stripe[:development][:publishable_key],
    :secret_key      => Rails.application.credentials.stripe[:development][:secret_key]
  }
end
Stripe.api_key = Rails.configuration.stripe[:secret_key]