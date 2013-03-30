class PostOffice
  class Assigner
    def initialize(addresses)
      @addresses = addresses
    end

    def self.find(addresses)
      new(addresses).find
    end

    def find
      User.find_by_uid(uid) if uid_matcher.any?
    end

    private

    attr_reader :addresses

    def uid
      uid_matcher.matched.first
    end

    def uid_matcher
      @uid_matcher ||= UidMatcher.match(addresses)
    end
  end
end
