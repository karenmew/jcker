package org.jcker.service.impl;

import org.jcker.dao.ArticleDao;
import org.jcker.domain.Article;
import org.jcker.domain.Category;
import org.jcker.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.Path;
import java.util.List;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-05 at 10:41 PM
 *
 * @version 1.0
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {

    @Autowired
    ArticleDao articleDao;

    @Override
    public List<Article> findRecentArticles() {
        return null;
    }

    @Override
    public Page<Article> findAll(Pageable pageable) {
        return null;
    }

    @Override
    public Article getArticleByTitle(String title) {
        return null;
    }

    @Override
    public Article getArticleByUrlAndIsPage(String url, String isPage) {
        return null;
    }

    @Override
    public Page<Article> findAllByCategory(Pageable pageable, Category category) {

        Specification<Article> specification = (root, query, cb) -> {

            Path<String> exp1 = root.get("category");

            return cb.and(cb.equal(exp1, category.getId()));
        };

        return articleDao.findAll(specification, pageable);
    }

    @Override
    public Article findByUrl(String url) {
        return null;
    }
}