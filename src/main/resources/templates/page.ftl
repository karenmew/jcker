<!DOCTYPE html>
<html lang="en">
<#include "header.ftl">
<body>
<#include "nav.ftl">
<div class="container" style="margin: 100px auto 10px;">
    <div class="row">
        <div class="col-md-9 page-content">
            <h1>
                <a href="/article/${article.id}">${article.title}</a>
                <small><a href="/category/${article.category.id}">&nbsp;&nbsp;#${article.category.name}</a></small>
            </h1>
            <hr style="border-top-style: dashed;">
        ${article.content}
        </div>
        <div class="col-md-3 d-none d-md-block"">
            <div id="jcker_sidebar"></div>
        </div>
        <hr>
        <div class="row" id="container" href="#comments"></div>

        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.css">
        <script src="https://cdn.jsdelivr.net/npm/gitalk@1/dist/gitalk.min.js"></script>
        <script>
            const gitalk = new Gitalk({
                clientID: 'ba9cd17e63036cd3c98b',
                clientSecret: 'bd34e1ebe2e8bc26cef1c91be2d529e74bfb529e',
                repo: 'jcker',
                owner: '3-8',
                admin: ['3-8'],
                id: location.pathname,
                distractionFreeMode: false
            });

            gitalk.render('container');
        </script>
    </div>
</div>
<#include "footer.ftl">
</body>
</html>