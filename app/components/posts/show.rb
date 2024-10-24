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
    div {
      if post.user == Current.user
        div(class: "relative md:absolute md:top-16 md:right-16 w-auto flex justify-end") {
          render Components::Posts::Actions.new(post: post)
        }
      end
      article(class: "pb-4 md:pb-6") {
        h1(class: "text-3xl font-bold mb-4") { post.title }
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
