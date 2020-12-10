.dashboard-list-header.d-flex.justify-content-between.align-items-end
  h4.d-inline-block.sub-heading = Users
  .d-flex.justify-content-between.align-items-end
    a.btn.btn-main.float-right href=new_users_path
      i.fa.fa-plus.mr-1
      = t('add new')
hr
table.table.borderless-table
  thead
    tr
      th scope="col-sm-2" = S.n
      th scope="col-sm-2" = Email
      th scope="col-sm-3" = Roles
      th scope="col-sm-2" = Actions
  tbody
    - @users.each.with_index(1) do |user, index|
      tr
        th = index
        th = user.email
        th = cd_admin.user.roles.join(', ')
        th
          span.action-btn
            a.btn.btn-outline-primary.btn-sm href=assign_role_user_path(cd_admin.user, role: 'cd_admin')
              i.fa.fa-users.mr-1.ml-0
              = Assign Role