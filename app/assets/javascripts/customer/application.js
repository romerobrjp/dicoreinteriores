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
//= require clipboard
//= require angular
//= require angular-resource
//= require angular-file-upload
//= require angular-ui-notification
//= require_tree .

new Clipboard('.clipboard-btn');

$(function () {
  //Colorpicker
  $(".my-colorpicker1").colorpicker();
  //color picker with addon
  $(".my-colorpicker2").colorpicker();
})

angular.module('customer-app', ['ui-notification', 'project_request'])
.config(['NotificationProvider', function(NotificationProvider) {
        NotificationProvider.setOptions({
            delay: 5000,
            startTop: 20,
            startRight: 10,
            verticalSpacing: 20,
            horizontalSpacing: 20,
            positionX: 'left',
            positionY: 'bottom'
        });
}]);
