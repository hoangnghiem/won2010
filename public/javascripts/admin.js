$(function() {
  $('.grid td').hover(function() {
    $(this).parent().children('td').addClass('hover');
  }, function() {
    $(this).parent().children('td').removeClass('hover');
  })
})
function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).parent().hide();
}
function remove_sections(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).parent().parent().fadeOut();
}
function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  $(link).prev().after(content.replace(regexp, new_id)).hide().fadeIn();
  var mceId = $(link).prev().children(".section-fields").find("textarea").attr('id');
  tinyMCE.execCommand('mceAddControl', false, mceId);
}
