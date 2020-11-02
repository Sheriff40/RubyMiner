document.addEventListener("turbolinks:load", function(){
    let like = document.querySelector('.like');
    var token = $("meta[name='csrf-token']").attr('content');
    if(like){
        like.addEventListener("click", function(){
            $.ajax({
                method: "Post",
                url: "/user_post_likes",
                data: {
                    user_id: window.currentUserId,
                    post_id: window.postId,
                    authenticity_token: token
                }
            }).done(function(data){
                let indicator = document.querySelector('.indicator');
                if(indicator.innerHTML=="Like"){
                    clearDiv(indicator);
                    indicator.innerHTML = "Unlike";
                }else if(indicator.innerHTML=="Unlike"){
                    clearDiv(indicator);
                    indicator.innerHTML="Like";
                }

                //dynamically show likes count
                let likesCount = document.querySelector('.likesCount');
                clearDiv(likesCount);
                likesCount.innerHTML = "("+ data.likes+")"
                likesCount.classList.add('mr-1')

            }).fail(function(data){
                console.log(data);
            })

            //function for clearing div content
            function clearDiv(div){
                div.innerHTML="";
            }
        })
    }
})