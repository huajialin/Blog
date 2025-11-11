package com.blog.dto;

public class AdminUserDTO {
    private int id;
    private String username;
    private String password;
    private boolean isDeleted;

    public AdminUserDTO() {

    }

    public AdminUserDTO(int id, String username, String password, boolean isDeleted) {
        this.id = id;
        this.username = username;
        this.password = password;
        this.isDeleted = isDeleted;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public boolean isDeleted() {
        return isDeleted;
    }

    public void setDeleted(boolean deleted) {
        isDeleted = deleted;
    }
}
