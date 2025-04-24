// model/Staff.java
package model;

public class Staff {
    private String ID;
    private String name;
    private String tel;
    private String email;
    private String password;
    private String role;

    public String getId() { 
        return ID; 
    }
    public void setId(String ID) { 
        this.ID = ID; 
    }
    public String getName() { 
        return name; 
    }
    public void setName(String name) { 
        this.name = name; 
    }

    public String getTel() { 
        return tel; 
    }
    public void setTel(String tel) { 
        this.tel = tel; }
    

    public String getEmail() { 
        return email; 
    }
    public void setEmail(String email) { 
        this.email = email; 
    }

    public String getPassword() {
        return password; 
    }
    public void setPassword(String password) { 
        this.password = password; 
    }

    public String getRole() {
        return role; 
    }
    public void setRole(String role) { 
        this.role = role;
    }
}
