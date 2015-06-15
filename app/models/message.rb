class Message < ActiveRecord::Base
  belongs_to :user
  validates :main_message, :presence => true
  validates :user_id, :presence => true
end
