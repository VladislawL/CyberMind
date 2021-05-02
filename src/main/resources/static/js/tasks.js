$(".tag").click(function () {
    let $this = $(this);
    $this.toggleClass("selected");
});

$('#searchForm').submit(function() {
    params = [
        {
            name: 'tags',
            value: $.map(
                $(".tag.selected"),
                function(element) {
                    return $(element).text()
                })
                .join(",")
        },
        {
            name: 'level',
            value: new URL(window.location.href).searchParams.get("level")
        }
    ];
    $.each(params, function(i,param) {
        $('<input />').attr('type', 'hidden')
            .attr('name', param.name)
            .attr('value', param.value)
            .appendTo('#searchForm');
    });

    return true;
});