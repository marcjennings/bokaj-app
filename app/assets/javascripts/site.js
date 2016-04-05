$(document).on('ready page:load', function(){ 
  apply_raty();

  $( "#alerts" ).delay(500).fadeIn( 'normal', function() {
    $(this).delay(1000).fadeOut();
    // Animation complete.
  });
});

var apply_raty = function() 
	{ $('.rating').raty({ path:'/assets', scoreName: 'comment[rating]'}); 
	$('.rated').raty({ path: '/assets', 
    readOnly:true, 
    score: function() { 
      return $(this).attr('data-score'); 
    } 
  }); 
};

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

 // $( "#alerts" ).fadeOut( 3000, function() {
 //    // Animation complete.
 //  });