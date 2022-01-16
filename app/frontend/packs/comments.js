$(document).on('turbolinks:load', events)

function events() {
    $('body').on('click', '.button-comment', reply)

    function reply(e) {
        let url = $(this).data('url')
        let input = $(this).data('input')
        let message = $('#'+input).val()
        let typeComment = $(this).data('type')
        let postId = $(this).data('id')
        $.ajax({
            url: url,
            method: 'POST',
            dataType: 'script',
            data: {
                message: message,
                commentable_id: postId,
                commentable_type: typeComment
            }
        })
    }

    $('body').on('click', '.comment-button', function(){
        let input = $(this).data('input')
        $('.input-group-comment').addClass('d-none')
        if($('#input-comment-put-'+input).hasClass('d-none')){
            $('#input-comment-put-'+input).removeClass('d-none')
            $("#hr-bottom-"+input).removeClass('d-none')
            $('#input-comment-'+input).trigger("focus");
        }else{
            $('#input-comment-put-'+input).addClass('d-none')
        }

    })

    $(".input-comment").keypress(function(e) {
        var button = $(this).data('button');
        if (e.which == 13) {
            $("#" + button).click()
        };
    });
}