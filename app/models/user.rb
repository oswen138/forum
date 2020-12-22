class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :discussions, dependent: :destroy
  has_many :channels, through: :discussions
  has_many_attached :images, dependent: :destroy

  has_many :private_messages, class_name: 'Private::Message'
  has_many  :private_conversations, 
          foreign_key: :sender_id, 
          class_name: 'Private::Conversation'
end



