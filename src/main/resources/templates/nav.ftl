    <nav class="navbar navbar-expand-md bg-white fixed-top rounded jcker-nav" id="jcker_header">
        <div class="container">
            <a class="navbar-brand" href="/"><img class="fluid" src="/images/logo.png"
                                                  style="width:100px;height:22px;"></a>
            <button class="navbar-toggler navbar-light" type="button" data-toggle="collapse" data-target="#navbarsExample10"
                    aria-controls="navbarsExample10" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse justify-content-md-end" id="navbarsExample10">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="/">首页</a>
                    </li>
                <#if menuList??>
                    <#list menuList as article>
                        <li class="nav-item">
                            <a class="nav-link" href="/article/${article.id}">${article.title}</a>
                        </li>
                    </#list>
                </#if>
                    <li class="nav-item">
                        <a class="nav-link" href="/admin/login">登录</a>
                    </li>
                </ul>
                <form class="form-inline my-2 my-md-2" action="/search/article" method="post">
                    &nbsp;&nbsp;<input class="form-control" name="tag" placeholder="Search" aria-label="探索" type="text" maxlength="16">
                </form>
            </div>
        </div>
    </nav>
