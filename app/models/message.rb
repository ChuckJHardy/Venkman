class Message < ActiveRecord::Base
  attr_accessible :subject, :body

  belongs_to :user
end
