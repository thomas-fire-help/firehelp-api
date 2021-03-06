# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  remember_me_token               :string
#  remember_me_token_expires_at    :datetime
#  reset_password_token            :string
#  reset_password_token_expires_at :datetime
#  reset_password_sent_at          :datetime
#  phone_number                    :string
#  username                        :string
#  verified                        :boolean          default(FALSE)
#  role                            :string           default("user")
#  pin                             :integer
#  password_digest                 :string
#

class User < ApplicationRecord
  has_secure_password

  validates :password, length: { minimum: 8 }, if: -> { new_record? || changes[:password_digest] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:password_digest] }

  validates :phone_number, uniqueness: true, presence: true, format: { with: /\d{10}/, message: "bad format" }
  validates :username, uniqueness: true, presence: true, format: { with: /[a-zA-Z]+/, message: "must be alphanumeric" }

  validates :role, inclusion: { in: %w(user admin moderator) }

  has_many :supplies_neededs

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

  def send_password_reset(reset_url=nil)
    return false if reset_url.blank?
    self.reset_password_token = SecureRandom.uuid
    self.reset_password_token_expires_at = 1.hour.from_now
    self.reset_password_sent_at = DateTime.now

    if save
      twilio_client = Twilio::REST::Client.new(ENV['TWILIO_ACCOUNT_SID'], ENV['TWILIO_AUTH_TOKEN'])
      response = twilio_client.messages.create(
        to: phone_number,
        from: ENV['TWILIO_PHONE_NUMBER'],
        body: "[Thomas Fire Help] Reset your password here: #{pin}?token=#{reset_password_token}"
      )
    end
  end

  def reset_password

  end

  def verify(entered_pin)
    update(verified: true) if self.pin == entered_pin
  end

  def admin?
    role == "admin"
  end

  def moderator?
    role == "moderator" || admin?
  end
end
