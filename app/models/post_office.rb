class PostOffice
  def initialize(emails)
    @emails = emails
  end

  def self.receiver(emails)
    new(emails).handover
  end

  def handover
    @emails.each { |email| PostOffice::Processor.process(email) }
  end
end
