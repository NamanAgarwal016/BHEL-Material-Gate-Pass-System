package login.bean;

import java.io.Serializable;

public class LoginBean implements Serializable {
    /**
     * 
     */
    private static final long serialVersionUID = 1L;
    private String username;
    private String password;
    public int UserID;
    public String Name;
    public int staffid;
    
    public int getstaffid() {
    	return staffid;
    }
    
    public void setstaffid(int staffid) {
    	this.staffid = staffid;
    }
    
    public String getName() {
    	return Name;
    }
    
    public void setName(String Name) {
    	this.Name = Name;
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
    
    public void setUserID(int UserID) {
    	this.UserID = UserID;
    }
    public int getUserID() {
    	return UserID;
    }
}
