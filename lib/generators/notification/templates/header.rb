.col-12.pl-4
  span.mt-4.float-right
    .dropdown.d-inline-block.mr-3
      .dropdown-toggle aria-expanded="false" aria-haspopup="true" data-toggle="dropdown"
        i.fa.fa-bell.notificationBell.position-relative
        - notification_count = UserNotice.where(user_id: current_user, status:false).count
        .badge.badge-danger.position-absolute#notificationCount style="top:-13px; right:-1px;" = notification_count
      .dropdown-menu aria-labelledby="dropdownMenuButton" style = "width:285px; overflow:hidden;"
        h4.px-3 Notifications
        hr
        .position-relative
          - all_notices = UserNotice.where(user_id: current_user).map { |data| Notice.find_by_id(data.notice_id) }.reverse[0..5]
          - all_notices.each do |notice|
            - usernotice = UserNotice.find_by(notice_id: notice, user_id: current_user)
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

    .d-inline-block
      p.text-secondary
        | &nbsp;
        = Date.today.strftime("%d %B, %Y %A")

css:
  .unOpen {
    background: #f7f2f2 !important;
  }