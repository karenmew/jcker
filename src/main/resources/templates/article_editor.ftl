<!DOCTYPE html>
<html lang="en">
<#include "admin_header.ftl">
<body>
<div class="container">
    <form action="/admin/article/save" method="post">
        <div>
            <input type="hidden" name="${_csrf.parameterName!}" value="${_csrf.token!}"/>
        <#if article??>
            <input type="hidden" name="id" value="${article.id!}">
            <input type="hidden" name="id" value="${article.isPage!}">
            <label>标题</label>
            <input type="text" name="title" value="${article.title!}">
            <label>标签</label>
            <input type="text" name="tags" id="tags" value="${article.tags!}" data-role="tagsinput">
            <input type="submit" value="Save">
            <textarea name="content" id="mdeditor" cols="30" rows="30"
                      class="form-control">${article.content!}</textarea>
        <#else >
            <label>标题</label>
            <input type="text" name="title" value="" placeholder="标题">
            <label>标签</label>
            <input type="text" name="tags" id="tags" value="" data-role="tagsinput" >
            <input class="btn btn-outline-primary btn-sm" type="submit" value="Save">
            <textarea name="content" id="mdeditor" cols="30" rows="30"
                      class="form-control" placeholder="请开始你的表演"></textarea>
        </#if>
        </div>
    </form>

</div>
<script src="/js/jquery.min.js"></script>
<script src="/mdeditor/js/mdeditor.min.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jcker.js"></script>
<script src="/js/bootstrap-tagsinput.min.js"></script>
<script src="https://cdn.jsdelivr.net/gh/jquery-form/form@4.2.2/dist/jquery.form.min.js"
        integrity="sha384-FzT3vTVGXqf7wRfy8k4BiyzvbNfeYjK+frTVqZeNDFl8woCbF0CYG6g2fMEFFo/i"
        crossorigin="anonymous"></script>


<script>
    var md = new MdEditor('#mdeditor', {
        status: false,
        toolbar: false,
        uploader: 'http://local.dev/Lab/MdEditor/app/upload.php',
        preview: true,
        images: [
            {id: '1.jpg', url: 'http://lorempicsum.com/futurama/200/200/1'},
            {id: '1.jpg', url: 'http://lorempicsum.com/futurama/200/200/2'},
            {id: '1.jpg', url: 'http://lorempicsum.com/futurama/200/200/3'},
            {id: '1.jpg', url: 'http://lorempicsum.com/futurama/200/200/4'}
        ]
    });

    var data = [ { "value": 1 , "text": "Amsterdam"   , "continent": "Europe"    },
        { "value": 2 , "text": "London"      , "continent": "Europe"    },
        { "value": 3 , "text": "Paris"       , "continent": "Europe"    },
        { "value": 4 , "text": "Washington"  , "continent": "America"   },
        { "value": 5 , "text": "Mexico City" , "continent": "America"   },
        { "value": 6 , "text": "Buenos Aires", "continent": "America"   },
        { "value": 7 , "text": "Sydney"      , "continent": "Australia" },
        { "value": 8 , "text": "Wellington"  , "continent": "Australia" },
        { "value": 9 , "text": "Canberra"    , "continent": "Australia" },
        { "value": 10, "text": "Beijing"     , "continent": "Asia"      },
        { "value": 11, "text": "New Delhi"   , "continent": "Asia"      },
        { "value": 12, "text": "Kathmandu"   , "continent": "Asia"      },
        { "value": 13, "text": "Cairo"       , "continent": "Africa"    },
        { "value": 14, "text": "Cape Town"   , "continent": "Africa"    },
        { "value": 15, "text": "Kinshasa"    , "continent": "Africa"    }
    ]
    $(function () {
        var cities = new Bloodhound({
            datumTokenizer: Bloodhound.tokenizers.obj.whitespace('text'),
            queryTokenizer: Bloodhound.tokenizers.whitespace,
            prefetch: data
        });
        cities.initialize();
        var elt = $("#tags");
        elt.tagsinput({
            tagClass: function (item) {
                switch (item.continent) {
                    case 'Europe'   :
                        return 'label label-primary';
                    case 'America'  :
                        return 'label label-danger label-important';
                    case 'Australia':
                        return 'label label-success';
                    case 'Africa'   :
                        return 'label label-default';
                    case 'Asia'     :
                        return 'label label-warning';
                }
            },
            itemValue: 'value',
            itemText: 'text',
            typeaheadjs: {
                name: 'cities',
                displayKey: 'text',
                source: cities.ttAdapter()
            }
        });
        elt.tagsinput('add', {"value": 1, "text": "Amsterdam", "continent": "Europe"});
        elt.tagsinput('add', {"value": 4, "text": "Washington", "continent": "America"});
        elt.tagsinput('add', {"value": 7, "text": "Sydney", "continent": "Australia"});
        elt.tagsinput('add', {"value": 10, "text": "Beijing", "continent": "Asia"});
        elt.tagsinput('add', {"value": 13, "text": "Cairo", "continent": "Africa"});
    });
</script>
</body>
</html>
