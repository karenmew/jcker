function commit_comment() {

    $('#comment_form').ajaxSubmit(function () {
        $('#comment_form').clearForm();
        location.reload();
    });
}

function menuClick(tag) {
    $(tag).addClass('active');
}

function addPageView(id) {
    var header = $("meta[name='_csrf_header']").attr("content");
    var token =$("meta[name='_csrf']").attr("content");

    window.open('/article/' + id, '_self');
    /*
    $.post("/article/hit/" + id,
        function (data, status) {
            console.log('pv add...');
        });*/
    $.ajax({
        url : "/article/hit/" + id,
        type : "POST",
        data : "",
        contentType : 'application/json;charset=utf-8',
        beforeSend : function(xhr) {
            xhr.setRequestHeader(header, token);
        },
        success : function(resdata) {},
        error : function(xhr, ajaxOptions, throwError) { }
    });
}


function generatePageCategory() {
    //是否显示导航栏
    var showNavBar = true;
//是否展开导航栏
    var expandNavBar = false;
    var pageBody = $("body");

    var h1s = pageBody.find("h1");
    var h2s = pageBody.find("h2");
    var h3s = pageBody.find("h3");
    var h4s = pageBody.find("h4");
    var h5s = pageBody.find("h5");
    var h6s = pageBody.find("h6");

    var headCounts = [h1s.length, h2s.length, h3s.length, h4s.length, h5s.length, h6s.length];
    var vH1Tag = null;
    var vH2Tag = null;
    for (var i = 0; i < headCounts.length; i++) {
        if (headCounts[i] > 0) {
            if (vH1Tag == null) {
                vH1Tag = 'h' + (i + 1);
            } else {
                vH2Tag = 'h' + (i + 1);
            }
        }
    }
    if (vH1Tag == null) {
        return;
    }

    $("#category").prepend('<div class="BlogAnchor">' +
        '<p>' +
        '<b id="AnchorContentToggle" title="收起" style="cursor:pointer;">目录▲</b>' +
        '</p>' +
        '<div class="AnchorContent" id="AnchorContent"> </div>' +
        '</div>');

    var vH1Index = 0;
    var vH2Index = 0;
    pageBody.find("h1,h2,h3,h4,h5,h6").each(function (i, item) {
        var id = '';
        var name = '';
        var tag = $(item).get(0).tagName.toLowerCase();
        var className = '';
        if (tag == vH1Tag) {
            id = name = ++vH1Index;
            name = id;
            vH2Index = 0;
            className = 'item_h1';
        } else if (tag == vH2Tag) {
            id = vH1Index + '_' + ++vH2Index;
            name = vH1Index + '.' + vH2Index;
            className = 'item_h2';
        }
        $(item).attr("id", "wow" + id);
        $(item).addClass("wow_head");
        $("#AnchorContent").css('max-height', ($(window).height() - 180) + 'px');
        $("#AnchorContent").append('<li><a class="nav_item ' + className + ' anchor-link" onclick="return false;" href="#" link="#wow' + id + '">' + name + " · " + $(this).text() + '</a></li>');
    });

    $("#AnchorContentToggle").click(function () {
        var text = $(this).html();
        if (text == "目录▲") {
            $(this).html("目录▼");
            $(this).attr({"title": "展开"});
        } else {
            $(this).html("目录▲");
            $(this).attr({"title": "收起"});
        }
        $("#AnchorContent").toggle();
    });
    $(".anchor-link").click(function () {
        $("html,body").animate({scrollTop: $($(this).attr("link")).offset().top}, 500);
    });

    var headerNavs = $(".BlogAnchor li .nav_item");
    var headerTops = [];
    $(".wow_head").each(function (i, n) {
        headerTops.push($(n).offset().top);
    });
    $(window).scroll(function () {
        var scrollTop = $(window).scrollTop();
        $.each(headerTops, function (i, n) {
            var distance = n - scrollTop;
            if (distance >= 0) {
                $(".BlogAnchor li .nav_item.current").removeClass('current');
                $(headerNavs[i]).addClass('current');
                return false;
            }
        });
    });

    if (!showNavBar) {
        $('.BlogAnchor').hide();
    }
    if (!expandNavBar) {
        $(this).html("目录▼");
        $(this).attr({"title": "展开"});
        $("#AnchorContent").hide();
    }
}