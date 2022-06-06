const { post } = require("jquery")

$(document).on('turbolinks:load', events)

function events() {
    $('#modal-publish').on('hidden.bs.modal', function () {
        $('#post_img').val('')
        $('#post_video').val('')
        console.log('cerrado modal')
    })

    // pagination
    $(window).on('scroll', function(){
        if ($(window).scrollTop() + window.innerHeight == $(document).height()){
            console.log('listo')
            pagination()
        }
    })

    $('window').on('touchmove', function() {
        if ($(window).scrollTop() + window.innerHeight == $(document).height()){
            pagination()
        }
    });
    // let lastPost;
    // let observador = new IntersectionObserver((entradas) => {
    //     console.log(entradas)
    //     entradas.forEach(entrada => {
    //         if (entrada.isIntersecting){
    //             pagination()
    //         }
    //     })
    // }, {
    //     rootMargin: '0px 0px 200px 0px',
    //     threshold: 1.0
    // });

    function pagination(){
        // const posts = document.querySelectorAll('#box-published .published');
        // if(lastPost){
        //     observador.unobserve(lastPost);
        // }
        // lastPost = posts[post.length -1];
        // observador.observe(lastPost)
        // console.log(lastPost)
        let url = $('#next-page');
        if(url.attr('href')){
            // $.ajax({
            //     type: "GET",
            //     url: url,
            //     dataType: "script"
            // });
            document.getElementById("next-page").click();
        }else{
            $('#paginate-posts').removeClass('hide').html('No tenemos más publicaciones.')
        }
    }
}