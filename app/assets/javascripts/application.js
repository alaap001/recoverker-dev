// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function(){
$(document).on('click','.q1',function(){
	$(this).closest('.q1').find('.ans').slideToggle();

		$(this).css({
		'background-color':'#f5f5f5',
		'transition':'all .5s'
	}
	);

});

$('.simple_form input').blur(function()
{
	console.log($(this));
    if( !$(this).val() ) {
          $(this).find('button').addClass('disable');
    }
});

$(document).on('click','.q2',function(){
	$(this).closest('.q2').find('.ans2').slideToggle();

		$(this).css({
		'background-color':'#f5f5f5',
		'transition':'all .5s'
	}
	);

});

});
