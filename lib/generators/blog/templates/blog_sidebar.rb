.sidebar-search
  i.fa.fa-search
  input.search-input placeholder=("Search here...") size="50" type="text" /
.post-types
  nav
    #nav-tab.nav.nav-tabs.post-type-tab role="tablist"
      a#popular-tab.nav-item.nav-link.active aria-controls="nav-popular" aria-selected="true" data-toggle="tab" href="#popular-posts" role="tab"  Popular posts
      a#recent-tab.nav-item.nav-link aria-controls="nav-recent" aria-selected="false" data-toggle="tab" href="#recent-posts" role="tab"  Recent posts
  #post-tabContent.tab-content
    #popular-posts.tab-pane.fade.show.active aria-labelledby="popular-tab" role="tabpanel"
      - Post.all.order(like_count: :desc)[0..5].each do |post|
        .blog-small-single
          - if post.user.avatar.attached?
            = image_tag post.user.avatar, class: "arthur-small"
          - else
            = image_tag 'avatar.png', class: "arthur-small"
          .blog-small-content
            a href="#{post_path(post)}"
              = post.title.titleize
            span.d-flex.justify-content-between
              p
                = link_to edit_post_path(post) do
                  i.fa.fa-edit.text-info
                  | &nbsp;
                = post.user.username.titleize rescue post.user.email
              p.primary-color
                i.fa.fa-clock-o
                = post.created_at.strftime("%e %B, %Y")

    #recent-posts.tab-pane.fade aria-labelledby="recent-tab" role="tabpanel"
      - Post.all.order(created_at: :desc)[0..5].each do |post|
        .blog-small-single
          - if post.user.avatar.attached?
            = image_tag post.user.avatar, class: "arthur-small"
          - else
            = image_tag 'profile.png', class: "arthur-small"
          .blog-small-content
            a href="#{post_path(post)}"
              = post.title.titleize
            span.d-flex.justify-content-between
              p
                = link_to edit_post_path(post) do
                  i.fa.fa-edit.text-info
                  | &nbsp;
                = post.title.titleize
              p.primary-color
                i.fa.fa-clock-o
                = post.created_at.strftime("%e %B, %Y")