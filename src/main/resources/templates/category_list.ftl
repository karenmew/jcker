<!DOCTYPE html>
<html lang="en">
<#include "header_admin.ftl">
<body>
<div class="container-fluid">
    <div class="row">
    <#include "nav_admin.ftl">
        <div class="col-md-9">
            <a class="btn btn-sm btn-outline-primary" href="/admin/category/create">新建</a>
            <table id="category_table" class="display" cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th>amount</th>
                    <th>name</th>
                    <th>ID</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>amount</th>
                    <th>name</th>
                    <th>ID</th>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
<script src="/js/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>

<script src="/js/bootstrap.min.js"></script>
<script src="/js/jcker.js"></script>
<script>
    $(function () {
        $('#category_table').DataTable({
            searching: false,
            paging: true,
            serverSide: true,
            processing: true,
            ajax: "/admin/category/getList",
            columns:
                    [
                        {data: "name", bSortable: false},
                        {data: "id", bSortable: false}
                    ],
            columnDefs:
                    [
                        {
                            targets: [1],
                            data: "id",
                            render: function (data, type, full) {
                                return "<a href='/admin/category/edit/" + data + "'>编辑</a>&nbsp;&nbsp;&nbsp;"
                                        + "<a href='/category/" + data + "' target='_blank'>预览</a>&nbsp;&nbsp;&nbsp;"
                                        + "<a href='/admin/category/delete/" + data + "'>删除</a>";
                            }
                        }
                    ]
        });
    });
</script>
</body>
</html>
