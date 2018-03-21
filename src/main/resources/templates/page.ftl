<!DOCTYPE html>
<html lang="en">
<#include "header.ftl">
<body>
<#include "nav.ftl">
<div class="container" style="margin: 100px auto 10px; max-width: 900px;">
    <div class="page page-content">
        <h1>
            <a href="/article/${article.id}">${article.title}</a>
            <small><a href="/category/${article.category.id}">&nbsp;&nbsp;#${article.category.name}</a></small>
        </h1>
        <hr style="border-top-style: dashed;">
    ${article.content}
    </div>
    <hr>
<#include "comment.ftl">
</div>
<#include "footer.ftl">
</body>
</html>