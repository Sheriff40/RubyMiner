.row
  .col-1
    - if current_user
      - if current_user.avatar.attached?
        = image_tag current_user.avatar, width: "25px"
      - else
        = image_tag "avatar.png", width: "40px"
    - else
      = image_tag "avatar.png", width: "40px"
  .col-11
    = form_for [@post, @comment] do |f|
      .field
        - if user_signed_in?
          = f.hidden_field :user_id, value: current_user.id
        - if !(parent_id.nil?)
          = f.text_area :description, value: (reply_id.nil? ? "#{@post.comments.find_by_id(parent_id).user.email} " : " #{@post.comments.find_by_id(reply_id).user.email} "),
                  placeholder: "Comments here", class: "w-75 "
          = f.hidden_field :parent_comment_id, value: parent_id
        - else
          = f.text_area :description, placeholder: "Comments here", class: "w-75"
          = f.hidden_field :parent_comment_id
        = f.hidden_field :post_id
      .actions.d-inline
        = f.submit "Comment", class: "btn btn-success btn-sm"