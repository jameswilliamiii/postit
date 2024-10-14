# frozen_string_literal: true

class Components::Passwords::New < Components::Base
  include Phlex::Rails::Helpers::FormWith
  include Components::Forms::Inputable

  def view_template
    render Components::FormCard do
      form_with url: passwords_path, class: "space-y-6" do |form|
        h1(class: "font-bold text-2xl") { "Forgot your password?" }
        div {
          render RBUI::TypographySmall.new { "Enter your email address and we'll send you a link to reset your password." }
        }
        div {
          floating_label_input(
            form, :email_address, :email_field,
            required: true, autocomplete: "username",
            autofocus: true, value: helpers.params[:email_address]
          )
        }
        div {
          render Components::Forms::Submit.new(class: "mt-3") { "Email reset instructions" }
        }

        div {
          RBUI::Link(href: new_session_path, class: "px-0") { "Sign in" }
        }
      end
    end
  end
end
