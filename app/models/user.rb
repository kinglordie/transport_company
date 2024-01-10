class User < ApplicationRecord
  enum role: { admin: "admin", employee: "employee", user: "user" }
  
  before_create :set_default_role

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  def admin?
    role == 'admin'
  end
  private

  def set_default_role
    self.role ||= 'user'
  end       
end
