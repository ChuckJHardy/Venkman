class User < ActiveRecord::Base
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable,
         :token_authenticatable,
         :lockable

  before_save :ensure_authentication_token

  attr_accessible :email, :password, :password_confirmation, :remember_me
end
