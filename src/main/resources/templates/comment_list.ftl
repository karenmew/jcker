<!DOCTYPE html>
<html lang="en">
<#include "header_admin.ftl">
<body>
<div class="container-fluid">
    <div class="row">
    <#include "nav_admin.ftl">
        <div class="col-md-9">
            <table id="article_table" class="display" cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th>author</th>
                    <th>content</th>
                    <th>email</th>
                    <th>site</th>
                    <th>createDate</th>
                    <th>isLock</th>
                    <th>ID</th>
                </tr>
                </thead>
                <tfoot>
                <tr>
                    <th>author</th>
                    <th>content</th>
                    <th>email</th>
                    <th>site</th>
                    <th>createDate</th>
                    <th>isLock</th>
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
        $('#article_table').DataTable({
            searching: false,
            paging: false,
            serverSide: true,
            processing: true,
            ajax: "/admin/comment/getList",
            columns: [
                {data: "author", bSortable: false},
                {data: "content", bSortable: false},
                {data: "email", bSortable: false},
                {data: "site", bSortable: false},
                {data: "createDate", bSortable: false},
                {data: "isLock", bSortable: false},
                {data: "id", bSortable: false}
            ],
            columnDefs: [
                {
                    targets: [5],
                    data: "isLock",
                    render: function (data, type, full) {
                        var tt = data == 'Y'?'展示':'屏蔽';
                        return "<a class='btn btn-sm btn-outline-primary' href='/admin/comment/lock/" + full.id + "'>"+ tt +"</a>";
                    }
                },
                {
                    targets: [6],
                    data: "id",
                    render: function (data, type, full) {
                        return "<a class='btn btn-sm btn-outline-primary' href='/admin/comment/delete/" + data + "'>浏览</a>" +
                                "<a class='btn btn-sm btn-outline-primary' href='/admin/comment/delete/" + data + "'>删除</a>";
                    }
                }
            ]
        });
    });
</script>
</body>
</html>
