.col-12
  .row
    .col-12.px-2.mt-3
      h3.text-secondary.mb-0 style=("color: #f36774 !important;")  Rule Sets
      .row.mt-5
        .col-12
          - if !RuleSet.first.nil?
            strong Model action hash:
            = @rule_set.model_action_hash
            br
            = link_to 'Edit', edit_rule_set_path, class: "btn-dark btn-sm my-4"
          - else
            br
            = link_to 'New', new_rule_set_path, class: "btn-dark btn-sm my-4"