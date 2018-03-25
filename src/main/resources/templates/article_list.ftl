<!DOCTYPE html>
<html lang="en">
<#include "admin_header.ftl">
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-12">
            <a class="btn btn-sm btn-outline-primary" href="/admin/article/create">新建</a>
            <table id="article_table" class="display" cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th>title</th>
                    <th>tags</th>
                    <th>isPage</th>
                    <th>ID</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>title</th>
                    <th>tags</th>
                    <th>isPage</th>
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
        $('#article_table').DataTable({
            searching: false,
            paging: false,
            serverSide: true,
            processing: true,
            ajax: "/admin/article/getList",
            columns:
                    [
                        {data: "title", bSortable: false},
                        {data: "tags", bSortable: false},
                        {data: "isPage", bSortable: false},
                        {data: "id", bSortable: false, hidden: true}
                    ],
            columnDefs:
                    [
                        {
                            targets: [3],
                            data: "id",
                            render: function (data, type, full) {
                                return "<a href='/admin/article/edit/" + data + "'>编辑</a>&nbsp;&nbsp;&nbsp;"
                                        + "<a href='/article/" + data + "' target='_blank'>预览</a>&nbsp;&nbsp;&nbsp;"
                                        + "<a href='/admin/article/delete/" + data + "'>删除</a>";
                            }
                        },
                        {
                            targets: [2],
                            data: "isPage",
                            render: function (data, type, full) {
                                var a = full.isPage == "Y" ? "设为博客" : "设为菜单";
                                return "<a href='/admin/article/isPage/" + full.id + "'> " + a + "</a>";
                            }
                        }
                    ]
        });
    });
</script>
</body>
</html>
