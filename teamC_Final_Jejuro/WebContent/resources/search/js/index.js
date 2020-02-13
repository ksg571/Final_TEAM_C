// -
function expand() {
	$(".search").toggleClass("close");
	$(".input").toggleClass("square");
	
	if ($('.search').hasClass('close')) {
		$('input').focus();
	} else {
		$('input').blur();
	}
	
	if($('ul').hide()){
		$('ul').show();
	}else{
		$('ul').hide();
	}
	$('ul').hide();
	$('ul').fadeIn(2000);
	
}
$('button').on('click', expand);