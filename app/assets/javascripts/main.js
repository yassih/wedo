var items = [];
$(document).ready(function(){
	$('.form-inputs > .items').keypress(function(event){
		if(event.which == 13){
			console.log('hey');
			items.push( $('#item_name').val());
			
			var myList = $('.list-group');
			var newItem = $('<li class="list-group-item"></li>');
			newItem.html($('#item_name').val());
			myList.append(newItem);
			$('#item_name').val(' ');
		}


	});
});

