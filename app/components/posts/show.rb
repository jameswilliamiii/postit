# frozen_string_literal: true

class Components::Posts::Show < Components::Base
  include Phlex::Rails::Helpers::DOMID,
          Phlex::Rails::Helpers::LinkTo,
          Phlex::Rails::Helpers::TimeAgoInWords,
          Components::Posts::Postable

  attr_reader :post

  def initialize(post:)
    @post = post
  end

  def view_template
    content_for(:mobile_top_bar) {
      render Components::MobileTopBar.new {
        link_to posts_path, class: "flex items-center" do
          render Components::InlineSvg.new("arrow-left.svg")
          span(class: "ms-2") { "Back" }
        end
      }
    }
    div {
      article(class: "pb-4 md:pb-6") {
        div(class: "flex justify-between items-start") {
          h1(class: "text-3xl font-bold mb-4") { post.title }
          if post.user == Current.user
            render Components::Posts::Actions.new(post: post)
          end
        }
        div {
          safe post.message.body.to_s
        }
      }
      div(class: "block md:flex items-center justify-between") {
        render Components::Posts::Author.new(user: post.user)
        render Components::TimeAgo.new(**time_ago_options(post).merge(class: "italic text-xs md:text-sm"))
      }
    }
  end
end
