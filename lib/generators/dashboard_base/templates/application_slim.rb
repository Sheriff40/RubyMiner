doctype html
html
  head
    title Rails App
    = csrf_meta_tags
    = csp_meta_tag
    = stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload'

    //! Fonts and icons

    // Font Awesome
    link crossorigin="anonymous" href="https://use.fontawesome.com/releases/v5.0.8/css/all.css" integrity="sha384-3AB7yXWz4OeoZcPbieVW64vVXEwADiYyAEhwilzWsLw+9FgqpyjjStpPnpBO8o8S" rel="stylesheet" /

    // Google API fonts
    link href="https://fonts.googleapis.com/css2?family=Ubuntu&display=swap" rel="stylesheet"

    // Bootstrap style
    link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous"

    /! Material Kit CSS
    link href="/material-dashboard.css?v=2.1.2" rel="stylesheet"
    link href="/dashboard.css" rel="stylesheet"

    = javascript_pack_tag 'application', 'data-turbolinks-track': 'reload'
    script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"

  body class="#{controller_name } #{action_name}"
    .row.position-relative.container-fluid
      .position-absolute.zIndex1000
        - flash.each do |title, value|
          - if title == "notice"
              p.flash.alert.alert-success = value
          - elsif title == "alert"
              p.flash.alert.alert-danger = value
      = yield

  //script
  script src="https://code.jquery.com/jquery-1.12.4.min.js"
  script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
  script src="https://cdn.datatables.net/1.10.21/js/jquery.dataTables.min.js"
  script src="https://cdn.datatables.net/1.10.21/js/dataTables.bootstrap4.min.js"
  script crossorigin="anonymous" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
  script crossorigin="anonymous" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
