class Post < ApplicationRecord
  #-----------------------------------------------------------------------------
  # Associations
  #-----------------------------------------------------------------------------
  belongs_to :user
  belongs_to :organization
  has_rich_text :message

  #-----------------------------------------------------------------------------
  # Validations
  #-----------------------------------------------------------------------------
  validates :title, presence: true
  validates :message, presence: true
end
