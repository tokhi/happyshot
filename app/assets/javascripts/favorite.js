$(".favorite").click(function() {
  var post_id = $(this).attr('id');
  $.ajax({
    type: "POST",
    url: 'favorites/' + post_id,
    success: function() {
      // change image or something
    }
  })
})