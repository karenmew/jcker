<!DOCTYPE html>
<html lang="en">
<#include "header_admin.ftl">
<body>
<div class="container-fluid">
    <div class="row">
    <#include "nav_admin.ftl">
        <div class="col-md-9">
            <a class="btn btn-sm btn-outline-primary" href="/admin/menu/create">新建</a>
            <table id="menu_table" class="display" cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th>Name</th>
                    <th>Link</th>
                    <th>ID</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>Name</th>
                    <th>Link</th>
                    <th>ID</th>
                </tr>
                </tfoot>
            </table>
        </div>
    </div>
</div>
<script src="/js/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jcker.js"></script>
<script>
    $(function () {
        $('#menu_table').DataTable({
            searching: false,
            paging: false,
            serverSide: true,
            processing: true,
            ajax: "/admin/menu/getMenuList",
            columns: [
                {data: "name", bSortable: false},
                {data: "url", bSortable: false},
                {data: "id", bSortable: false}
            ],
            columnDefs: [
                {
                    targets: [2],
                    data: "id",
                    render: function(data, type, full) {
                        return "<a href='/admin/menu/edit/" + data + "'>编辑</a>&nbsp;&nbsp;&nbsp;"
                                + "<a href='/admin/menu/delete/" + data + "'>删除</a>";
                    }
                }
            ]
        });
    });
</script>
</body>
</html>