$('#createTask').submit(function () {
    let solution = $('#solution').text();
    let test = $('#test').text();
    let params = [
        {
            name: 'solution',
            value: solution
        },
        {
            name: 'test',
            value: test
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