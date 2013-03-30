class GmailService
  def self.retrieve
    new.messages
  end

  def messages
    @messages ||= mailer.messages
  end

  private

  def mailer
    Gmailish::Account.process(username, password)
  end

  def username
    ENV['VENKMAN_GMAIL_EMAIL']
  end

  def password
    ENV['VENKMAN_GMAIL_PASSWORD']
  end
end
