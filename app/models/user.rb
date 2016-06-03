class User < ActiveRecord::Base
  has_secure_password

  validates :current_city,
          presence: true,
          length: { maximum: 255 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: true,
            length:     { maximum: 255 }


  validates :username,
            presence: true,
            uniqueness: true,
            length: { maximum: 255 }

  validates :current_city,
            presence: true

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  enum role: [:admin, :guest]
end
