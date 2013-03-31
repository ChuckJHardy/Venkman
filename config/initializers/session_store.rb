Rails.application.config.session_store ActionDispatch::Session::CacheStore, :expire_after => 1.minute
Rails.application.config.api_only = false
