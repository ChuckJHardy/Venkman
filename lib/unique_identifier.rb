require 'date'

class UniqueIdentifier
  def initialize(string)
    @string = string
  end

  def self.for(string)
    new(string).generate
  end

  def generate
    Digest::MD5.hexdigest(hex)
  end

  private

  attr_reader :string

  def hex
    string + seconds
  end

  def seconds
    Time.now.to_i.to_s
  end
end
