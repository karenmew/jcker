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
    var token = $("meta[name='_csrf']").attr("content");

    window.open('/article/' + id, '_self');
    /*
    $.post("/article/hit/" + id,
        function (data, status) {
            console.log('pv add...');
        });*/
    $.ajax({
        url: "/article/hit/" + id,
        type: "POST",
        data: "",
        contentType: 'application/json;charset=utf-8',
        beforeSend: function (xhr) {
            xhr.setRequestHeader(header, token);
        },
        success: function (resdata) {
        },
        error: function (xhr, ajaxOptions, throwError) {
        }
    });
}

/**
 * 生成博客页面内容导航（停用）
 */
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

/**
 * 生成博客页面内容导航
 * @param $h
 * @param config
 * @constructor
 */
function DirectoryNav($h, config) {
    this.opts = $.extend(true, {
        scrollThreshold: 0.5,    //滚动检测阀值 0.5在浏览器窗口中间部位
        scrollSpeed: 700,        //滚动到指定位置的动画时间
        scrollTopBorder: 500,    //滚动条距离顶部多少的时候显示导航，如果为0，则一直显示
        easing: 'swing',        //不解释
        delayDetection: 200,     //延时检测，避免滚动的时候检测过于频繁
        scrollChange: function () {
        }
    }, config);
    this.$win = $(window);
    this.$h = $h;
    this.$pageNavList = "";
    this.$pageNavListLis = "";
    this.$curTag = "";
    this.$pageNavListLiH = "";
    this.offArr = [];
    this.curIndex = 0;
    this.scrollIng = false;
    this.init();
}

DirectoryNav.prototype = {
    init: function () {
        this.make();
        this.setArr();
        this.bindEvent();
    },
    make: function () {
        //生成导航目录结构,这是根据需求自己生成的。如果你直接在页面中输出一个结构那也挺好不用 搞js
        $("#jcker_sidebar").append('<div class="directory-nav" id="directoryNav"><ul></ul><span class="cur-tag"></span><span class="c-top"></span><span class="c-bottom"></span><span class="line"></span></div>');
        var $hs = this.$h,
            $directoryNav = $("#directoryNav"),
            temp = [],
            index1 = 0,
            index2 = 0;
        $hs.each(function (index) {
            var $this = $(this),
                text = $this.text();
            if (this.tagName.toLowerCase() == 'h2') {
                index1++;
                if (index1 % 2 == 0) index2 = 0;
                temp.push('<li class="l1"><span class="c-dot"></span>' + index1 + '. <a class="l1-text">' + text + '</a></li>');
            } else {
                index2++;
                temp.push('<li class="l2">' + index1 + '.' + index2 + ' <a class="l2-text">' + text + '</a></li>');

            }
        });
        $directoryNav.find("ul").html(temp.join(""));

        //设置变量
        this.$pageNavList = $directoryNav;
        this.$pageNavListLis = this.$pageNavList.find("li");
        this.$curTag = this.$pageNavList.find(".cur-tag");
        this.$pageNavListLiH = this.$pageNavListLis.eq(0).height();

        if (!this.opts.scrollTopBorder) {
            this.$pageNavList.show();
        }
    },
    setArr: function () {
        var This = this;
        this.$h.each(function () {
            var $this = $(this),
                offT = Math.round($this.offset().top);
            This.offArr.push(offT);
        });
    },
    posTag: function (top) {
        this.$curTag.css({top: top + 'px'});
    },
    ifPos: function (st) {
        var offArr = this.offArr;
        //console.log(st);
        var windowHeight = Math.round(this.$win.height() * this.opts.scrollThreshold);
        for (var i = 0; i < offArr.length; i++) {
            if ((offArr[i] - windowHeight) < st) {
                var $curLi = this.$pageNavListLis.eq(i),
                    tagTop = $curLi.position().top;
                $curLi.addClass("cur").siblings("li").removeClass("cur");
                this.curIndex = i;
                this.posTag(tagTop + this.$pageNavListLiH * 0.5);
                //this.curIndex = this.$pageNavListLis.filter(".cur").index();
                this.opts.scrollChange.call(this);
            }
        }
    },
    bindEvent: function () {
        var This = this,
            show = false,
            timer = 0;
        this.$win.on("scroll", function () {
            var $this = $(this);
            clearTimeout(timer);
            timer = setTimeout(function () {
                This.scrollIng = true;
                if ($this.scrollTop() > This.opts.scrollTopBorder) {
                    if (!This.$pageNavListLiH) This.$pageNavListLiH = This.$pageNavListLis.eq(0).height();
                    if (!show) {
                        This.$pageNavList.fadeIn();
                        show = true;
                    }
                    This.ifPos($(this).scrollTop());
                } else {
                    if (show) {
                        This.$pageNavList.fadeOut();
                        show = false;
                    }
                }
            }, This.opts.delayDetection);
        });

        this.$pageNavList.on("click", "li", function () {
            var $this = $(this),
                index = $this.index();
            This.scrollTo(This.offArr[index]);
        })
    },
    scrollTo: function (offset, callback) {
        var This = this;
        $('html,body').animate({
            scrollTop: offset
        }, this.opts.scrollSpeed, this.opts.easing, function () {
            This.scrollIng = false;
            //修正弹两次回调 蛋疼
            callback && this.tagName.toLowerCase() == 'body' && callback();
        });
    }
};

//实例化
var directoryNav = new DirectoryNav($("h2,h3,h4,h5"), {
    scrollTopBorder: 0   //滚动条距离顶部多少的时候显示导航，如果为0，则一直显示
});