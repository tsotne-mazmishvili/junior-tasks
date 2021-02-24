class Post < ApplicationRecord
  has_many :comments, dependent: :destroy

  def json_view
    self.as_json(:only => [:id, :title, :body, :mark_for_deletion, :created_at])
  end

end
