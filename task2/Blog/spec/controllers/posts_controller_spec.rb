require 'rails_helper'
require 'lib/helpers'

RSpec.configure do |c|
  c.include Helpers
end

RSpec.describe Api::V1::PostsController, type: :controller do

  describe 'post object' do
    let(:posts){ create_post("title", "body") }

    it 'checks if post is created successfully' do
      params = {
        post: {
          title: "test title",
          body: "test body"
        }
      }

      post :create,  params: params

      result = JSON.parse(response.body)['data']

      expect(Post.count).to eq 1

      expect(result).to include_json({
                                     title: "test title",
                                     body: "test body",
                                     mark_for_deletion: false
                                })

    end

    it 'checks post update' do
      params = {
        id: posts.id,

        post: {
          title: "test title",
          body: "test body"
        }
      }

      put :update, params: params

      result = JSON.parse(response.body)['data']

      expect(Post.count).to eq 1

      expect(result).to include_json({
                                       title: "test title",
                                       body: "test body",
                                       mark_for_deletion: false
                                     })

    end

    it 'checks post deleted' do
      delete :destroy, params: {id: posts.id}

      expect(Post.count).to eq 1
      expect(Post.first.mark_for_deletion).to eq true
    end

  end
end



