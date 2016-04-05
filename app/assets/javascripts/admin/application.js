// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require markdown
//= require bootstrap-markdown
//= require admin/app
//= require colorpicker/bootstrap-colorpicker
//= require bootstrap-checkbox/bootstrap-checkbox
//= require bootstrap-checkbox/i18n/pt
//= require clipboard
//= require_tree .

new Clipboard('.clipboard-btn');

$(function () {
  //Colorpicker
  $(".my-colorpicker1").colorpicker();
  //color picker with addon
  $(".my-colorpicker2").colorpicker();
})

$(':checkbox').checkboxpicker();

$('#header_image_allowed_show_page').prop('disabled', true);
$('#footer_image_allowed_show_page').prop('disabled', true);
$('#blog_header_image_allowed_show_page').prop('disabled', true);
$('#blog_footer_image_allowed_show_page').prop('disabled', true);
