= form_for @role, html: {class: 'col-12'} do |f|
  .col-md-8.mb-3.p-0
    = f.label :name, "Role"
    = f.text_field :name, placeholder: "Enter the role title", required: true, class: 'form-control'
  h5.my-3 = "Permissions"

  #accordion
    .row
      - @models.keys.each do |model|
        - if !@models[model].empty?
          .col-md-4
            .card.my-2
              .card-header.bg-dark.text-light
                h5.mb-0
                  div aria-controls="collapseOne" aria-expanded="true" data-target="##{model}" data-toggle="collapse"
                    = model.titleize
              .collapse.show data-parent="#accordion" class="px-5 py-3" id="#{model}"
                - @models[model].each do |action|
                  hr
                    = "#{action.titleize}:"
                  - if @role.persisted? && !@role.role_and_responsibility.role_rule.nil? && eval(@role.role_and_responsibility.role_rule).include?(model)
                    - action_value = eval(@role.role_and_responsibility.role_rule)[model][action]
                    .text-center
                      | Activate:
                      input.mr-2  type = "radio" value="true" checked=(action_value=="true" ? "true" : nil) name= "[role_and_responsibility][#{model}][#{action}]"
                      | Inactivate:
                      input.ml-1 type = "radio" value="false" checked=(action_value =="false"? "true" : nil) name= "[role_and_responsibility][#{model}][#{action}]"
                  - else
                    .text-center
                      | Activate:
                      input.mr-2 type = "radio" value="true" name= "[role_and_responsibility][#{model}][#{action}]"
                      | Inactivate:
                      input.ml-1 type = "radio" value="false" name= "[role_and_responsibility][#{model}][#{action}]"
  .col-md-12
    hr
    - btn = @role.persisted? ? "Edit" : "Add"
    = f.submit btn, class: 'btn btn-main btn-dark mb-3'