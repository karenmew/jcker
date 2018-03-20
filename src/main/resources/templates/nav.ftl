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
                    <#list menuList as menu>
                        <li class="nav-item">
                            <a class="nav-link" href="/view/${menu.url}">${menu.name}</a>
                        </li>
                    </#list>
                <#else>
                </#if>
                </ul>
                <form class="form-inline my-2 my-md-2" action="/search/article" method="post">
                    &nbsp;&nbsp;<input class="form-control" name="category.name" placeholder="探索关键字" aria-label="探索" type="text" maxlength="16">
                </form>
            </div>
        </div>
    </nav>
