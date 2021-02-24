class Comment < ApplicationRecord
  def json_view
    self.as_json(:only => [:id, :post_id, :body, :mark_for_deletion, :created_at])
  end
end
