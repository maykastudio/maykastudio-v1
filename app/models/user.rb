class User < ActiveRecord::Base
  include Gravtastic
  gravtastic

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  validates_presence_of :email, :login
  validates_uniqueness_of :email, :login
end
