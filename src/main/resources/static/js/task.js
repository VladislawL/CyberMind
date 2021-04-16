let submitButton = document.getElementById("submit");
let _ctx = $("meta[name='_ctx']").attr("content");

let $header = $("meta[name='_csrf_header']").attr("content");
let $token = $("meta[name='_csrf']").attr("content");

$.ajaxSetup({
    beforeSend: function(xhr) {
        xhr.setRequestHeader($header, $token);
    }
});

submitButton.addEventListener("click", function() {
    let code = document.getElementById("editor").innerText;
    console.log(code);
    $.ajax({
        type: "POST",
        url: document.location.pathname,
        contentType: "application/json",
        data: JSON.stringify({
            code: code
        }),
        success: function(data) {
            let result = document.getElementById("result");
            result.innerText = data.out + "\n" + data.error + "\n" + data.codeResult;
        },
        error: function(request, status, error) {

        }
    })
});