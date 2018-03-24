package org.jcker.controller;

import org.apache.commons.lang3.StringUtils;
import org.jcker.dao.*;
import org.jcker.domain.Article;
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

import static org.jcker.controller.ArticleController.intro;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-05 at 10:43 PM
 *
 * @version 1.0
 */
@Controller
public class IndexController {
    private static final int PAGE_SIZE = 10;
    @Autowired
    private ArticleDao articleDao;
    @Autowired
    private ArticleService articleService;
    @Autowired
    private MenuDao menuDao;

    @RequestMapping("/")
    public String index(Model model) {
        Sort sort = new Sort(Sort.Direction.DESC, "id");
        Pageable pageable = new PageRequest(0, PAGE_SIZE, sort);
        model.addAttribute("menuList", menuDao.findAll());
        Page<Article> articlePage = articleDao.findAll(pageable);
        for (Article article :
                articlePage.getContent()) {
            article.setPreview(intro(article.getContent(), 100));
        }
        model.addAttribute("pageObject", articlePage);
        model.addAttribute("recentArticles", articleDao.findRecentArticles());

        return "index";
    }

    @RequestMapping("/page/{page}")
    public String page(Model model, @PathVariable int page) {
        Sort sort = new Sort(Sort.Direction.DESC, "id");
        Pageable pageable = new PageRequest(page - 1, PAGE_SIZE, sort);
        model.addAttribute("menuList", menuDao.findAll());
        Page<Article> articlePage = articleDao.findAll(pageable);
        for (Article article :
                articlePage.getContent()) {
            article.setPreview(intro(article.getContent(), 100));
        }
        model.addAttribute("pageObject", articlePage);
        model.addAttribute("recentArticles", articleDao.findRecentArticles());

        return "index";
    }

    @RequestMapping("/article/{id}")
    public String viewArticle(@PathVariable int id, Model model) throws Exception {
        Article article = articleService.getArticleById(id);
        article.setContent(JckerUtils.mdToHtml(article.getContent()));
        model.addAttribute("article", article);

        model.addAttribute("recentArticles", articleDao.findRecentArticles());
        model.addAttribute("menuList", menuDao.findAll());
        return "page";
    }

    @RequestMapping("/view/{url}")
    public String viewPage(Model model, @PathVariable String url) throws Exception {
        Article article = articleDao.findByUrl(url);
        System.out.println("article = " + article);
        if (article != null) {
            return viewArticle(article.getId(), model);
        } else {
            return "error";
        }
    }

}
