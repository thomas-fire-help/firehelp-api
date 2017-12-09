class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :phone_number, uniqueness: true, presence: true, format: { with: /\d{10}/, message: "bad format" }
  validates :username, uniqueness: true, presence: true, format: { with: /[a-zA-Z]+/, message: "must be alphanumeric" }


  def generate_pin
    self.pin = rand(0000..9999).to_s.rjust(4, "0")
    save
  end

  def send_pin
    twilio_client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
    response = twilio_client.messages.create(
      to: phone_number,
      from: ENV['TWILIO_PHONE_NUMBER'],
      body: "[Thomas Fire Help] Your PIN is #{pin}"
    )
    response.error_code == 0
  end

  def verify(entered_pin)
    update(verified: true) if self.pin == entered_pin
  end
end
