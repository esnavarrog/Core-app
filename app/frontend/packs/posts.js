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
            let url = $('#paginate-posts .pagination .next a').attr('href');
            console.log(url)
            if(url){
                $.ajax({
                    type: "GET",
                    url: url,
                    dataType: "script"
                });
            }else{
                console.log('no esta paginando')
                $('#paginate-posts').removeClass('d-none').html('No tenemos más publicaciones.')
            }
        }else{
            console.log('no pagina')
        }
    })
    $('window').on('touchmove', function(event) {

        event.preventDefault(); 
    
        var distanceY = window.pageYOffset
        if (distanceY > 0) {
            let url = $('#paginate-posts .pagination .next a').attr('href');
            console.log(url)
            if(url){
                $.ajax({
                    type: "GET",
                    url: url,
                    dataType: "script"
                });
            }else{
                console.log('no esta paginando')
                $('#paginate-posts').removeClass('d-none').html('No tenemos más publicaciones.')
            }
        }
    });
}