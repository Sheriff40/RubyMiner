.container.d-flex.align-items-center
  .col-5.px-4.mx-auto.mt-2.pt-4
    .card.shadow.p-3.mb-5.bg-white.rounded style=("border:none !important; border-radius: 10px 10px 10px 10px !important;")
      .card-body
        h4.text-center.text-secondary.mb-5 Sign Up
        = form_for(resource, as: resource_name, url: registration_path(resource_name)) do |f|
          = render "devise/shared/error_messages", resource: resource
          .form-group
            = f.email_field :email, autofocus: true,
                            autocomplete: "email",
                            placeholder: "Email",
                            class: "form-control",
                            required: true
          .form-group
            - if @minimum_password_length
              = f.password_field :password,
                                   autocomplete: "new-password",
                                   placeholder: "Password",
                                   class: "form-control",
                                   required: true
          .form-group
            = f.password_field :password_confirmation,
                                   autocomplete: "new-password",
                                   placeholder: "Password Confirmation",
                                   class: "form-control",
                                   required: true
          .actions
            = f.submit "Sign up", class: "btn btn-info form-control"
        .mt-3
          = render "devise/shared/links"