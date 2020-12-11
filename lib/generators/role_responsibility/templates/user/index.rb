.col-12
  .row
    .col-12.px-2.mt-3
      h3.text-secondary.mb-0 style=("color: #f36774 !important;")  Users
      .row.mt-5
        .col-12
          i.fa.fa-search.mr-2
          .search-filter.d-inline
          = link_to new_user_path, class: "btn btn-outline-primary btn-sm float-right" do
            i.fas.fa-plus
            |&nbsp;Add User
          table.table.table-hover.bg-white.shadow.p-3.mb-5.bg-white.rounded.text-center#example-table
            thead
              tr
                th scope="col-sm-2"
                  | Index
                th scope="col-sm-2"
                  | Email
                th scope="col-sm-3"
                  | Roles
                th scope="col-sm-2"
                  | Actions
            tbody
              - @users.each.with_index(1) do |user, index|
                tr
                  td = index
                  td = user.email
                  td = user.roles.map {|role| role.name}
                  td
                    span.action-btn
                      a.btn.btn-outline-primary.btn-sm href=assign_role_user_path(user)
                        i.fa.fa-users.mr-1.ml-0
                        | Assign Role
                      a href=edit_user_path(user)
                        i.fa.fa-edit.mr-1.ml-2.text-success