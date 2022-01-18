$(document).on('turbolinks:load', events)

function events() {
    $('body').on('click', '.button-comment', function reply(e) {
        let url = $(this).data('url')
        let message = $('#'+$(this).data('input')).val()
        let typeComment = $(this).data('type')
        let postId = $(this).data('id')
        let post = $(this).data('post')
        $.ajax({
            url: url,
            method: 'POST',
            dataType: 'script',
            data: {
                message: message,
                commentable_id: postId,
                commentable_type: typeComment, 
                post_id:post
            }
        })
    })

    function reply(e) {
        let url = $(this).data('url')
        let message = $('#'+$(this).data('input')).val()
        let typeComment = $(this).data('type')
        let postId = $(this).data('id')
        let post = $(this).data('post')
        console.log(postId)
        $.ajax({
            url: url,
            method: 'POST',
            dataType: 'script',
            data: {
                message: message,
                commentable_id: postId,
                commentable_type: typeComment, 
                post_id:post
            }
        })
    }

    $('body').on('click', '.comment-button', function(){
        let input = $(this).data('input')
        let postType = $(this).data('type')

        open_comment(input)
        $('#button-comment-'+input).removeClass('reply-button').attr('data-type', postType).attr('data-id', input)
        $('#input-comment-'+input).removeClass('reply-comment').val('').attr('placeholder', 'Commenta...')
        $('.comment-link-'+input).removeClass('comment-link').html('')
        $('.close-reply-'+ input).addClass('d-none')

    })

    function open_comment(input) {
        $('.input-group-comment').addClass('d-none')
        if($('#input-comment-put-'+input).hasClass('d-none')){
            $('#input-comment-put-'+input).removeClass('d-none')
            $("#hr-bottom-"+input).removeClass('d-none')
            $('#input-comment-'+input).trigger("focus");
        }else{
            $('#input-comment-put-'+input).addClass('d-none')
        }
    }

    $(".input-comment").keypress(function(e) {
        var button = $(this).data('button');
        if (e.which == 13) {
            $("#" + button).click()
        };
    });

    $('body').on('click', '.link-reply', function(){
        let idClass = $(this).data('id');
        let idPost = $(this).data('post');
        let classType = $(this).data('type');
        let message = $('#'+ $(this).data('comment')).html()
        let buttonComment = $('#button-comment-'+idPost)
        let buttonCommentModal = $('#button-comment-modal-'+idPost)


        $(buttonComment).attr('data-id',''+ idClass).addClass('reply-button');
        $(buttonCommentModal).attr('data-id',''+ idClass).addClass('reply-button');
        $('#input-comment-'+ idPost).addClass('reply-comment').attr('placeholder', 'Responde...');
        $('#input-comment-modal-'+ idPost).addClass('reply-comment').attr('placeholder', 'Responde...');
        $(buttonComment).attr('data-type',''+ classType);
        $(buttonCommentModal).attr('data-type',''+ classType);
        $('.comment-link-'+ idPost).addClass('comment-link animate__fadeInUp').html(message)
        $('.close-reply-'+ idPost).removeClass('d-none')
        open_comment(idPost)
        $('#input-comment-put-modal-'+ idPost).removeClass('d-none')
    })
}