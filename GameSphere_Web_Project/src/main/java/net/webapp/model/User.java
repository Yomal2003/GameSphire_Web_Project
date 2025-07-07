package net.webapp.model;

public class User {
	 
    private int id;
    private String fullname;
    private String username;
    private String nic;
    private String address;
    private String email;
    private String phone;

    public User(int id,String fullname, String username, String nic, String address, String email, String phone) {
    	 this.id = id; // Assign id	
        this.fullname = fullname;
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
