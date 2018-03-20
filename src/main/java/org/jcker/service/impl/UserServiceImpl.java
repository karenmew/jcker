package org.jcker.service.impl;

import org.jcker.dao.UserDao;
import org.jcker.domain.User;
import org.jcker.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-15 at 3:55 PM
 *
 * @version 1.0
 */
@Service("userService")
public class UserServiceImpl implements UserService {
    @Autowired
    UserDao userDao;


    @Override
    public User save(User user) {
        return userDao.save(user);
    }

    @Override
    public User findByUsername(String username) {
        return userDao.findByUsername(username);
    }

}
