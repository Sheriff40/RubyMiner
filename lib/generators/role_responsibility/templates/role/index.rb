.col-12
  .row
    .col-12.px-2.mt-3
      h3.text-secondary.mb-0 style=("color: #f36774 !important;")  Roles
      .row.mt-5
        .col-12
          i.fa.fa-search.mr-2
          .search-filter.d-inline
          = link_to new_role_path, class: "btn btn-outline-primary btn-sm float-right" do
            i.fas.fa-plus
            |&nbsp;Add Role

          table.table.table-hover.bg-white.shadow.p-3.mb-5.bg-white.rounded.text-center#example-table
            thead
              tr
                th scope="col-sm-2"
                  | S.n
                th scope="col-sm-3"
                  | Name
                th scope="col-sm-4"
                  | Permissions
                th scope="col-sm-3"
                  | Actions
            tbody
              - @roles.each.with_index(1) do |role, index|
                tr
                  td = index
                  td = role.name.titleize
                  td = role.role_and_responsibility.role_rule
                  td
                    span.action-btn
                      a.mr-2 href=edit_role_path(role)
                        i.fas.fa-pencil-alt.fa-sm.text-primary
                      = link_to role_path(role), method: :delete, data: { confirm: 'Are you sure to delete?' } do
                        i.fas.fa-trash.fa-sm.text-danger