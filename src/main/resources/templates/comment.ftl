    <div class="comment-pannel " style="margin: 0 auto; max-width: 900px;">
        <form id="comment_form" action="/add_comment" method="post">
            <input type="hidden" name="article" value="${article.id!}">
            <div class="row">
                <div class="col-md-4"><input type="text" name="author" value="" placeholder="姓名(*)" required></div>
                <div class="col-md-4"><input type="email" name="email" value="" placeholder="邮箱(*)" required></div>
                <div class="col-md-4"><input type="url" name="site" value="" placeholder="网址(http://)" required></div>
                <input type="hidden" name="${_csrf.parameterName!}" value="${_csrf.token!}"/>
            </div>
            <div class="row" style="margin: 0 auto; max-width: 900px;">
                <div>
                    <textarea name="content" cols="100" placeholder="给大佬留言(*)" minlength="5" maxlength="200"
                              required></textarea>
                    <button type="button" class="btn btn-outline-primary btn-sm" style="float: right;" onclick="commit_comment();">提交</button>
                </div>
            </div>
        </form>
        <div id="comments" href="#comments">
        <#list article.comments as comment>
            <#if comment.isLock == 'N'>
                <div class="comment" id="comment_${comment.id}">
                    <div>
                        <img class="figure-img" src="/images/ico_07_1.jpg">
                        <a class="comment-author" href="${comment.site!'#'}">${comment.author}</a>
                        <small class="comment-date">${comment.createDate}</small>
                    </div>
                    <div><p class="comment-content">${comment.content}</p></div>
                </div>
                <hr style="border-top-style: dashed">
            </#if>
        </#list>
        </div>
    </div>


