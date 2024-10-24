# frozen_string_literal: true

class Components::Posts::Actions < Components::Base
  attr_reader :post

  def initialize(post:)
    @post = post
  end

  def view_template
    RBUI::DropdownMenu(options: { placement: "bottom" }) do
      RBUI::DropdownMenuTrigger(class: "w-full") do
        RBUI::Button(variant: :outline, class: "w-full justify-center text-gray-500 dark:text-gray-400 rounded-full p-2") {
          render Components::InlineSvg.new("dots-horizontal.svg")
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
