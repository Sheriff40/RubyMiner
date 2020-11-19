.container
  .row
    .col-sm-3.mt-5
      = render 'blog_sidebar'
    .col-sm-9
      .section
        article.container.mt-5
          h1.text-center Blog
        .content.mt-5
          main#post
            section
              .container
                p
                - @posts.each_with_index do |article, i|
                  .card
                    .card-header style="background: red; no-repeat center center; background-size: cover;"
                      .inner.p-1 style="background: rgba(255,255,255,.8)"
                        h4.my-1 style="text-shadow: 0 0 2px white;"
                          = link_to article.title.titleize, article, class: "text-success"
                          | &nbsp;
                        p.details.text-left.my-0
                          span.badge.badge-white.mx-1.border.border-brand-green
                            - if article.user
                              - user =article.user
                              - if user.avatar.attached?
                                = image_tag "#{user.image}.jpg", width: '20px', class: 'rounded-circle mr-1', style: 'margin-top: -1px'
                              - else
                                = image_tag "avatar.png", width: '20px', class: 'rounded-circle mr-1', style: 'margin-top: -1px'
                              = user.email
                              |&nbsp;
                            - words_per_min = article.body.to_plain_text.split(' ').count/ 250.0
                          span.badge.badge-success.mx-1.fas.fa-book-reader
                            |  #{words_per_min} Min. Read
                          span.badge.badge-primary.mx-1.fas.fa-calendar
                            |  #{article.created_at.strftime('%b %e, %Y')}
                    .card-body
                      = article.summary.split[0..30].join(' ')
                      br
                      = link_to 'Read More..', article, class: "text-success"