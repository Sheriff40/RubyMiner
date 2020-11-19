scss:
  $lineheight: 20px;
  aside {
    .article-container {
      p {
        img {
          display: inline-block;
          height: $lineheight;
          margin-top: -3px;
          border: 1px solid green;
          margin-right: 3px;
        }
      }
    }


    .date {
      font-size: 12px;
    }
  }

aside
  .article-container
    h6.m-0
      | Recent Articles

    - if !current_user.nil?
      = link_to"New Blog", new_post_path, class: "btn btn-sm btn-success mt-3"

    - Post.all[0...10].each do |article|
      .mt-2.p-1
        = link_to article.title.titleize, article, class: "text-decoration-none text-success"
        br
        - user = article.user
        - author_name = user.email
        p.m-0
          - if user.avatar.attached?
            = image_tag "#{user.avatar}.jpg", class: 'rounded-circle'
          - else
            = image_tag "avatar.png", class: 'rounded-circle'
          = author_name
          span.date
            = " (#{article.created_at.strftime('%b %e, %Y')})"
      hr

  .by-year-container
    h6.m-0.mt-4
      | By Year
    - Post.all.group_by { |a| a.created_at.year }.each do |year, articles|
      div
        = link_to year, articles.first, class: 'badge badge-secondary mr-1'