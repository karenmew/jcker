<!DOCTYPE html>
<html lang="en">
<#include "header_admin.ftl">
<body>
<div class="container">
    <div class="row">
    <#include "nav_admin.ftl">
        <div class="col-md-9">
            <div class="row" style="margin: 100px auto 0;">
                <#if menu??>
                <form id="menu_form" action="/admin/menu/save" method="post">
                    <input type="hidden" name="id" value="${menu.id}">
                    <div class="row">
                        <div class="col-md-4"><input type="text" name="name" value="${menu.name!}" placeholder="名称(*)"></div>
                        <div class="col-md-4"><input type="text" name="url" value="${menu.url!}" placeholder="链接(URL)"></div>
                        <input type="hidden" name="${_csrf.parameterName!}" value="${_csrf.token!}"/>

                        <div class="col-md-4"><input type="submit" class="btn btn-outline-primary btn-sm" value="Save"></div>
                    </div>
                </form>
                <#else>
                <form id="menu_form" action="/admin/menu/save" method="post">
                    <div class="row">
                        <div class="col-md-4"><input type="text" name="name" value="" placeholder="名称(*)"></div>
                        <div class="col-md-4"><input type="text" name="url" value="" placeholder="链接(URL)"></div>
                        <input type="hidden" name="${_csrf.parameterName!}" value="${_csrf.token!}"/>

                        <div class="col-md-4"><input type="submit" class="btn btn-outline-primary btn-sm" value="Save"></div>
                    </div>
                </form>
                </#if>
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jcker.js"></script>
<script src="https://cdn.jsdelivr.net/gh/jquery-form/form@4.2.2/dist/jquery.form.min.js" integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i" crossorigin="anonymous"></script>

<script>
/*    function commit_menu() {
        var $menuForm = $('#menu_form');
        $menuForm.ajaxSubmit(function () {
            $menuForm.clearForm();
        });
    }*/
</script>
</body>
</html>