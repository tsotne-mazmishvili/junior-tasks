module Helpers
  def create_post(title, body)
    Post.create(title: title, body: body)
  end

  def create_comment(post_id, body)
    Comment.create(post_id: post_id, body: body)
  end
end
