package org.jcker.controller;

import org.jcker.dao.ArticleDao;
import org.jcker.dao.MenuDao;
import org.jcker.domain.Article;
import org.jcker.domain.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-05 at 10:33 PM
 *
 * @version 1.0
 */
@Controller
public class MenuController {
    @Autowired
    MenuDao menuDao;
    @Autowired
    ArticleDao articleDao;

    @RequestMapping("/admin/menu/list")
    public String menuList(Model model) {
        model.addAttribute("menuList", menuDao.findAll());
        return "menu_list";
    }

    @RequestMapping("/admin/menu/edit/{id}")
    public String menuEdit(Model model, @PathVariable int id) {
        Menu menu = menuDao.findOne(id);
        model.addAttribute("menu", menu);
        return "menu_edit";
    }

    @RequestMapping("/admin/menu/create")
    public String menuEdit() {
        return "menu_edit";
    }

    @RequestMapping("/admin/menu/save")
    public String menuSave(Menu menu) {
        System.out.println("menu = " + menu);
        //新增导航，默认创建对应页面
        if (menu.getId() == 0) {
            Article article = new Article(menu.getName(), menu.getUrl());
            articleDao.save(article);
        }
        menuDao.save(menu);
        return "menu_list";
    }

    @RequestMapping("/admin/menu/delete/{id}")
    public String delete(@PathVariable int id) {
        menuDao.delete(id);
        return "menu_list";
    }

    @RequestMapping("/admin/menu/getMenuList")
    @ResponseBody
    public Object getMenuList() {
        List<Menu> data = menuDao.findAll();

        Map dataTable = new HashMap();
        int draw = 1;
        int recordsTotal = data.size();
        int recordsFiltered = data.size();

        dataTable.put("draw", draw);
        dataTable.put("recordsTotal", recordsTotal);
        dataTable.put("recordsFiltered", recordsFiltered);
        dataTable.put("data", data);

        return dataTable;
    }
}
