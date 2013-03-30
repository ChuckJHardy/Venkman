class UidMatcher
  attr_accessor :matched

  REGEX = /\+(.+)\@/

  def initialize(collection)
    @collection = Array(collection)
    @matched = []
  end

  def self.match(collection)
    new(collection).process
  end

  def process
    collection.each { |string| match(string) }

    self
  end

  def any?
    !matched.empty?
  end

  private

  attr_reader :collection

  def match(string)
    string.match(REGEX).tap do |response|
      @matched << response[1] unless response.nil?
    end
  end
end
