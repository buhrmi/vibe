class User < ApplicationRecord
  RESERVED_NAMES = %w(info help support admin dashboard signup login logout about privacy terms conditions legal)

  has_secure_password

  has_one_attached :header_image

  validates :email, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :name, presence: true, uniqueness: true, length: { maximum: 16, minimum: 3 }, format: { with: /\A[a-zA-Z][a-zA-Z0-9_]+\z/ }, exclusion: { in: User::RESERVED_NAMES }
  after_create_commit :welcome

  def welcome
    UserMailer.with(user: self).welcome.deliver_later
  end

  def reset_password!
    update! password_reset_token: SecureRandom.urlsafe_base64(16), password_reset_token_created_at: Time.now
    UserMailer.with(user: self).reset_password.deliver_later
  end

  def to_param
    name
  end
end
