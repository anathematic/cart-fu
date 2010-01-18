# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_sliprings_session',
  :secret      => '6f545a536c5296a2900206a99f4851b3664de2254ff10fa420a40fdc2aa1761f98e0e4b752e658e578a51aef9bee026bfa7b0f26b31ca3ed825a32bc286bb0ea'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
