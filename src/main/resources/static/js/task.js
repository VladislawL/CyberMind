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
    let result = document.getElementById("result");
    document.getElementById('submit').disabled = true;
    result.innerText = "";

    let waiting = document.createElement("p");
    waiting.className = "success";
    waiting.innerText = "Wait, we're running your code!"
    result.appendChild(waiting);

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
            result.innerText = "";
            document.getElementById('submit').disabled = false;
            if(data.codeResult === 0){
                let success = document.createElement("p");
                success.className = "success";
                success.innerText = "Successful!"
                result.appendChild(success);
            }else{
                let out = document.createElement("p");
                out.className = "out";
                out.innerText = data.out;
                result.appendChild(out);

                let error = document.createElement("p");
                error.className = "error";
                error.innerText = data.error;
                result.appendChild(error)
            }

        },
        error: function(request, status, error) {

        }
    })
});