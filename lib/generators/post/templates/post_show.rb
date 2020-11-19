.container
  .row
    .col-sm-3.mt-5
      = render 'posts/blog_sidebar'
    main.col-sm-9
      section
        - if @post.user
          .banner-bg
            .row.section-header.banner
              - user = @post.user
              .author.mt-3.text-center.col-md-6.offset-md-3
                - if user.avatar.attached?
                  = image_tag "#{user.avatar}.jpg", width: '100px', class: 'text-center rounded-circle border border-white'
                - else
                  = image_tag "avatar.png", width: '100px', class: 'text-center rounded-circle border border-white'

                br
                p.w-100
                  span.badge.bg-white
                    = user.email
                    |&nbsp;
        article.container.mt-5
          h1.text-center = @post.title
          - if @post.user
            / - current_page.tags << current_page.data.author
            - @additional_class = 'post-post'
            .details.text-center
              - words_per_min = @post.body.to_plain_text.split(' ').count/ 250.0
              .badge.badge-success.mx-1.fas.fa-book-reader
                |  #{words_per_min} Min. Read
              .badge.badge-primary.mx-1.fas.fa-calendar
                |  #{@post.created_at.strftime('%b %e, %Y')}
          .content.mt-5[class=(@additional_class)]
            == @post.body

          #disqus_thread.p-3
            p.likesCount.d-inline.text-info
              = "(#{@likes})"
              |&nbsp;
              p.like.d-inline.text-info
                i.fa.fa-thumbs-up.mr-2
                - if @user_post_like.nil?
                  .indicator.d-inline.text-info Like
                - else
                  .indicator.d-inline.text-info Unlike

            = render 'comments/form', parent_id: nil, reply_id: nil

            h3.mt-5.text-info Comments
            hr.bg-light
            - if @post.comments.count >0
              div.bg-light.p-3
                - @post.comments.where(parent_comment_id:nil).each do |comment|
                  - user = comment.user
                  p
                    - if user.avatar.attached?
                      =image_tag user.avatar, width:"25px", class:"rounded-circle mr-3"
                    - else
                      =image_tag "avatar.png", width:"25px", class:"rounded-circle mr-2"

                    strong =user.email
                    span
                      | &nbsp;
                      =comment.created_at
                    p = comment.description
                    p
                      a aria-controls="collapseExampleReply#{comment.id}" aria-expanded="false" data-toggle="collapse" href="#collapseExampleReply#{comment.id}" role="button"
                        | Reply
                      |  &nbsp; | &nbsp;
                      a aria-controls="collapseExample#{comment.id}" aria-expanded="false" data-toggle="collapse" href="#collapseExample#{comment.id}" role="button"
                        | View all replies
                      .collapse id="collapseExampleReply#{comment.id}"
                        = render 'comments/form', parent_id: comment.id, reply_id: nil

                      .collapse id="collapseExample#{comment.id}"
                        - comment.reply_comments.each do |reply|
                          .card.card-body
                            div style="margin-left: 30px"
                              - user = reply.user
                              p
                                - if user.avatar.attached?
                                  =image_tag user.avatar, width:"25px", class:"rounded-circle mr-3"
                                - else
                                  =image_tag "avatar.png", width:"25px", class:"rounded-circle mr-2"
                                strong =user.email
                                span
                                  | &nbsp;
                                  = reply.created_at
                                p = reply.description
                                a aria-controls="collapseExampleReplyNext#{reply.id}" aria-expanded="false" data-toggle="collapse" href="#collapseExampleReplyNext#{reply.id}" role="button"
                                  | Reply
                                .collapse id="collapseExampleReplyNext#{reply.id}"
                                  div
                                    = render 'comments/form', parent_id: comment.id, reply_id: reply.id
            - else
              h5.text-light No any comments for this post

- current_user_id = current_user ? current_user.id : ""
css:
  .like:hover {
    color: blue;
  }

  .like:active {
    color: blue;
    font-size: 25px;
  }

javascript:
    window.currentUserId = "#{current_user_id}"
    window.postId = "#{@post.id}"