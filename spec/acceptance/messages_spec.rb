require 'spec_helper'

describe 'Messages Acceptance' do
  subject { PostOffice::Postman.pickup }

  let(:subject_one) { 'Subject 1' }
  let(:body_one) { 'Body 1' }
  let(:uid_one) { '123' }
  let(:to_one) { "venkmapapp+#{uid_one}@gmail.com" }
  let(:message_one) {
    fire_double(
      'Mail::Message',
      :to => to_one,
      :subject => subject_one,
      :body => mail_body_one
    )
  }

  let(:mail_body_one) {
    fire_double(
      'Mail::Body',
      :decoded => body_one
    )
  }

  let(:subject_two) { 'Subject 2' }
  let(:body_two) { 'Body 2' }
  let(:uid_two) { '456' }
  let(:to_two) { "venkmapapp+#{uid_two}@gmail.com" }
  let(:message_two) {
    fire_double(
      'Mail::Message',
      :to => to_two,
      :subject => subject_two,
      :body => mail_body_two
    )
  }

  let(:mail_body_two) {
    fire_double(
      'Mail::Body',
      :decoded => body_two
    )
  }

  let(:subject_three) { 'Subject 3' }
  let(:body_three) { 'Body 3' }
  let(:to_three) { "venkmapapp+#{uid_two}@gmail.com" }
  let(:message_three) {
    fire_double(
      'Mail::Message',
      :to => to_three,
      :subject => subject_three,
      :body => mail_body_three
    )
  }

  let(:mail_body_three) {
    fire_double(
      'Mail::Body',
      :decoded => body_three
    )
  }

  let(:gmailish) {
    fire_double(
      'Gmailish::Account',
      :messages => messages
    )
  }

  let(:messages) { [ message_one, message_two, message_three ] }

  before do
    FactoryGirl.create_list(:user, 2)

    User.find(1).update_attribute(:uid, uid_one)
    User.find(2).update_attribute(:uid, uid_two)

    Gmailish::Account.stub(process: gmailish)
  end

  it 'returns messages' do
    subject

    expect(User.find(1).messages).to_not eq([])
  end

  it 'returns expected ammount of messages per user' do
    subject

    expect(User.find(1).messages.size).to eq(1)
    expect(User.find(2).messages.size).to eq(2)
  end

  it 'returns messages with the correct subjects' do
    subject

    expect(
      User.find(1).messages.find_by_subject(subject_one)
    ).to_not be_nil

    expect(
      User.find(2).messages.find_by_subject(subject_two)
    ).to_not be_nil

    expect(
      User.find(2).messages.find_by_subject(subject_three)
    ).to_not be_nil
  end

  it 'returns messages with the correct bodies' do
    subject

    expect(
      User.find(1).messages.find_by_body(body_one)
    ).to_not be_nil

    expect(
      User.find(2).messages.find_by_body(body_two)
    ).to_not be_nil

    expect(
      User.find(2).messages.find_by_body(body_three)
    ).to_not be_nil
  end
end
