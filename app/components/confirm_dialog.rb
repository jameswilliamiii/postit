# frozen_string_literal: true

class Components::ConfirmDialog < Components::Base
  def initialize(**options)
    @options = options
    super()
  end

  def view_template(&)
    render RBUI::AlertDialog.new(**@options) do
      render RBUI::AlertDialogTrigger.new(**@options) do
        @options[:trigger]
      end
      render RBUI::AlertDialogContent.new do
        render RBUI::AlertDialogHeader.new do
          render RBUI::AlertDialogTitle.new { @options[:title] || "Are you sure?" }
          render RBUI::AlertDialogDescription.new { @options[:description] }
        end
        render RBUI::AlertDialogFooter.new do
          render RBUI::AlertDialogCancel.new { @options[:cancel_text] || "Cancel" }
          render RBUI::Link.new(**@options) { @options[:action_text] || "Proceed" }
        end
      end
    end
  end
end
