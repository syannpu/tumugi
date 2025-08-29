Rails.application.config.middleware.use OmniAuth::Builder do
  OmniAuth.config.allowed_request_methods = [ :post ]
  OmniAuth.config.silence_get_warning = true
end
