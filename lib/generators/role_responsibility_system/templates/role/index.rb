.dashboard-list-header.d-flex.justify-content-between.align-items-end
  h4.d-inline-block.sub-heading
    i.fas.fa-users
    span.ml-3
      = t "role_responsibility_system"
  .d-flex.justify-content-between.align-items-end
    .search-wrapper.mr-2
      i.fa.fa-search.mr-2
      input.search-box placeholder=("#{t('Search Here')}") type="search"
    a.btn.btn-main.float-right href=new_role_path
      i.fa.fa-plus.mr-1
      span.ml-2 = t 'Add new'
        / | Add New Role
hr
table.table.borderless-table
  thead
    tr
      th scope="col-sm-2" = t 's n'
      th scope="col-sm-3" = t 'name'
      th scope="col-sm-4" = t 'permissions'
      th scope="col-sm-4" = t 'model permissions'
      th scope="col-sm-3" = t 'actions'
  tbody
    - @roles.each.with_index(1) do |role_responsibility_system, index|
      tr
        th = index
        th = role_responsibility_system.name.titleize
        th = role_responsibility_system.my_permission&.join(', ')&.titleize
        th = role_responsibility_system.model_role_permission&.models&.join(', ')&.titleize
        th
          span.action-btn
            a.mr-2 href=edit_role_path(role_responsibility_system)
              i.fas.fa-pencil-alt.fa-sm
            = link_to role_path(role_responsibility_system), method: :delete, data: { confirm: 'Are you sure to delete?' } do
              i.fas.fa-trash.fa-sm