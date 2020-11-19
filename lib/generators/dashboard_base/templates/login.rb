.container.d-flex.align-items-center
  .col-5.px-4.mx-auto.mt-2.pt-2
    .card.shadow.p-3.mb-5.bg-white.rounded style=("border:none !important; border-radius: 10px 10px 10px 10px !important;")
      .card-body
        h4.text-center.text-secondary.mb-5 Sign In
        = form_for(resource, as: resource_name, url: session_path(resource_name)) do |f|
          .form-group
            label.font-weight-bold.fa-sm for="exampleInputEmail1"  Email address
            = f.text_field :email, autofocus: true,
                           autocomplete: "email",
                           placeholder: "Email",
                           class: "form-control",
                           style:"border:none; border-radius: 8px 8px 8px 8px; background-color: #f3f3f4;",
                           required: true
          .form-group
            label.font-weight-bold.fa-sm for="exampleInputPassword1"  Password
            = f.password_field :password,
                               autocomplete: "current-password",
                               placeholder: "Password",
                               class: "form-control",
                               style:"border:none; border-radius: 8px 8px 8px 8px; background-color: #f3f3f4;",
                               required: true


          .form-group
            - if devise_mapping.rememberable?
              .form-group
                = f.check_box :remember_me, class: "mr-2"
                = f.label :remember_me
            .actions
              = f.submit "Log in", class: "btn btn form-control col-4 text-light",style:("background-color: #ea4c89;border: none;")
        = render "devise/shared/links"
