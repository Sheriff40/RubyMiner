= form_for @post do |f|
  .field
    = f.label :title
    = f.text_field :title, class: "form-control"
  .field.mb-2
    = f.label :body
    = f.rich_text_area :body
  .field
    = f.label :summary
    = f.text_area :summary, class: "form-control"
  .field
    = f.label :tags, "Tags"
    = f.text_field :tags, class: "form-control"
  .actions.mt-3
    = f.submit class:"btn btn-success"
