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
        $('#input-comment-put-'+input).toggleClass('d-none')
        $('#input-comment-'+input).trigger("focus");

    })
}