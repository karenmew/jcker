<!DOCTYPE html>
<html lang="en">
<#include "header_admin.ftl">
<body>
<div class="container">
    <div class="row">
    <#include "nav_admin.ftl">
        <div class="col-md-9">
            <div class="row" style="margin: 100px auto 0;">
                <form id="category_form" action="/admin/category/save" method="post">
                <#if category??>
                    <input type="hidden" name="id" value="${category.id!}">
                    <div class="row">
                        <div class="col-md-4"><input type="text" name="name" value="${category.name!}" placeholder="名称(*)"></div>
                        <div class="col-md-4"><input type="submit" class="btn btn-outline-primary btn-sm" value="Save">
                        </div>
                    </div>
                <#else>
                    <div class="row">
                        <div class="col-md-4"><input type="text" name="name" placeholder="名称(*)"></div>
                        <div class="col-md-4"><input type="submit" class="btn btn-outline-primary btn-sm" value="Save">
                        </div>
                    </div>
                </#if>
                </form>
            </div>
        </div>
    </div>
</div>
<script src="/js/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jcker.js"></script>
<script src="https://cdn.jsdelivr.net/gh/jquery-form/form@4.2.2/dist/jquery.form.min.js"
        integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i"
        crossorigin="anonymous"></script>

<script>
    /*    function commit_category() {
            var $categoryForm = $('#category_form');
            $categoryForm.ajaxSubmit(function () {
                $categoryForm.clearForm();
            });
        }*/
</script>
</body>
</html>