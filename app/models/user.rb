class User < ActiveRecord::Base
  has_many :messages
  validates :first_name, :presence => true
  validates :last_name, :presence => { :message => 'Input last name.' }
  validates :username, :presence => { :message => 'Input username.' }, length: { minimum: 3 }, uniqueness: true
  validates :password, :presence => { :message => 'Input password.' }
end
