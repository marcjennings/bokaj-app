var apply_raty = function() 
	{ $('.rating').raty({ path:'/assets', scoreName: 'comment[rating]'}); 
	$('.rated').raty({ path: '/assets', 
    readOnly:true, 
    score: function() { 
      return $(this).attr('data-score'); 
    } 
  }); 
};

$(document).on('ready page:load', function(){ 
  apply_raty();

});


// ** PREVIOUS RATY JS USED ** //
// $(document).on('ready page:load', function(){
//  $('.rating').raty( { path: '/assets', scoreName: 'comment[rating]' });
//  $('.rated').raty({ path: '/assets',
//    readOnly: true,
//    score: function() {
//      return $(this).attr('data-score');
//    }
//  });
// });
