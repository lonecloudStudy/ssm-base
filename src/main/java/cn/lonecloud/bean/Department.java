package cn.lonecloud.bean;

public class Department {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_dept.id
     *
     * @mbggenerated Sun Apr 30 16:11:36 CST 2017
     */
    private String id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column tbl_dept.name
     *
     * @mbggenerated Sun Apr 30 16:11:36 CST 2017
     */
    private String name;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_dept.id
     *
     * @return the value of tbl_dept.id
     *
     * @mbggenerated Sun Apr 30 16:11:36 CST 2017
     */
    public String getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_dept.id
     *
     * @param id the value for tbl_dept.id
     *
     * @mbggenerated Sun Apr 30 16:11:36 CST 2017
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column tbl_dept.name
     *
     * @return the value of tbl_dept.name
     *
     * @mbggenerated Sun Apr 30 16:11:36 CST 2017
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column tbl_dept.name
     *
     * @param name the value for tbl_dept.name
     *
     * @mbggenerated Sun Apr 30 16:11:36 CST 2017
     */
    public void setName(String name) {
        this.name = name;
    }
}