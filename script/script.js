$(document).ready(function (){
    $('.form_sign_up').on('submit', function (e){
        e.preventDefault();
        let formData = new FormData(this);

        $.ajax({
            type: "POST",
            url: $(this).attr('action'),
            data: formData,
            cache: false,
            contentType: false,
            processData: false
        })
        .done(function( msg ) {
            alert( "Data Saved: " + msg );
        });

        // $('input.title').val("");
        // $('textarea.content').val("");
    })
});