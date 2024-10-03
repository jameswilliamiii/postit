module AuthenticationHelper
  def sign_in_as(user)
    session = user.sessions.create!(user_agent: "Rails Testing", ip_address: "::1")
    Session.stubs(:find_by).returns(session)
  end
end
