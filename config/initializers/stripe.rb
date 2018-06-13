Rails.configuration.stripe = {
   publishable_key: ENV['pk_test_jJc7nIZT0LOvYZff5e5mXqse'],
   secret_key: ENV['sk_test_3GdjtMhtAZJvfo0AOESpOpJV']
 }
 
 # Set our app-stored secret key with Stripe
 Stripe.api_key = Rails.configuration.stripe[:secret_key]