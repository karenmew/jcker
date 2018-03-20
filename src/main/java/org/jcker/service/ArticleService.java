package org.jcker.service;

import org.jcker.domain.Article;
import org.jcker.domain.Category;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;

import java.util.List;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-05 at 10:39 PM
 *
 * @version 1.0
 */
public interface ArticleService {
    List<Article> findRecentArticles();

    Page<Article> findAll(Pageable pageable);

    Article getArticleByTitle(String title);

    Article getArticleByUrlAndIsPage(String url, String isPage);

    Page<Article> findAllByCategory(Pageable pageable, Category category);

    Article findByUrl(String url);

}
