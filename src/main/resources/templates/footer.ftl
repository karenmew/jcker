<footer id="footer" class="footer bg-white jcker-footer-font">
    <hr>
    <div class="container">
        <div class="row">
            <div class="col-md-4  d-none d-md-block">
            </div>
            <div class="col-md-4  d-none d-md-block">
                <p>Powered by <a href="https://www.github.com/3-8">jcker</a>&copy; 2018 <a href="/">jcker.org</a></p>
            </div>
            <div class="col-md-4  d-none d-md-block">
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

        //主页右侧导航
        var sideBar = $('.fixed');
            var t = sideBar.offset().top;
            var mh = $('.main').height();
            var fh = sideBar.height();

            $(window).scroll(function(e){
                var s = $(document).scrollTop();
                var fw = sideBar.width() + 20;
                if(s > t - 10){
                    sideBar.css('position','fixed');
                    sideBar.css('width', fw+'px');
                    if(s + fh > mh){
                        sideBar.css('top',mh-s-fh+'px');
                    }
                }else{
                    sideBar.css('position','');
                }
            });



        //generatePageCategory();

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
        //分页
        $('#pagination').twbsPagination({
            startPage: ${pageObject.number + 1},
            totalPages: ${pageObject.totalPages},
            visiblePages: 10,
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

    });


</script>
