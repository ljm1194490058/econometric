$(function () {

    var $username = $('#user');

    $username.change(function () {
        var username = $username.val().trim();

        if (username.length) {

            //    将用户名发送给服务器进行预校验
            $.getJSON('/app/checkuser/', {'username': username}, function (data) {

                console.log(data);

                var $username_info = $("#username_info");

                if (data['status'] === 200) {
                    $username_info.html("用户名可用").css("color", 'green');
                } else if (data['status'] === 901) {
                    $username_info.html("用户已存在").css('color', 'red');
                }

            })

        }

    })


})


function check() {
    var $username = $('#user');

    var username = $username.val().trim();

    if (!username) {
        return false
    }

    var info_color = $("#username_info").css('color');

    console.log(info_color);

    if (info_color == 'rgb(255, 0, 0)') {
        return false
    }

    // var $password_input = $("#password_input");
    //
    // var password = $password_input.val().trim();
    //
    // $password_input.val(md5(password));

    return true
}
