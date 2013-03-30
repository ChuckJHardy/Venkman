class PostOffice
  class Postman
    def self.pickup
      PostOffice.receiver GmailService.retrieve
    end
  end
end
