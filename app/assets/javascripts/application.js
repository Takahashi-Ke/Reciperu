// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require jquery
//= require jquery_nested_form
//= require bootstrap-sprockets
//= require_tree .

/* global $*/

// 投稿画像プレビュー
$(document).on("turbolinks:load", function(){
  function readURL(input) {
    if(input.files && input.files[0]){
      var reader = new FileReader();
      reader.onload = function (e) {
        $('.img_prev').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
  $("#user_user_image").change(function(){
    readURL(this);
  });
  $("#recipe_recipe_image").change(function(){
    readURL(this);
  });
});

// フォームの数指定
$(function() {
  $(document).on('nested:fieldAdded', function(e) {
    var link = $(e.currentTarget.activeElement);
    if (!link.data('limit')) {
      return;
    }
    if (link.siblings('.fields:visible').length >= link.data('limit')) {
      link.hide();
    }
  });

  $(document).on('nested:fieldRemoved', function(e) {
    var link = $(e.target).siblings('a.add_nested_fields');
    if (!link.data('limit')) {
      return;
    }
    if (link.siblings('.fields:visible').length < link.data('limit')) {
      link.show();
    }
  });
})



// タブメニュー切り替え
$(document).on("turbolinks:load", function(){
  $('#tab-contents .tab[id != "tab1"]').hide();
});
$(document).on("turbolinks:load", function(){
  $('#tab-menu a').on('click', function(event) {
    $("#tab-contents .tab").hide();
    $("#tab-menu .active").removeClass("active");
    $(this).addClass("active");
    $($(this).attr("href")).show();
    event.preventDefault();
  });
  
});


