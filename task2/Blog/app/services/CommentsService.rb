class CommentsService
  attr_accessor :params

  def initialize(params = nil)
    @params = params
  end

  def index
    Comment.where(post_id: params[:post_id]).first(10)
  end

  def edit
    data = Comment.find(params[:id])

    { data: data.json_view }
  rescue => e
    {errs: [e.to_s], status_code: :internal_server_error, has_error: true}
  end

  def update
    comment = Comment.find(params[:id])
    comment.update!(comment_params)

    { data: comment.json_view }

  rescue => e
    {errs: [e.to_s], status_code: :internal_server_error, has_error: true}
  end

  def create
    comment = Comment.new(comment_params)
    comment.post_id = params[:post_id]

    comment.save!

    { data: comment.json_view }
  rescue => e
    {errs: I18n.t('errors.messages.blank'), status_code: "422", has_error: true}
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.destroy!

  rescue => e
    {errs: [e.to_s], status_code: :internal_server_error, has_error: true}
  end

  def show
    Comment.find(params[:id])

  rescue => e
    {errs: [e.to_s], status_code: :internal_server_error, has_error: true}
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id, :body)
  end

end


