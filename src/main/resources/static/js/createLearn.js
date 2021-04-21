$('#createLearn').submit(function () {
    let text = $('#chapterText').text();
    let params = [
        {
            name: 'text',
            value: text
        }
    ];
    $(this).append($.map(params, function (param) {
        return   $('<input>', {
            type: 'hidden',
            name: param.name,
            value: param.value
        })
    }))
});