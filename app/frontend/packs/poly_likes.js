$(document).on('turbolinks:load', events)

function events() {

    $('body').on('click', '.like-button-emoji', function(e) {
        var typeLike, idLike, emoji;
        typeLike = $(this).data('type');
        idLike = $(this).data('post');
        emoji = $(this).data('emoji');
        $.ajax({
            url:"/poly_likes",
            type: "POST",
            dataType:"script",
            data: {
                likeable_id: idLike,
                likeable_type: typeLike,
                emoji: emoji
            }
        });
    })

    // $('body').on('click', '#like-girl', function(e){
    //     let girl = $(this).data('girl');
    //     if($(this).data('method') == 'like'){
    //         $.ajax({
    //             url:"/poly_likes",
    //             type: "POST",
    //             dataType:"script",
    //             data:{
    //                 likeable_id:girl,
    //                 likeable_type:'Girl',
    //                 emoji:''
    //             }
    //         })
    //     }else{
    //         $.ajax({
    //             url:'/delete_like', 
    //             type: "Get",
    //             dataType:"script",
    //             data:{
    //                 likeable_id:girl
    //             }
    //         })
    //     }
    // })
}