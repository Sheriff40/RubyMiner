.card.border-left.h-100.no-border style=("border-radius: 15px 0px 0px 15px;")
  .card-body.p-3
    .d-flex.align-content-center.mt-1.mb-3
      p.text-center.pb-0.mb-0
    nav
      #nav-tab.nav.navbar-nav.sidebar-nav role="tablist"
        a.nav-item.nav-link.text-secondary.pl-2.fa-sm.font-weight-bold.mb-2 href=root_path  class=(controller_name=='dashboard_base' ? 'active' : '')
          i.fa.fa-home.mr-3
          | Dashboard
        = link_to destroy_user_session_path, method:"delete", class:"text-decoration-none"
          .nav-item.nav-link.text-secondary.pl-2.fa-sm.font-weight-bold.my-2
            i.fas.fa-sign-out-alt.mr-3
            | Log Out