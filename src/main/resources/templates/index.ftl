<!DOCTYPE html>
<html lang="utf-8">
<#include "header.ftl">
<body class="index_body">
<#include "nav.ftl">
<div class="container" style="margin-top: 100px;">
    <div class="row">
        <div class="col-md-8 main">
        <#list pageObject.content as article>
            <div class="index_article" id="article_${article.id}" onclick="addPageView(${article.id});">
                <h3>
                    <a href="/article/${article.id}">${article.title}</a>
                </h3>
                <p>${article.preview}...</p>
                <p>
                    <span class="" style="font-size: 12px;"><a href="/">Alan Turing</a></span>
                    <span class="" style="font-size: 12px;">${article.createDate!'2016-06-02'}</span>
                    <span class="" style="font-size: 12px;">浏览（${article.viewNum!'459'}）</span>
                    <span class="" style="font-size: 12px;">评论（<a
                            href="/article/${article.id}#comments">${article.comments?size}</a>）</span>
                    <span class="small">#${article.category.name}</span>
                </p>
            </div>
        </#list>
            <ul class="pagination-sm" id="pagination"></ul>
        </div>
        <div class="col-md-4 sub">
                <div class="sub01">博主信息模块</div>
                <div class="sub01">云标签模块</div>
                <div class="fixed">最新文章模块</div>
        </div>
    </div>
</div>
<#include "footer.ftl">

</body>
</html>