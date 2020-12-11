.col-12
  .row
    .col-12.px-1
      .card.mb-5.bg-light style=("border:none !important;  height: 100vh !important;")
        .card-body.px-1
          h3.text-secondary.mb-0 style=("color: #f36774 !important;") Users
          .row
            .col-12.container.mt-5
              .card.shadow.p-3.mb-5.bg-white.rounded style=("border:none !important; border-radius: 10px 10px 10px 10px !important;")
                .card-body
                  h3.text-secondary.mb-5 Assign Roles
                  = form_for @user, url: {action: 'update_role', method: :patch}, html: {class: 'col-12'} do |f|
                    .row
                      .col-md-12
                        = f.label :role_ids, 'Roles:'
                        br
                        = f.collection_check_boxes(:role_ids, Role.all { |x| x.name }, :id, :name) do |b|
                          = b.label(class: "label-checkbox mr-4") { b.check_box(class: 'mr-2') + b.text }
                      = f.submit class: "btn btn-sm btn-dark mt-2 ml-3"