if Rails.env.production?
	Rails.configuration.stripe = {
		:publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
		:secret_key => ENV['STRIPE_SECRET_KEY']
	}
else
	Rails.configuration.stripe ={
		:publishable_key => 'pk_test_04pitotHgGnkNNdQ0xghcJXZ',
		:secret_key => 'sk_test_XI9SriUJ2Vs3W5rFUzkBiMNQ'
	}
end

Stripe.api_key = Rails.configuration.stripe[:secret_key]

# Stripe credentials reference
# Rails.configuration.stripe[:publishable_key]