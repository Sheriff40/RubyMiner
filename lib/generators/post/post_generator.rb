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

  def add_routes
    file_path = "#{Rails.root}/config"
    routes_files = File.readlines("#{file_path}/routes.rb")
    routes_files.each.with_index(0) do |line,index|
      if index != (routes_files.count - 1)
        File.open("#{file_path}/routes_copy.rb","a") do |f|
          f.write(line)
        end
      end
    end
    File.open("#{file_path}/routes_copy.rb","a") do |f|
      f.write("\n\tresources :posts do \n\t\t resources :comments \n\tend \n\tresources :user_post_likes, only: :create\nend")
    end
    File.delete("#{file_path}/routes.rb")
    File.rename("#{file_path}/routes_copy.rb","#{file_path}/routes.rb")
  end

  def post_javascript
    file_path = "#{Rails.root}/app/javascript/packs"
    routes_files = File.readlines("#{file_path}/application.js")
    routes_files.each do |line|
      File.open("#{file_path}/application_copy.js","a") do |f|
        f.write(line)
      end
    end
    File.open("#{file_path}/application_copy.js","a") do |f|
      f.write("\nrequire(\"./posts\")")
    end
    File.delete("#{file_path}/application.js")
    File.rename("#{file_path}/application_copy.js","#{file_path}/application.js")
  end

  def copy_user_associations
    contains_private_method = false

    file_path = "#{Rails.root}/app/models"
    user_file_contents = File.readlines("#{file_path}/user.rb")

    user_file_contents.each.with_index(0) do |line,index|
      if line.strip == "private"
        contains_private_method = true

        # Copy the association before the private method
        File.open("#{file_path}/user_copy.rb","a") do |f|
          f.write("\n\thas_many :posts, dependent: :destroy\n\thas_one_attached :avatar, dependent: :destroy\n\n")
        end
      end

      # Continue copying the file until the last end keyword is encountered
      if index != (user_file_contents.count - 1)
        File.open("#{file_path}/user_copy.rb","a") do |f|
          f.write(line)
        end
      end
    end

    # Add associations if there is no private method and the copying has reached the last end keyword
    if !contains_private_method
      File.open("#{file_path}/user_copy.rb","a") do |f|
        f.write("\n\thas_many :posts, dependent: :destroy\n\thas_one_attached :avatar, dependent: :destroy")
      end
    end

    File.open("#{file_path}/user_copy.rb","a") do |f|
      f.write("\nend")
    end

    File.delete("#{file_path}/user.rb")
    File.rename("#{file_path}/user_copy.rb","#{file_path}/user.rb")
  end

end