= form_for @user do |f|
  .form-row
    .col-md-6
      .form-group
        = f.label :email,"Email:", class: "font-weight-bold fa-sm"
        = f.text_field :email, class: "form-control py-4", style: "border:none; border-radius: 8px 8px 8px 8px; background-color: #e4e4e4;", placeholder: "Enter email address",required: true

  .actions.text-center
    = f.submit class: "btn btn-outline-secondary px-5"