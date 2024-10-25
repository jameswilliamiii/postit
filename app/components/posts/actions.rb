# frozen_string_literal: true

class Components::Posts::Actions < Components::Base
  attr_reader :post

  def initialize(post:)
    @post = post
  end

  def view_template
    RBUI::DropdownMenu(options: { placement: "bottom" }) do
      RBUI::DropdownMenuTrigger(class: "w-full") do
        RBUI::Button(variant: :link, class: "w-8 p-0 text-color-gray-600") {
          render Components::InlineSvg.new("ellipsis-vertical.svg")
        }
      end
      render RBUI::DropdownMenuContent.new do
        RBUI::DropdownMenuItem(href: edit_post_path(post)) { "Edit" }
        RBUI::DropdownMenuItem(class: "block text-destructive hover:text-destructive", data: { controller: "actions-link" }) {
          render Components::ConfirmDialog.new(
            trigger: "Delete",
            variant: :destructive,
            href: post_path(@post),
            title: "Are you sure?",
            description: "This action cannot be undone. This will permanently delete your post.",
            action_text: "Delete post",
            cancel_text: "Cancel",
            data: { turbo_method: :delete, action: "click->actions-link#prevent" },
            class: "block"
          ) { "Delete" }
        }
      end
    end
  end
end
