.col-12.px-1
  .card.mb-5.bg-light style=("border:none !important;  height: 100vh !important;")
    .card-body.px-1
      h3.text-secondary.mb-0 style=("color: #f36774 !important;")  Blog
      .row
        .col-12.container.mt-5
          .card.shadow.p-3.mb-5.bg-white.rounded style=("border:none !important; border-radius: 10px 10px 10px 10px !important;")
            .card-body
              h3.text-secondary.mb-5 Edit Blog
              == render 'form'