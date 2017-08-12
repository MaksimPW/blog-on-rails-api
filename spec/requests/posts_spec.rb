require 'rails_helper'

RSpec.describe 'Posts API', type: :request do
  let!(:posts) { create_list(:post, 9) }
  let(:post) { posts.first }
  let(:post_id) { post.id }

  describe 'GET /posts' do
    before { get '/posts' }

    it 'returns posts' do
      expect(json).not_to be_empty
      expect(json.size).to eq(posts.count)
    end

    it 'status 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /posts/:id' do
    before { get "/posts/#{post_id}" }

    context 'when the record exists' do

      it { expect(json).to_not be_empty }

      %w(id title content author likes image).each do |attr|
        it "returns the post attr {attr}" do
          expect(json["#{attr}"]).to eq(post["#{attr}"])
        end
      end

      it 'status 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:post_id) { 404 }

      it 'not found message' do
        expect(response.body).to match("Couldn't find Post")
      end

      it 'status 404' do
        expect(response).to have_http_status(404)
      end
    end
  end

  describe 'PATH /posts/:id/add_like' do
    let(:old_likes) { post.likes }
    let(:new_likes) { old_likes + 1 }

    before { patch "/posts/#{post_id}/add_like" }

    it { expect(json).to_not be_empty }

    it 'status 200' do
      expect(response).to have_http_status(200)
    end

    it 'updates the record' do
      expect(json['likes']).to eq new_likes
    end
  end
end
