class PostOffice
  class Ledger
    def initialize(user, arguments)
      @user = user
      @arguments = arguments
    end

    def self.initial(user, arguments)
      new(user, arguments).initial
    end

    def initial
      user.messages << Message.new(arguments)
    end

    private

    attr_reader :user, :arguments
  end
end
