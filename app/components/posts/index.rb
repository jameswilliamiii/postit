# frozen_string_literal: true

class Components::Posts::Index < Components::Base
  include Phlex::Rails::Helpers::DOMID,
          Phlex::Rails::Helpers::LinkTo,
          Phlex::Rails::Helpers::StripTags,
          Phlex::Rails::Helpers::Truncate,
          Components::Posts::Postable

  attr_reader :posts, :options

  def initialize(posts:, **options)
    @posts = posts
    @options = options || {}
  end

  def view_template
    div(id: "posts", class: "min-w-full") {
      @posts.each do |post|
        article(class: "border-b border-gray-300 dark:border-gray-600 last:border-b-0 py-4 md:py-6 last:mb-0 relative") {
          div(class: "flex") {
            div(class: "pe-6") {
              render Components::Users::Avatar.new(user: post.user)
            }
            link_to post_path(post), data: { turbo_frame: "post_#{dom_id(post)}" }, class: "relative" do
              div(class: "relative") {
                h2(class: "font-bold") { post.title }
                div(class: "pb-2 flex") {
                  div {
                    safe truncate(strip_tags(post.message.body.to_s), length: 200) {
                      link_to "Read more", post_path(post), class: "ms-2 text-primary"
                    }
                  }
                }
                render Components::TimeAgo.new(**time_ago_options(post))
              }
            end
          }
        }
      end
    }
  end
end
