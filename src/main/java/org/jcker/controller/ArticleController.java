package org.jcker.controller;

import org.apache.log4j.Logger;
import org.jcker.dao.ArticleDao;
import org.jcker.dao.CategoryDao;
import org.jcker.dao.CommentDao;
import org.jcker.dao.MenuDao;
import org.jcker.domain.Article;
import org.jcker.domain.Category;
import org.jcker.domain.DataTable;
import org.jcker.service.ArticleService;
import org.jcker.utils.JckerUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2017-12-19 at 1:47 PM
 *
 * @version 1.0
 */
@Controller
public class ArticleController {
    Logger log = Logger.getLogger(ArticleController.class);

    @Autowired
    ArticleDao articleDao;
    @Autowired
    MenuDao menuDao;
    @Autowired
    CommentDao commentDao;
    @Autowired
    ArticleService articleService;
    @Autowired
    CategoryDao categoryDao;

    @RequestMapping("/admin/article/list")
    public Object list() {

        return "article_list";
    }

    @RequestMapping("/admin/article/getList")
    @ResponseBody
    public Object getArticleList(DataTable dataTable) {

        Sort sort = new Sort(Sort.Direction.DESC, "id");
        Pageable pageable = new PageRequest(dataTable.getDraw() - 1, 10, sort);
        Page<Article> articlePage = articleDao.findAll(pageable);


        List<Article> data = articlePage.getContent();

        int recordsTotal = data.size();
        int recordsFiltered = data.size();

        dataTable.setRecordsTotal(recordsTotal);
        dataTable.setRecordsFiltered(recordsFiltered);
        dataTable.setData(data);

        Map<String, Object> m = new HashMap<>();
        m.put("data", data);

        return m;
    }

    @RequestMapping("/admin/article/save")
    public String save(Article article, Model model) {

        System.out.println("article = " + article);
        if (article.getId() <= 0) {
            article.setCreateDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
            articleDao.save(article);
        } else {
            Article oldArticle = articleDao.findOne(article.getId());
            oldArticle.setTitle(article.getTitle());
            oldArticle.setCategory(article.getCategory());
            oldArticle.setTags(article.getTags());
            oldArticle.setContent(article.getContent());
            articleDao.save(oldArticle);
        }
        model.addAttribute("menuList", menuDao.findAll());
        model.addAttribute("articleList", articleDao.findAll());
        model.addAttribute("recent_articles", articleDao.findAll());
        return "article_list";
    }

    @RequestMapping("/admin/article/edit/{id}")
    public String edit(@PathVariable int id, Model model) {
        //load categories
        List<Category> categories = categoryDao.findAll();
        model.addAttribute("categories", categories);

        Article article = articleDao.findOne(id);
        model.addAttribute("article", article);
        return "article_editor";
    }

    @RequestMapping("/admin/article/delete/{id}")
    public String delete(@PathVariable int id) {
        articleDao.delete(id);
        return "article_list";
    }


    @RequestMapping("/admin/article/create")
    public String create(Model model) {

        List<Category> categories = categoryDao.findAll();
        model.addAttribute("categories", categories);

        return "article_editor";
    }


    @RequestMapping("/article/hit/{id}")
    public void articleHit(@PathVariable int id) {
        Article article = articleDao.findOne(id);
        article.setViewNum(article.getViewNum() + 1);
        articleDao.save(article);
    }

    /**
     * 查询分类下的文章
     *
     * @param id 分类id
     * @return
     */
    @RequestMapping({"/category/{id}"})
    public String category(@PathVariable int id, Model model) {
        System.out.println("category = " + id);
        Sort sort = new Sort(Sort.Direction.DESC, "id");
        Pageable pageable = new PageRequest(0, 5, sort);
        model.addAttribute("menuList", menuDao.findAll());
        Page<Article> articlePage = articleService.findAllByCategory(pageable, new Category(id));
        for (Article article :
                articlePage.getContent()) {
            article.setPreview(intro(article.getContent(), 100));
        }
        model.addAttribute("pageObject", articlePage);
        return "archive";
    }

    /**
     * 查询分类下的文章
     *
     * @param article page
     * @return
     */
    @RequestMapping({"/search/article"})
    public String search(Article article, Model model) {
        Sort sort = new Sort(Sort.Direction.DESC, "id");
        Pageable pageable = new PageRequest(0, 5, sort);
        model.addAttribute("menuList", menuDao.findAll());
        Page<Article> articlePage = articleService.findAllByCategory(pageable, article.getCategory());
        for (Article article1 :
                articlePage.getContent()) {
            article1.setPreview(intro(article1.getContent(), 100));
        }
        model.addAttribute("pageObject", articlePage);
        return "archive";
    }

    /**
     * 截取文章摘要
     *
     * @param value 文章内容
     * @param len   要截取文字的个数
     * @return
     */
    static String intro(String value, int len) {
        int pos = value.indexOf("<!--more-->");
        if (pos != -1) {
            String html = value.substring(0, pos);
            return JckerUtils.mdToText(html);
        } else {
            String text = JckerUtils.mdToText(value);
            if (text.length() > len) {
                return text.substring(0, len);
            }
            return text;
        }
    }
}
