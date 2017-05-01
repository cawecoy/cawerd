if (typeof rd_server_url !== 'undefined') {
	var rd_server_url = rd_server_url?rd_server_url:"https://cawerd.herokuapp.com";
}

function getDateTime() {
    var now     = new Date(); 
    var year    = now.getFullYear();
    var month   = now.getMonth()+1; 
    var day     = now.getDate();
    var hour    = now.getHours();
    var minute  = now.getMinutes();
    var second  = now.getSeconds(); 
    if(month.toString().length == 1) {
        var month = '0'+month;
    }
    if(day.toString().length == 1) {
        var day = '0'+day;
    }   
    if(hour.toString().length == 1) {
        var hour = '0'+hour;
    }
    if(minute.toString().length == 1) {
        var minute = '0'+minute;
    }
    if(second.toString().length == 1) {
        var second = '0'+second;
    }   
    var dateTime = year+'/'+month+'/'+day+' '+hour+':'+minute+':'+second;   
     return dateTime;
}

function generateUUID () { // Public Domain/MIT
    var d = new Date().getTime();
    if (typeof performance !== 'undefined' && typeof performance.now === 'function'){
        d += performance.now(); //use high-precision timer if available
    }
    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
        var r = (d + Math.random() * 16) % 16 | 0;
        d = Math.floor(d / 16);
        return (c === 'x' ? r : (r & 0x3 | 0x8)).toString(16);
    });
}

$("form").submit(function(e){
    var user = {
    	user:{
    		'name': $(this).find('input[name="name"]').val(),
    		'email': $(this).find('input[name="email"]').val(),
    		'uid': $(this).find('input[name="uid"]').val(),
    		'url': $(this).find('input[name="url"]').val()
    	}
    };

    try{
		$.ajax({
			type: 'POST',
			url: rd_server_url+'/users.json',
			data: user
		})
		.done(function(response){
			console.log(response);
		})
		.fail(function(response){
			console.log(response);
		});
    }
    catch(e){
		console.log(e)
	}
	
	return true;
});

$(document).ready(function() {
	if (typeof(Storage) !== "undefined") {
		uid = localStorage.uid;
		if (!uid) {
			localStorage.uid = uid = generateUUID();
		}
	}
	else {
		console.log('Web Storage não suportado.')
	}

	$('<input>').attr({
		type: 'hidden',
		name: 'uid',
		value: uid
	}).appendTo('form');

	$('<input>').attr({
		type: 'hidden',
		name: 'url',
		value: window.location.href.split('?')[0]
	}).appendTo('form');

	var page = { 
		page: {
			title: document.title, 
			url: window.location.href.split('?')[0], 
			uid: uid, 
			access_at: getDateTime() 
		}
	};
	
	try{
		$.ajax({
			type: 'POST',
			url: rd_server_url+'/pages.json',
			data: page
		})
		.done(function(response){
			console.log(response);
		})
		.fail(function(response){
			console.log(response);
		});
	}
	catch(e){
		console.log(e)
	}
});