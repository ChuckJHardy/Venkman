class PostOffice
  class Processor
    def initialize(email)
      @email = email
    end

    def self.process(email)
      new(email).record
    end

    def record
      PostOffice::Ledger.initial(user, organiser)
    end

    def user
      PostOffice::Assigner.find(addresses)
    end

    def organiser
      PostOffice::Organiser.initial(email)
    end

    private

    attr_reader :email

    def addresses
      email.to
    end
  end
end
