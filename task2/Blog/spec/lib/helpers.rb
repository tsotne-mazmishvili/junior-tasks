module Helpers
  def create_post(title, body)
    Post.create(title: title, body: body)
  end
end
