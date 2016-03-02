var items = [];

$(document).ready(function(){
	$('.form-inputs > .items').keypress(function(event){
		if(event.which == 13){
			// regular expression replacing all single spaces with ""
			if($('#item_name').val().replace(/\s/g, "") === ''){
				// alert('you need to add an item');
				return;
			} 
			var input = $('#item_name').val();
			items.push(input);

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

		}

	});
});

