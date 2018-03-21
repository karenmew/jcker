package org.jcker.service.impl;

import org.apache.log4j.Logger;
import org.jcker.dao.ArticleDao;
import org.jcker.domain.Article;
import org.jcker.domain.Category;
import org.jcker.service.ArticleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.core.ValueOperations;
import org.springframework.stereotype.Service;

import javax.persistence.criteria.Path;
import java.util.List;
import java.util.concurrent.TimeUnit;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-05 at 10:41 PM
 *
 * @version 1.0
 */
@Service("articleService")
public class ArticleServiceImpl implements ArticleService {
    Logger log = Logger.getLogger(getClass());

    @Autowired
    ArticleDao articleDao;
    @Autowired
    private RedisTemplate redisTemplate;

    public Article save(Article article) {
        ValueOperations operations = redisTemplate.opsForValue();
        article = articleDao.save(article);
        operations.set("article_" + article.getId(), article, 10L, TimeUnit.SECONDS);
        return article;
    }

    @Override
    public Article getArticleById(int id) {
        ValueOperations operations = redisTemplate.opsForValue();
        if (redisTemplate.hasKey("article_" + id)) {
            log.info("get info from redis");
            return (Article) operations.get("article_" + id);
        }
        return articleDao.findOne(id);
    }

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