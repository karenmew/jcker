package org.jcker.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-15 at 3:40 PM
 *
 * @version 1.0
 */
@Controller
public class UserController {



    @RequestMapping("/admin/login")
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

}
