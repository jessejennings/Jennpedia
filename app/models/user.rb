class User < ActiveRecord::Base
  has_many :wikis

  def admin?
    role == 'admin'
  end

  def moderator?
    role == 'moderator'
  end


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
