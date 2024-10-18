# frozen_string_literal: true

class Components::Account::Password::Edit < Components::Base
  include Phlex::Rails::Helpers::FormWith
  include Components::Forms::Inputable

  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def view_template
    div(class: "bg-white dark:bg-gray-800 py-8 px-4 md:px-16 rounded shadow-md mx-auto md:w-1/2 w-full") do
      RBUI::TypographyH1(class: "text-xl md:text-2xl lg:text-2xl") { "Need to change your password?" }
      form_with(model: user, url: account_password_path, method: :patch, class: "space-y-6") do |form|
        div {
          floating_label_input(form, :password, :password_field, required: true)
        }
        div {
          floating_label_input(form, :password_confirmation, :password_field, required: true)
        }
        div(class: "flex justify-center") {
          render Components::Forms::Submit.new(class: "w-full md:w-1/2") { "Update password" }
        }
      end
    end
  end
end
