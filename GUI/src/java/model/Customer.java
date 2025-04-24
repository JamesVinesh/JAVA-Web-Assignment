package model;

import javax.persistence.*;

@Entity
@Table(name = "CUSTOMER") 
public class Customer {

    @Id
    @Column(name = "CUSTEMAIL")  
    private String email;

    @Column(name = "CUSTNAME")
    private String name;

    @Column(name = "CUSTPASSWORD")
    private String password;

    @Column(name = "CUSTTEL")
    private String contact;

    @Column(name = "CUSTADDRESS")
    private String address;

    @Column(name = "CUSTGENDER")
    private String gender;


    public String getEmail() {
        return email;
    }
    public void setEmail(String email) {
        this.email = email;
    }

    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }

    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }

    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }

    public String getGender() {
        return gender;
    }
    public void setGender(String gender) {
        this.gender = gender;
    }

}
