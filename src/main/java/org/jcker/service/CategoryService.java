package org.jcker.service;

import org.jcker.domain.Category;

import java.util.List;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-22 at 10:58 AM
 *
 * @version 1.0
 */
public interface CategoryService {
    List<Category> findAll();

    Category findOne(Integer id);

    Category save(Category category);

    void delete(Integer id);
}
