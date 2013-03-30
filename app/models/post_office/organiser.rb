class PostOffice
  class Organiser
    def initialize(email)
      @email = email
    end

    def self.initial(email)
      new(email).initial
    end

    def initial
      {
        subject: email.subject,
        body: email.body.decoded
      }
    end

    private

    attr_reader :email
  end
end
