# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_status_siren_session',
  :secret      => 'ab0f248d00b914029fb538c537649c9fbfb8075622e5a9c7a16e33f689901566f3beb1fa23a03e20d573027974142c2e9dfd01a7208c27fe1b487d8387cc883b'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
