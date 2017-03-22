class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable

  has_many :services

  validates :firstname, presence: true, length: { maximum: 50 }
  validates :lastname, presence: true, length: { maximum: 50 }
  validates :description, presence: false, length: { maximum: 1500 }

  def fullname
    "#{firstname} #{lastname}"
  end

  def self.from_omniauth(auth)
    user = User.where(email: auth.info.email).first

    return user if user.present?

    User.where(provider: auth.provider, uid: auth.uid).first_or_create do |u|
      u.provider = auth.provider
      u.uid = auth.uid
      fb_name = auth.info.name
      u.firstname = fb_name.split.first
      u.lastname = fb_name.split.last
      u.description = auth.info.description
      u.email = auth.info.email
      u.image = auth.info.image
      u.password = Devise.friendly_token[0, 20]
    end
  end

end
