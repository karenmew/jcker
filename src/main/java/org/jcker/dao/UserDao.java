package org.jcker.dao;

import org.jcker.domain.User;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-15 at 3:56 PM
 *
 * @version 1.0
 */
public interface UserDao extends JpaRepository<User, Integer>{
    User findByUsername(String username);
}
