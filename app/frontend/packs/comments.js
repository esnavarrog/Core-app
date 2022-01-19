$(document).on('turbolinks:load', events)

function events() {
    $('body').on('click', '.button-comment', function (e) {
        var url = $(this).data('url')
        var message = $('#'+$(this).data('input')).val()
        var typeComment = $(this).data('type')
        var postId = $(this).data('id')
        var post = $(this).data('post')
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

    $('body').on('click', '.comment-button', function(){
        let input = $(this).data('input')
        let postType = $(this).data('type')
        let postId= $(this).data('post')
        let modal = $(this).data('modal')
        if (modal){
            open_comment(input, true)
            $('#button-comment-modal-'+postId).replaceWith(button_comment_modal(input, postType, postId, ''))
            $('#input-comment-modal-'+input).removeClass('reply-comment').val('').attr('placeholder', 'Commenta...')
            $('.comment-link-modal-'+input).removeClass('comment-link').html('')
            $('.modal-footer .comment-'+input).removeClass('comment-link').html('')
            $('.close-reply-modal-'+ input).addClass('d-none')
        }else{
            open_comment(input, false)
            $('#button-comment-'+postId).replaceWith(button_comment(input, postType, postId, ''))
            $('#input-comment-'+input).removeClass('reply-comment').val('').attr('placeholder', 'Commenta...')
            $('.comment-link-'+input).removeClass('comment-link').html('')
            $('.close-reply-'+ input).addClass('d-none')
        }
    })

    function button_comment(id, type, post, className){
        var button =    `<button id="button-comment-${post}" 
                            class="btn btn-outline-secondary button-comment ${className}" 
                            data-id="${id}" 
                            data-type="${type}" 
                            data-post="${post}"
                            data-url="/comment_new" 
                            type="button" 
                            data-input="input-comment-${post}">
                            Comenta
                        </button>`;
        return button
    }
    function button_comment_modal(id, type, post, className){
        var button =    `<button id="button-comment-modal-${post}" 
                            class="btn btn-outline-secondary button-comment ${className}" 
                            data-id="${id}" 
                            data-type="${type}" 
                            data-post="${post}"
                            data-url="/comment_new" 
                            type="button" 
                            data-input="input-comment-modal-${post}">
                            <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-send-fill" viewBox="0 0 16 16">
                                <path fill-rule="evenodd" d="M15.964.686a.5.5 0 0 0-.65-.65L.767 5.855H.766l-.452.18a.5.5 0 0 0-.082.887l.41.26.001.002 4.995 3.178 3.178 4.995.002.002.26.41a.5.5 0 0 0 .886-.083l6-15Zm-1.833 1.89.471-1.178-1.178.471L5.93 9.363l.338.215a.5.5 0 0 1 .154.154l.215.338 7.494-7.494Z"/>
                            </svg>
                        </button>`;
        return button
    }

    function open_comment(input, modal) {
        $('.input-group-comment').addClass('d-none')
        if(modal){
            if($('#input-comment-put-modal-'+input).hasClass('d-none')){
                $('#input-comment-put-modal-'+input).removeClass('d-none')
                $('#input-comment-modal-'+input).trigger("focus");
            }else{
                $('#input-comment-put-modal-'+input).addClass('d-none')
            }
        }else{
            if($('#input-comment-put-'+input).hasClass('d-none')){
                $('#input-comment-put-'+input).removeClass('d-none')
                $("#hr-bottom-"+input).removeClass('d-none')
                $('#input-comment-'+input).trigger("focus");
            }else{
                $('#input-comment-put-'+input).addClass('d-none')
            }
        }
    }

    $('body').on('contextmenu', '.img-published, .video-published', (e) => {
        e.preventDefault();
    })

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
        let modal = $(this).data('modal')
        let message = $('#'+ $(this).data('comment')).html()

        if(modal){
            $('#button-comment-modal-'+idPost).replaceWith(button_comment_modal(idClass, classType, idPost, 'reply-button'));
            $('#input-comment-modal-'+ idPost).addClass('reply-comment').attr('placeholder', 'Responde...').val('');
            $('#input-comment-put-modal-'+ idPost).removeClass('d-none')
            $('.comment-link-modal-'+ idPost).addClass('comment-link animate__fadeInUp').html(message)
            $('.close-reply-modal-'+ idPost).removeClass('d-none')
            open_comment(idPost, true)
            
        }else{
            $('#button-comment-'+idPost).replaceWith(button_comment(idClass, classType, idPost, 'reply-button'));
            $('#input-comment-'+ idPost).addClass('reply-comment').attr('placeholder', 'Responde...').val('');
            $('.comment-link-'+ idPost).addClass('comment-link animate__fadeInUp').html(message)
            $('.close-reply-'+ idPost).removeClass('d-none')
            open_comment(idPost, false)
        }

    })

    $('body').on('click', '.close-modal', function() {
        var modal = $(this).data('modal')
        modal = $(modal);
        // modal.remove()
    })

    $('body').on('click', '.close-general-modal', function() {
        // $('.modal-backdrop').remove()
    })

}