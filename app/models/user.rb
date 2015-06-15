class User < ActiveRecord::Base
  has_many :messages
  validates :first_name, :presence => true, length: { minimum: 3 }
  validates :last_name, :presence => { :message => 'Input last name.' }
  validates :username, :presence => { :message => 'Input username.' }, uniqueness: true
  validates :password, :presence => { :message => 'Input password.' }
end
