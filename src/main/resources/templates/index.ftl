<!DOCTYPE html>
<html lang="utf-8">
<#include "header.ftl">
<body class="index_body">
<#include "nav.ftl">
<div class="container" style="margin-top: 100px;">
    <div class="row">
        <div class="col-md-8 main">
        <#list pageObject.content as article>
            <div class="index_article" id="article_${article.id}" onclick="window.open('/article/' + ${article.id}, '_self');">
                <h4>
                    <a href="/article/${article.id}">${article.title}</a>
                </h4>
                <p style="color: #666;">${article.preview}...</p>
                <p>
                    <div class="row dict">
                        <div class="col-md-4 col-sm-6" style="margin: 0;">
                        <p class="small" style="font-size: small; margin: 1rem auto 0;">${article.createDate!'2016-06-02'} 浏览（${article.viewNum!'459'}）</p>
                        </div>
                        <div class="col-md-8 col-sm-6">
                        <p class="pcolor">
                        <#list article.tags?split(",") as tag>
                            <a class="small pcolor" style="margin-bottom: 0;" href="/tag/${tag}">${tag}</a>
                        </#list>
                        </p>
                        </div>
                    </div>
                </p>
            </div>
        </#list>
            <ul class="pagination-sm float-sm-right" id="pagination"></ul>
        </div>
        <div class="col-md-4 d-none d-md-block">
            <div class="sub01">
                <h3>百年孤独</h3>
                <img class="img-fluid" src="/images/wechat_qrcode.jpg" style="width: 155px;height: 155px;">
                <p>内心强大到混蛋,让优秀成为一种习惯</p>
                <div class="social">
                    <a class="social rss" target="blank" href="/feed">RSS</a>&nbsp;&nbsp;&nbsp;
                    <a class="social zhihu" target="blank" href="https://www.zhihu.com/people/jcker.org">知乎</a>&nbsp;&nbsp;
                    <a class="social github" target="blank" href="https://github.com/3-8">Github</a>&nbsp;&nbsp;
                    <a class="social twitter" target="blank" href="https://twitter.com/helloalanturing">Twitter</a>&nbsp;&nbsp;
                    <a class="social csdn" target="blank" href="http://blog.csdn.net/u012137018">CSDN</a>
                </div>
            </div>
            <div class="fixed">
                <label>最新博客</label>
            <#if recentArticles??>
                <ul id="recent_articles" class="list-group list-unstyled" >
                    <#list recentArticles as article>
                        <li id="article_${article.id}"><a href="/article/${article.id}">${article.title}</a></li>
                    </#list>
                </ul>
            </div>
            </#if>
        </div>
    </div>
</div>
<#include "footer.ftl">

<script>
    //分页
    $('#pagination').twbsPagination({
        startPage: ${pageObject.number + 1},
        totalPages: ${pageObject.totalPages},
        visiblePages: 10,
        initiateStartPageClick: false,
        first: "<<",
        prev: "<",
        next: ">",
        last: ">>",
        onPageClick: function (event, page) {
            window.location.href = "/page/" + page;
        }
    });
</script>
</body>
</html>