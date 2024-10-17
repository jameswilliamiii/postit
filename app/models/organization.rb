class Organization < ApplicationRecord
  #-----------------------------------------------------------------------------
  # Validations
  #-----------------------------------------------------------------------------

  validates :name, presence: true

  #-----------------------------------------------------------------------------
  # Associations
  #-----------------------------------------------------------------------------

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships
  has_many :posts, dependent: :destroy
end
