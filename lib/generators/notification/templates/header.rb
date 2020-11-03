.header-section.primary-bg
  .layout-container
    nav.navbar.navbar-expand-md.navbar-light
      a.navbar-brand href="#{root_path}"
        = image_tag('emblem.png', :class => "nav-logo")
      button.navbar-toggler type="button"
        span.navbar-toggler-icon
        .collapse.navbar-collapse
          ul.ml-auto.navbar-nav
            li.nav-item
              - if current_user
                .dropdown
                  #dropdownMenuButton.mr-3 aria-expanded="false" aria-haspopup="true" data-toggle="dropdown"
                    i.position-relative.fas.fa-bell
                    .badge.badge-danger#notificationCount.position-absolute style="top: -13px;right: 5px;"
                      // Get all the current users notification
                      - user_notice = UserNotice.where(user_id: current_user)
                      // Only display notification number if they'r not seen and if greater than 0
                      - notification_count = user_notice.where(status: false).count
                      = (notification_count.zero? ? "" : notification_count)
                  .dropdown-menu class="p-0" aria-labelledby="dropdownMenuButton"
                    h5.py-2.ml-3.small
                      | Notifications
                    // Code to list all the notices and their respective url's
                    #notificationNavBar
                    - user_notice.order(created_at: :desc)[0..4].each do |usernotice|
                      - notice = Notice.find_by_id(usernotice.notice_id)
                      - if usernotice.status
                        a.dropdown-item.p-3.border href= notice.url
                          = notice.title
                      - else
                        a.dropdown-item.noticeTitles.p-3.border userNoticeId="#{usernotice.id}" class= "unOpen"
                          = notice.title
                    hr.p-0.m-0
                      .text-center.my-2
                        = link_to notices_path, class: "text-center" do
                          | See All