class PostmanPickup
  include Sidekiq::Worker

  def perform
    PostOffice::Postman.pickup
  end
end
