= form_for @role, html: {class: 'col-12'} do |f|
  .col-md-8.mb-3
    = f.label :name, "Name"
    = f.text_field :name, placeholder: "Enter Full Name", required: true, class: 'form-control'
  h5.my-3 = "Permissions"
  / .col-md-8.mb-3
  /   = f.collection_check_boxes(:permission_ids, Permission.all, :id, :action) do |b|
  /     = b.label(class: "label-checkbox mr-4") {b.check_box(class: 'mr-2') + t(".#{b.text}")}

  #accordion
    .row
      - @models.keys.each do |model|
        - if !@models[model].empty?
          .col-md-4
            .card
              .card-header
                h5.mb-0
                  div aria-controls="collapseOne" aria-expanded="true" data-target="##{model}" data-toggle="collapse"
                    = model.titleize
              .collapse.show data-parent="#accordion" class="px-5 py-3" id="#{model}"
                - @models[model].each do |action|
                  hr
                    = "#{action.titleize}:"
                  - if @role_responsibility_system.persisted? && !@role_responsibility_system.role_and_responsibility.role_rule.nil? && eval(@role_responsibility_system.role_and_responsibility.role_rule).include?(model)
                    - action_value = eval(@role_responsibility_system.role_and_responsibility.role_rule)[model][action]
                    .text-center
                      | Activate:
                      input.mr-2.ml-1  type = "radio" value="true" checked=(action_value=="true" ? "true" : nil) name= "[role_and_responsibility][#{model}][#{action}]"
                      | Inactivate:
                      input.ml-1 type = "radio" value="false" checked=(action_value =="false"? "true" : nil) name= "[role_and_responsibility][#{model}][#{action}]"
                  - else
                    .text-center
                      | Activate:
                      input.mr-2.ml-1 type = "radio" value="true" name= "[role_and_responsibility][#{model}][#{action}]"
                      | Inactivate:
                      input.ml-1 type = "radio" value="false" name= "[role_and_responsibility][#{model}][#{action}]"
  .col-md-12
    hr
    - btn = @role_responsibility_system.persisted? ? "Edit" : "Add"
    = f.submit btn, class: 'btn btn-main'