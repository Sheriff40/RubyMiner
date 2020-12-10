h4.d-inline-block.sub-heading
  i.fa.fa-cog.mr-3
  | Rule Set
hr
.row
  - @controllers.each do |controller|
    .col-md-4.mt-4
      .card
        .card-header
          h5.mb-0
            - @model_name = controller.to_s.split("Controller")[0]
            div aria-controls="collapseOne" aria-expanded="true" data-target="##{@model_name}" data-toggle="collapse"
              = @model_name.titleize
        .collapse.show data-parent="#accordion" class="px-5 py-3" id="#{@model_name}"
          select name="#{@model_name}" multiple="true" class= "controllers"
            hr
            - controller.action_methods.each do |action|

              / To check if the action had been selected previously in the current edit page.
              - if @rule_set.persisted?
                - selected_action = eval(@rule_set.model_action_hash)[@model_name]&.include?(action)

              / If the action has been previously selected, show the selected CSS
              option value="#{action}" class=(selected_action ? "selected": "") class="#{@model_name}" class="#{@model_name}#{action}"
                = "#{action.titleize}"

          / Only allow the deletion of the actions if the rule set is being edited
          - if @rule_set.persisted?
            h5.my-2
              | Selected Actions
            .row
              - eval(@rule_set.model_action_hash)[@model_name].each do |action|
                .badge.badge-secondary.mx-1.mt-1 class="#{@model_name}#{action}"
                  span
                    = action
                    button.p-0.btn.text-danger.d-inline.ml-1 action="#{action}" class="removeAction" controller="#{@model_name}"
                      | X

button class= "btn-dark btn-sm my-4" id= "finalizeRule" Save

css:
  .selected{
    background: #f18458 !important;
    color: white !important;
  }