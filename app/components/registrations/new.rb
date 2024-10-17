# frozen_string_literal: true

class Components::Registrations::New < Components::Base
  include Phlex::Rails::Helpers::FormWith
  include Components::Forms::Inputable

  attr_reader :user

  def initialize(user)
    @user = user
  end

  def view_template
    render Components::FormCard do
      form_with model: user, url: registration_path, class: "space-y-6" do |form|
        h1(class: "font-bold text-2xl") { "Sign up" }
        div {
          floating_label_input(form, :name, :text_field, required: true)
        }
        div {
          floating_label_input(form, :email_address, :email_field, required: true)
        }
        div {
          floating_label_input(form, :password, :password_field, required: true)
        }
        div {
          floating_label_input(form, :password_confirmation, :password_field, required: true)
        }
        div {
          render Components::Forms::Submit.new { "Create your account" }
        }
        div(class: "mt-4 flex items-center") {
          RBUI::TypographyMuted() { "Already have an account?" }
          RBUI::Link(href: new_session_path) { "Sign in" }
        }
      end
    end
  end
end
