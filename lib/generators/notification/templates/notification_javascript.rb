document.addEventListener("turbolinks:load", function () {
  let noticeTitles = document.querySelectorAll(".noticeTitles");
  let token = $("meta[name='csrf-token']").attr("content");
  noticeTitles.forEach(function (data) {
    data.addEventListener("click", function () {
      let userNoticeId = this.getAttribute("usernoticeId");
      // Change the status of the notification from unseen to seen
      changeNotificationSeenStatus(userNoticeId);
    })
  });

  // Change the status of the notification from unseen to seen
  function changeNotificationSeenStatus(notice_student) {
    let request = $.ajax({
                             method: 'PUT',
                             url: '/user_notices/' + notice_student,
                             data: {authenticity_token: token}
                         });

    request.success(function (data) {
      console.log(data);
      location.href = data["notice_url"];
    });

    request.error(function (data) {
      console.log(data);
    });
  }
});
