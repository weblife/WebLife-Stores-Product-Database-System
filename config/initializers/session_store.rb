# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_weblife_stores_session',
  :secret      => '152fbb2d41b0b2b370149dae307c7af2c3fdd8cd70593f4eedec2516597cdc286738240b327c36a7220f3e7cc51756329b4f6bf664c08e4848efb0f0f0f9815c'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
