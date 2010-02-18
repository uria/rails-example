# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_dating-site_session',
  :secret      => '6e3024d71b031e9ca11867cd61da0a1c4df5df22678e6760ea49490d0d89f52fe4eec9c7e323f0e936fbaa1eff27abf77f9bebf61345fd576b0df6f6e350e50c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
