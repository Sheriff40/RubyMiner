h4.d-inline-block.sub-heading
  | Assign New Role
hr
= form_for @user, url: {action: 'update_role', method: :patch}, html: {class: 'col-12'} do |f|
  .row
    .col-md-12
      = f.label :role_ids, 'Roles'
      br
      = f.collection_check_boxes(:role_ids, Role.all {|x| x.name}, :id, :name) do |b|
        = b.label(class: "label-checkbox mr-4") {b.check_box(class: 'mr-2') + b.text}