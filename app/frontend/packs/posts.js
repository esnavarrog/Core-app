$(document).on('turbolinks:load', events)

function events() {
    $('#modal-publish').on('hidden.bs.modal', function () {
        $('#post_img').val('')
        $('#post_video').val('')
        console.log('cerrado modal')
    })

    // pagination
    $(window).on('scroll', function(){
        if ($(window).scrollTop() + $(window).height() == $(document).height()){
            console.log('listo')
            pagination("pc")
        }
    })

    $('window').on('touchmove', function() {
        if ($(window).scrollTop() + $(window).height() == $(document).height()){
            pagination("mobil")
        }
    });

    function pagination(display){
        let url = $('#paginate-posts .pagination .next a').attr('href');
        console.log(display)
        if(url){
            $.ajax({
                type: "GET",
                url: url,
                dataType: "script",
                data:{
                    data:display
                }
            });
        }else{
            $('#paginate-posts').removeClass('d-none').html('No tenemos más publicaciones.')
        }
    }
}