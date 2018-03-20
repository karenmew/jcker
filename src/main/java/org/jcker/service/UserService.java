package org.jcker.service;

import org.jcker.domain.User;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-15 at 3:55 PM
 *
 * @version 1.0
 */
public interface UserService {

    User save(User user);

    User findByUsername(String username);

}
