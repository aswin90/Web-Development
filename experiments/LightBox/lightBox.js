function lightbox(insertContent, ajaxContentUrl) {
   
    (function ($) {
    
        if ($('#lightbox').size() == 0) {
            var theLightbox = $('<div id="lightbox"/>');
            var theShadow = $('<div id="lightbox-shadow"/>');
            $(theShadow).click(function (e) {
                closeLightbox();
            });
            $('body').append(theShadow);
            $('body').append(theLightbox);
        }
     
        $('#lightbox').empty();
       
        if (insertContent != null) {
            $('#lightbox').append(insertContent);
        }
 
        if (ajaxContentUrl != null) {
            
            $('#lightbox').append('<p class="loading">Loading...</p>');
            
            $.ajax({
                type: 'GET',
                url: ajaxContentUrl,
                success: function (data) {
                    
                    $('#lightbox').empty();
                    $('#lightbox').append(data);
                },
                error: function () {
                    alert('AJAX Failure!');
                }
            });
        }
   
        $('#lightbox').css('top', $(window).scrollTop() + 100 + 'px');
        $('#lightbox').show();
        $('#lightbox-shadow').show();

    })(jQuery); 

}

function closeLightbox() {
    
    (function ($) {
       
        $('#lightbox').hide();
        $('#lightbox-shadow').hide();     
        $('#lightbox').empty();

    })(jQuery); 

}