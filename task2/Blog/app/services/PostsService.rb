class PostsService
  attr_accessor :params

  def initialize(params = nil)
    @params = params
  end

  def index
    Post.where(mark_for_deletion: false).first(10)
  end

  def edit
    data = Post.find(params[:id])

    { data: data.json_view }
  rescue => e
    {errs: [e.to_s], status_code: :internal_server_error, has_error: true}
  end

  def update
    @post = Post.find(params[:id])
    @post.update!(posts_params)

    { data: @post.json_view }

  rescue => e
    {errs: [e.to_s], status_code: :internal_server_error, has_error: true}
  end

  def create
    post = Post.new(posts_params)
    post.save!

    { data: post.json_view }


  rescue => e
    {errs: [e.to_s], status_code: :internal_server_error, has_error: true}
  end

  def destroy
    data = Post.find(params[:id])
    data.update(mark_for_deletion: true)

    #რადგან პოსტებს mark_for_deletion აქვს dependent: :destroy-ს აზრი ეკარგება და აქედან მომიწია კომენტარების წაშლაც
    Comment.where(post_id: params[:id]).destroy_all
    data

  rescue => e
    {errs: [e.to_s], status_code: :internal_server_error, has_error: true}
  end

  def show
    Post.find(params[:id])

  rescue => e
    {errs: [e.to_s], status_code: :internal_server_error, has_error: true}
  end

  private

  def posts_params
    params.require(:post).permit(:title, :body, :mark_for_deletion)
  end

end

