Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      #post 'posts/destroy/:id', to: 'posts#destroy'
      resources :posts
      resources :comments
    end
  end

  # post 'api/v1/posts', to: 'posts#create'
  # get 'api/v1/posts', to: 'posts#index'

end
