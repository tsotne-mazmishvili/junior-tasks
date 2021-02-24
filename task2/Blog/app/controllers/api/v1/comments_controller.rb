module Api
  module V1
    class CommentsController < ApplicationController
      def create
        data = CommentsService.new(params).create
        return render  :json => { errs: data[:errs] }, status: data[:status_code] if data[:has_error]
        render :json => data, status: 200
      end

      def edit
        data = CommentsService.new(params).edit
        return render json: { errs: data[:errs] }, status: data[:status_code] if data[:has_error]
        render json: data, status: 200
      end

      def update
        data = CommentsService.new(params).update
        return render json: { errs: data[:errs] }, status: data[:status_code] if data[:has_error]
        render json: data, status: 200
      end

      def destroy
        data = CommentsService.new(params).destroy
        return render :json => {errs: data[:errs]}, status: data[:status_code] if data[:has_error]
        render :json => data, status: 200
      end

      def index
        data = CommentsService.new(params).index
        render json: { data: data }
      end

      def show
        data = CommentsService.new(params).show
        render json: { data: data }
      end

    end

  end
end
