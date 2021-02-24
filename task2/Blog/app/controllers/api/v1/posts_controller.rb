module Api
  module V1
    class PostsController < ApplicationController
      def create
        data = PostsService.new(params).create
        return render  :json => { errs: data[:errs] }, status: data[:status_code] if data[:has_error]
        render :json => data, status: 200
      end

      def edit
        data = PostsService.new(params).edit
        return render json: { errs: data[:errs] }, status: data[:status_code] if data[:has_error]
        render json: data, status: 200
      end

      def update
        data = PostsService.new(params).update
        return render json: { errs: data[:errs] }, status: data[:status_code] if data[:has_error]
        render json: data, status: 200
      end

      def destroy
        data = PostsService.new(params).destroy
        return render :json => {errs: data[:errs]}, status: data[:status_code] if data[:has_error]
        render :json => data, status: 200
      end

      def index
        data = PostsService.new(params).index
        render json: { data: data }
      end

      def show
        data = PostsService.new(params).show
        render json: { data: data }
      end

    end
  end
end


