$(document).on('turbolinks:load', events)

function events() {

    $('.like-button-emoji').on('click', function(e) {
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
}