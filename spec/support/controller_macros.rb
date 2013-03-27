module ControllerMacros
  def login_user(user)
    devise_mapping(:user)
    sign_in user
  end

  def devise_mapping(user)
    @request.env["devise.mapping"] = Devise.mappings[user]
  end
end
