package org.jcker.dao;

import org.jcker.domain.Category;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-14 at 11:09 PM
 *
 * @version 1.0
 */
public interface CategoryDao extends JpaRepository<Category, Integer> {


}
