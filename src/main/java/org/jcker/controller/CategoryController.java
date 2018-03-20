package org.jcker.controller;

import com.sun.org.apache.xpath.internal.operations.Mod;
import org.jcker.dao.CategoryDao;
import org.jcker.domain.Category;
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
 * on 2018-03-15 at 9:32 AM
 *
 * @version 1.0
 */
@Controller
public class CategoryController {
    @Autowired
    private CategoryDao categoryDao;

    @RequestMapping("/admin/category/list")
    public String list() {
        return "category_list";
    }

    @RequestMapping("/admin/category/getList")
    @ResponseBody
    public Object getList() {
        List<Category> data = categoryDao.findAll();

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


    @RequestMapping("/admin/category/edit/{id}")
    public String edit(Model model, @PathVariable int id) {
        model.addAttribute("category", categoryDao.findOne(id));
        return "category";
    }

    @RequestMapping("/admin/category/save")
    @ResponseBody
    public boolean addCategory(Category category) {
        categoryDao.save(category);
        return true;
    }


    @RequestMapping("/admin/category/delete/{id}")
    public String delete(@PathVariable int id) {
        categoryDao.delete(id);
        return "category_list";
    }

    @RequestMapping("/admin/category/create")
    public String create() {
        return "category";
    }
}
