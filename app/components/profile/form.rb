# frozen_string_literal: true

class Components::Profile::Form < Components::Base
  include Phlex::Rails::Helpers::FormWith
  include Components::Forms::Inputable

  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def view_template
    div(class: "bg-white dark:bg-gray-800 py-8 px-4 md:px-16 rounded shadow-md mx-auto md:w-1/2 w-full") do
      form_with(model: user, url: profile_path, method: :patch, class: "space-y-6") do |form|
        render Users::Avatar.new(user: user, size: :xl, class: "mx-auto mb-10 md:min-w-28 md:min-h-28 md:text-5xl")
        div {
          floating_label_input(form, :name, :text_field, required: true)
        }
        div {
          floating_label_input(form, :email_address, :email_field, required: true)
        }
        div(class: "flex justify-center") {
          render Components::Forms::Submit.new(class: "w-full md:w-1/2") { "Save my changes" }
        }
      end
    end
  end
end
