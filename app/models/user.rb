class User < ActiveRecord::Base
  has_many :wikis, dependent: :destroy



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end
end
