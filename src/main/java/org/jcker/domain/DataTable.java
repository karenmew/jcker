package org.jcker.domain;

import java.util.List;

/**
 * Created by <a href='http://jcker.org'>Alan Turing</a>
 * on 2018-03-14 at 4:30 PM
 *
 * @version 1.0
 */
public class DataTable extends BaseEntity {
    private int draw;
    private int recordsTotal;
    private int recordsFiltered;
    private List<? extends BaseEntity> data;

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<? extends BaseEntity> getData() {
        return data;
    }

    public void setData(List<? extends BaseEntity> data) {
        this.data = data;
    }
}
