require 'rails_helper'
require 'lib/helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe Api::V1::CommentsController, type: :controller do

  describe 'comments object' do
    let!(:posts){ create_post("title", "body") }
    let(:comment){create_comment(posts.id, "Comment")}

    it 'checks comment created' do
      params = {
        post_id: posts.id,
        comment: {
          body: "test body"
        }
      }

      post :create,  params: params

      result = JSON.parse(response.body)['data']

      expect(Comment.count).to eq 1

      expect(result).to include_json({
                                       post_id: posts.id,
                                       body: "test body"
                                     })
    end

    it 'checks comment update' do
      params = {
        post_id: posts.id,
        id: comment.id,
        comment: {
          body: "test comment"
        }
      }

      put :update, params: params

      result = JSON.parse(response.body)['data']

      expect(Comment.count).to eq 1

      expect(result).to include_json({
                                       post_id: posts.id,
                                       body: "test comment"
                                     })

    end

    it 'checks comment deleted' do
      delete :destroy, params: { post_id: posts.id, id: comment.id}

      expect(Comment.count).to eq 0
    end

    it 'checks comments of current post are displayed' do
      comment
      post2 = Post.create(title: "test 2", body: "test body 2")
      Comment.create(post_id: post2.id, body: "second comment")


      get :index, params: { post_id: posts.id}

      result = JSON.parse(response.body)['data'][0]

      expect(Comment.count).to eq 2
      expect(Post.count).to eq 2

      expect(result).to include_json({
                                       id: comment.id,
                                       post_id: posts.id,
                                       body: "Comment"
                                     })

    end

  end
end
