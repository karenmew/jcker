package org.jcker.controller;

import org.jcker.dao.CommentDao;
import org.jcker.domain.Comment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-10 at 2:36 PM
 *
 * @version 1.0
 */
@Controller
public class CommentController {
    @Autowired
    private CommentDao commentDao;

    @RequestMapping("/admin/comment/list")
    public String list(Model model) {
        return "comment_list";
    }

    @RequestMapping("/admin/comment/getList")
    @ResponseBody
    public Object getList() {
        List<Comment> data = commentDao.findAll();

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


    @RequestMapping("/add_comment")
    @ResponseBody
    public boolean addComment(Comment comment) {
        comment.setIsLock("N");
        comment.setContent("<pre>" + comment.getContent() + "</pre>");
        comment.setCreateDate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
        commentDao.save(comment);
        return true;
    }



    @RequestMapping("/admin/comment/delete/{id}")
    public String delete(@PathVariable int id) {
        commentDao.delete(id);
        return "comment_list";
    }

    @RequestMapping("/admin/comment/lock/{id}")
    public String lock(@PathVariable int id) {
        Comment comment = commentDao.findOne(id);
        comment.setIsLock("Y".equals(comment.getIsLock())? "N":"Y");
        commentDao.save(comment);
        return "comment_list";
    }
}
