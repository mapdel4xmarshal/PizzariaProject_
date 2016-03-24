class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  validates :FirstName, presence: true, :length => { :minimum => 3}
  validates :LastName, presence: true, :length => { :minimum => 3}
end
