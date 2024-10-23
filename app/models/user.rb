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

  #-----------------------------------------------------------------------------
  # Callbacks
  #-----------------------------------------------------------------------------

  before_create :assign_random_avatar_color

  #-----------------------------------------------------------------------------
  # Instance Methods
  #-----------------------------------------------------------------------------

  def base_organization
    organizations.joins(:memberships).merge(Membership.owner).first || create_base_organization!
  end

  def create_base_organization!
    organization = Organization.create!(name: name)
    memberships.create!(organization: organization, role: :owner)
    organization
  end

  private

  def assign_random_avatar_color
    self.avatar_color = Components::Account::Profile::Form::AVATAR_COLORS.sample
  end
end
