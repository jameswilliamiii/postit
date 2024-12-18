# frozen_string_literal: true

class Components::Posts::Form < Components::Base
  include Phlex::Rails::Helpers::FormWith
  include Components::Forms::Inputable

  attr_reader :post, :submit_text, :cancel_path

  def initialize(post:, submit_text: "Save", cancel_path: nil)
    @post = post
    @submit_text = submit_text
    @cancel_path = cancel_path || Rails.application.routes.url_helpers.posts_path
  end

  def view_template
    div(class: "bg-white dark:bg-gray-800 py-8 px-0 mt-10 md:mt-0 rounded shadow-md mx-auto container") do
      content_for(:mobile_top_bar) {
        render Components::MobileTopBar.new {
          link_to back_path, class: "flex items-center" do
            render Components::InlineSvg.new("arrow-left.svg")
            span(class: "ms-2") { "Back" }
          end
        }
      }
      form_with(model: post, class: "posts-form") do |form|
        div(class: "px-4 md:px-16 mb-2") {
          RBUI::FormField() do
            form.text_field :title, class: text_field_class, placeholder: "Type a headline...", required: true, autofocus: post.persisted? ? false : true, data: build_input_data
            render RBUI::FormFieldError.new(class: "my-2 text-xs")
            if form_has_errors?(form, :title)
              render RBUI::FormFieldError.new(class: "my-2 text-xs") { form.object.errors[:title].join(", ") }
            end
          end
        }
        RBUI::FormField() do
          form.rich_textarea :message, class: text_area_class, placeholder: "Tell your story...", required: true
          div(class: "px-4 md:px-16") {
            render RBUI::FormFieldError.new(class: "my-2 text-xs")
            if form_has_errors?(form, :message)
              render RBUI::FormFieldError.new(class: "my-2 text-xs") { form.object.errors[:message].join(", ") }
            end
          }
        end

        div(class: "px-4 md:px-16 my-7") {
          render Components::Forms::Submit.new(class: "w-max") { submit_text }
          render RBUI::Link.new(variant: :secondary, href: cancel_path, class: "ms-3") { "Cancel" }
        }
      end
    end
  end

  def text_field_class
    "text-2xl font-semibold py-2.5 px-0 w-full bg-transparent border-0 appearance-none focus:ring-opacity-0 focus:ring-0 placeholder-gray-400"
  end

  def text_area_class
    "block rounded-md border-0 outline-none px-4 md:px-16 py-2 mt-2 w-full focus:ring-opacity-0 focus:ring-0 placeholder-gray-400"
  end

  def back_path
    post.persisted? ? post_path(post) : posts_path
  end
end
