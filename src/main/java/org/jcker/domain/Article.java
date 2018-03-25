package org.jcker.domain;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-02-23 at 3:13 PM
 *
 * @version 1.0
 */
@Entity
@Table(name = "t_article")
public class Article extends BaseEntity {
    @Id
    @GeneratedValue
    private int id;
    @Column(columnDefinition = "TEXT")
    private String content;
    private String title;
    @Column(name = "create_date")
    private String createDate;
    @Column(name = "view_num")
    private int viewNum;
    private String tags;
    @Transient
    private String preview;
    @Column(name = "is_page")
    private String isPage;

    public Article() {
        super();
    }

    /**
     * for create new page
     *
     * @param title page title
     * @param url   page url from menu
     */
    public Article(String title, String url) {
        this.content = "this is a new page, please add something here";
        this.title = title;
        this.isPage = "Y";
        this.tags = "system";
        this.createDate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
    }

    public String getIsPage() {
        return isPage;
    }

    public void setIsPage(String isPage) {
        this.isPage = isPage;
    }

    public String getTags() {
        return tags;
    }

    public void setTags(String tags) {
        this.tags = tags;
    }

    public String getPreview() {
        return preview;
    }

    public void setPreview(String preview) {
        this.preview = preview;
    }

    public String getCreateDate() {
        return createDate;
    }

    public void setCreateDate(String createDate) {
        this.createDate = createDate;
    }

    public int getViewNum() {
        return viewNum;
    }

    public void setViewNum(int viewNum) {
        this.viewNum = viewNum;
    }


    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

}
