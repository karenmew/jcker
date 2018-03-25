<!DOCTYPE html>
<html lang="en">
<#include "header.ftl">
<body onload="articleHit(${article.id})">
<#include "nav.ftl">
<div class="container" style="margin: 100px auto 10px;">
    <div class="row">
        <div class="col-md-9 page-content">
            <div style="text-align: center">
                <h3>
                ${article.title}
                </h3>
                <a class="small" href="/tag/${article.tags}">&nbsp;&nbsp;#${article.tags}</a>
            </div>
            <hr style="border-top-style: dashed;">
        ${article.content}

            <hr>

            <div class="" id="container">
            </div>
        </div>

        <div class="col-md-3 d-none d-md-block">
            <div id="jcker_sidebar"></div>
        </div>

        <link rel="stylesheet" href="https://unpkg.com/gitalk/dist/gitalk.css">
        <script src="https://unpkg.com/gitalk/dist/gitalk.min.js"></script>
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
<#include "footer.ftl">

    <script>
        hljs.initHighlightingOnLoad();
    </script>
</body>
</html>