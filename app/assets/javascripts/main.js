var items = [];

$(document).ready(function(){
	$('#item_name').focus();
	$('#item_name').keypress(function(event){
		return true;
		if(event.which == 13){
			event.preventDefault();
			// regular expression replacing all single spaces with ""
			if($('#item_name').val().replace(/\s/g, "") === ''){
				// alert('you need to add an item');
				return false;
			} 
			var input = $('#item_name').val();
			var priority = $('#priority_list').val();
			items.push({'item':input,'priority':priority});

			var myList = $('.list-group');
			var newItem = $('<li class="list-group-item"></li>');
			newItem.html("<i class='glyphicon glyphicon-unchecked'></i> " + input);
			myList.append(newItem);

			$('#item_name').val(' ');

			newItem.on('click', function(){	
				$(this).find('i')
					.toggleClass('glyphicon-unchecked')
					.toggleClass('glyphicon-check');
			 });

			$('#item_name').focus();
			
			return false;

		}

	});
});


// ---------Java Script For Fridge Notes-----------

$(document).ready(function(){

	$('.note').on('mouseover', function(){
		$(this).toggleClass('noteHover');
	});

	$('.note').on('mouseleave', function(){
		$(this).toggleClass('noteHover');
	});
	

	$('.note').on('mouseover', function(){
		$('.overlayDiv').fadeIn(200);
		$('.overlayDiv > .noteContents').html($(this).data('msg'));
	});
	$('.note').on('mouseleave', function(){
		$('.overlayDiv').fadeOut(200);
	});

});

window.onload = function()
{
	var search = document.getElementById("search");
	console.log('on load');
	search.value = "";
}


