<footer id="footer" class="footer bg-white jcker-footer-font">
    <hr>
    <div class="social">
        <a class="social rss" target="blank" href="/feed">RSS</a>&nbsp;&nbsp;&nbsp;
        <a class="social zhihu" target="blank" href="https://www.zhihu.com/people/jcker.org">知乎</a>&nbsp;&nbsp;
        <a class="social github" target="blank" href="https://github.com/jckerorg">Github</a>&nbsp;&nbsp;
        <a class="social twitter" target="blank" href="https://twitter.com/helloalanturing">Twitter</a>&nbsp;&nbsp;
        <a class="social csdn" target="blank" href="http://blog.csdn.net/u012137018">CSDN</a>
    </div>
    <hr>
    <div class="container">
        <div class="row" style="bottom: 0;">
            <div class="col-md-4 d-none d-md-block">
                <div><a href="/" target="_blank"><img class="img-fluid" style="width: 150px;height: 35px;"
                                                      src="/images/logo.png"></a></div>
                <div>
                    <p>内心强大到混蛋,让优秀成为一种习惯</p>
                </div>
                <p style="margin-bottom: 0;">Powered by <a href="https://www.github.com/jckerorg">jcker</a></p>
                <p style="margin-bottom: 0;">&copy; 2018 <a href="/">jcker.org</a>
                </p>
            </div>
            <div class="col-md-4  d-none d-md-block">
            <#if recentArticles??>
                <label>最新博客</label>
                <ul id="recent_articles" class="list-group list-inline" style="list-style: none;">
                    <#list recentArticles as article>
                        <li id="article_${article.id}"><a href="/article/${article.id}">${article.title}</a></li>
                    </#list>
                </ul>
            <#else>
                <label>联系方式</label>
                <ul id="recent_articles" class="list-group list-inline" style="list-style: none;">
                    <li>QQ：570577029</li>
                    <li>E-mail：helloalanturing@outlook.com</li>
                    <li>微信：helloalanturing</li>
                </ul>
            </#if>
            </div>
            <div class="col-md-4 d-none d-md-block">
                欢迎关注微信公众号：
                <img class="img-fluid" src="/images/wechat_qrcode.jpg" style="width: 155px;height: 155px;">
            </div>
        </div>
    </div>
</footer>

<script src="/js/jquery.min.js"></script>
<script src="/highlight/js/highlight.pack.js"></script>
<script src="/js/tether.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
        crossorigin="anonymous"></script>
<script src="/js/datatables.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/jquery-form/form@4.2.2/dist/jquery.form.min.js"
        integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i"
        crossorigin="anonymous"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/headroom.min.js"></script>
<script src="/js/jquery.twbsPagination.min.js"></script>
<script src="/js/jcker.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-tagsinput/1.3.6/jquery.tagsinput.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.min.js"></script>
<script>
    hljs.initHighlightingOnLoad();

    $(function () {

        generatePageCategory();

        var header = $("meta[name='_csrf_header']").attr("content");
        var token =$("meta[name='_csrf']").attr("content");

        var header = document.getElementById("jcker_header");
        var headroom = new Headroom(header, {
            "tolerance": 5,
            "offset": 205,
            "classes": {
                "initial": "animated",
                "pinned": "flipInX",
                "unpinned": "flipOutX"
            }
        });
        headroom.init();

    <#if pageObject??>
        $('#pagination').twbsPagination({
            startPage: ${pageObject.number + 1},
            totalPages: ${pageObject.totalPages},
            visiblePages: 3,
            initiateStartPageClick: false,
            onPageClick: function (event, page) {
                window.location.href = "/page/" + page;
            }

        });
    <#else >
        $('#menu_table').DataTable({
            ajax: "/admin/menuList",
            serverSide: true,
            processing: true,
            columns: [
                {data: "id"},
                {data: "name"},
                {data: "link"}
            ]
        });
    </#if>

        var commentForm = $("#comment_form");

        commentForm.validate({
            rules: {
                author: {
                    required: true,
                    minlength: 2
                },
                email: {
                    required: true,
                    email: true
                },
                link: {
                    required: false,
                    url: true
                },
                content: {
                    required: true,
                    minlength: 5,
                    maxlength: 200
                }
            },
            messages: {
                author: {
                    required: "请输入昵称",
                    minlength: "至少2个字"
                },
                email: "请输入一个合法的邮箱地址",
                link: "请输入一个合法的链接",
                content: {
                    required: "请输入留言内容",
                    minlength: "留言至少5个字长度",
                    maxlength: "留言内容不能超过200字"
                }
            },
            errorElement: "em",
            errorPlacement: function (error, element) {
                error.addClass("help-block");

                if (element.prop("type") === "checkbox") {
                    error.insertAfter(element.parent("label"));
                } else {
                    error.insertAfter(element);
                }
            },
            highlight: function (element, errorClass, validClass) {
                $(element).parents(".col-sm-5").addClass("has-error").removeClass("has-success");
            },
            unhighlight: function (element, errorClass, validClass) {
                $(element).parents(".col-sm-5").addClass("has-success").removeClass("has-error");
            },
            submitHandler: function (commentForm) {
                commentForm.submit();
/*                $.ajax({
                    url : "/add_comment/",
                    type : "POST",
                    data : commentForm.serialize(),
                    contentType : 'application/json;charset=utf-8',
                    beforeSend : function(xhr) {
                        xhr.setRequestHeader(header, token);
                    },
                    success : function(resdata) {},
                    error : function(xhr, ajaxOptions, throwError) { }
                });*/
            }
        });


    });


</script>
