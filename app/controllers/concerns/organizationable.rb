module Organizationable
  extend ActiveSupport::Concern

  included do
    before_action :assign_organization

    helper_method :current_organization
  end

  def current_organization
    Current.organization || Current.user.base_organization
  end

  def assign_organization
    return unless Current.user

    Current.organization = find_organization_by_cookie
  end

  def find_organization_by_cookie
    Organization.find_by(id: cookies.signed[:organization_id]) || Current.user.base_organization
  end
end
