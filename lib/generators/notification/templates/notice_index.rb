h4.d-inline-block.sub-heading.mb-0
| Notification
hr
/! Single Notification  Unseen
- @user_notices.each do |usernotice|
  - notice = Notice.find_by_id(usernotice.notice_id)
  - if usernotice.status
    a.d-flex.flex-row.align-items-center.justify-content-between.mt-3.p-2 href=(request.base_url + '/' +  notice.url)
      p.notification-title.text-secondary.mb-0
        i.fa.fa-bell.mr-3.bg-success.p-2.rounded-circle.text-white.fa-xs
        = notice.title
      span.float-right.text-secondary
        = notice.created_at.strftime("%e %B, %Y, %T")
  - else
    a.d-flex.flex-row.align-items-center.justify-content-between.mt-3.p-2.bg-light.noticeTitles style="cursor:pointer" userNoticeId="#{usernotice.id}"
      p.notification-title.text-secondary.mb-0
        i.fa.fa-bell.mr-3.bg-success.p-2.rounded-circle.text-white.fa-xs
        = notice.title
      span.float-right.text-secondary
        = notice.created_at.strftime("%e %B, %Y, %T")
hr