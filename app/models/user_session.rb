class UserSession < Authlogic::Session::Base
  
  #generalize_credentials_error_messages true
  logout_on_timeout true
  
end