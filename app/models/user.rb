class User < ApplicationRecord
  #-----------------------------------------------------------------------------
  # Associations
  #-----------------------------------------------------------------------------

  has_many :posts, dependent: :destroy
  has_many :sessions, dependent: :destroy
  has_many :memberships, dependent: :destroy
  has_many :organizations, through: :memberships

  #-----------------------------------------------------------------------------
  # Validations
  #-----------------------------------------------------------------------------

  validates :name, presence: true
  validates :email_address, presence: true, uniqueness: true
  validates :password, length: { minimum: 8 }, allow_nil: true

  #-----------------------------------------------------------------------------
  # Authentication
  #-----------------------------------------------------------------------------

  has_secure_password

  #-----------------------------------------------------------------------------
  # Attributes
  #-----------------------------------------------------------------------------

  normalizes :email_address, with: ->(e) { e.strip.downcase }
end
