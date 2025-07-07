package net.webapp.model;

public class Customer {
	private int id;
    private String fullname;
    private String username;
    private String nic;
    private String address;
    private String email;
    private String phone;

    public Customer(int id,String fullname, String username, String nic, String address, String email, String phone) {
        this.fullname = fullname;
        this.id = id;
        this.username = username;
        this.nic = nic;
        this.address = address;
        this.email = email;
        this.phone = phone;
    }

    public int getId() {
        return id;
    }
    
    public String getFullname() {
        return fullname;
    }

    public String getUsername() {
        return username;
    }

    public String getNic() {
        return nic;
    }

    public String getAddress() {
        return address;
    }

    public String getEmail() {
        return email;
    }

    public String getPhone() {
        return phone;
    }
}
