# frozen_string_literal: true

class Components::Account::Profile::Form < Components::Base
  include Phlex::Rails::Helpers::FormWith,
          Components::Forms::Inputable,
          Phlex::Rails::Helpers::LabelTag

  # If you add any colors to this list, then you must add the full class to the safelist defined in tailwind.config.js
  # Failure to do so will result in the class being purged from the CSS and the avatar colors will not work.
  AVATAR_COLORS = %w[
    red-500 orange-500 primary teal-500
    blue-500 indigo-500 pink-500 stone-500
  ].map { |color| "bg-#{color}" }.freeze

  attr_reader :user

  def initialize(user:)
    @user = user
  end

  def view_template
    div(class: "bg-white dark:bg-gray-800 py-8 px-4 md:px-16 rounded shadow-md mx-auto md:w-1/2 w-full") do
      h1(class: "text-3xl font-bold mb-4") { "Edit your profile" }
      form_with(model: user, url: profile_path, method: :patch, class: "space-y-6") do |form|
        div(class: "grid grid-cols-4 gap-4") {
          AVATAR_COLORS.each do |color_class|
            form.radio_button :avatar_color, color_class, class: "sr-only", checked: user.avatar_color == color_class
            form.label "avatar_color_#{color_class}", class: "rounded-full border-2 border-transparent p-1 mx-auto" do
              render Users::Avatar.new(user: user, size: :md, class: "#{color_class}")
            end
          end
        }
        div {
          floating_label_input(form, :name, :text_field, required: true)
        }
        div {
          floating_label_input(form, :email_address, :email_field, required: true)
        }
        div(class: "my-7") {
          render Components::Forms::Submit.new(class: "w-max") { "Save my changes" }
          render RBUI::Link.new(variant: :secondary, href: root_path, class: "ms-3") { "Cancel" }
        }
      end
    end
  end
end
