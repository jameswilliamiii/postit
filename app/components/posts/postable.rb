module Components::Posts::Postable
  extend ActiveSupport::Concern

  def time_ago_options(post)
    if post.created_at == post.updated_at
      { prefix: "Posted", time: post.created_at }
    else
      { prefix: "Updated", time: post.updated_at }
    end
  end
end
