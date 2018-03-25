<!DOCTYPE html>
<html lang="utf-8">
<#include "header.ftl">
<body class="index_body">
<#include "nav.ftl">
<div class="container" style="margin: 100px auto 10px;">
    <h1>卧槽。。。报错了！</h1>
    ${errorMessage!}
    <hr>
    ${stackTrace!}

</div>
<#include "footer.ftl">
</body>
</html>