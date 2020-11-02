class PostGenerator < Rails::Generators::Base

  require 'date'

  source_root File.expand_path('templates', __dir__)

  def create_blog_controller
    copy_file "post_controller.rb", "app/controllers/posts_controller.rb"
  end

  def create_comment_controller
    copy_file "comment_controller.rb", "app/controllers/comments_controller.rb"
  end

  def create_user_like_controller
    copy_file "user_post_likes_controller.rb", "app/controllers/user_post_likes_controller.rb"
  end

  def create_blog_model
    copy_file "post_model.rb", "app/model/post.rb"
  end

  def create_comment_model
    copy_file "comment.rb", "app/model/comment.rb"
  end

  def create_user_like_model
    copy_file "user_like_model.rb", "app/model/user_post_like.rb"
  end

  def new_post_page
    copy_file "post_new.rb", "app/views/posts/new.html.slim"
  end

  def edit_post_page
    copy_file "post_edit.rb", "app/views/posts/edit.html.slim"
  end

  def form_post_page
    copy_file "post_form.rb", "app/views/posts/_form.html.slim"
  end

  def index_post_page
    copy_file "post_index.rb", "app/views/posts/index.html.slim"
  end

  def show_post_page
    copy_file "post_show.rb", "app/views/posts/show.html.slim"
  end

  def sidebar_post_page
    copy_file "post_sidebar.rb", "app/views/posts/_blog_sidebar.html.slim"
  end

  def comment_new_page
    copy_file "comments_new.rb", "app/views/comments/_form.html.slim"
  end

  def blogs_javascript
    copy_file "post_javascript.rb", "app/javascript/packs/posts.js"
  end

  def get_current_date
    @current_date = DateTime.now.strftime("%Y%m%d%H%m%S").to_i
  end

  def blogs_migration
    get_current_date
    copy_file "post_migration.rb", "db/migrate/#{@current_date}_create_posts.rb"
  end

  def comments_migration
    get_current_date
    copy_file "comment_migration.rb", "db/migrate/#{@current_date + 1}_create_comments.rb"
  end

  def user_post_likes_migration
    get_current_date
    copy_file "user_post_like_migration.rb", "db/migrate/#{@current_date + 2}_create_user_post_likes.rb"
  end

  def add_post_css
    copy_file "posts_css.rb", "app/assets/stylesheets/posts.scss"
  end
end