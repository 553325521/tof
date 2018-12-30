package com.os.pojo;

public class O_User {
    private Integer uId;

    private String uName;

    private String uNumber;

    private String uPwd;

    private String uEmail;

    private Integer uType;

    private String uTx;

    public Integer getuId() {
        return uId;
    }

    public void setuId(Integer uId) {
        this.uId = uId;
    }

    public String getuName() {
        return uName;
    }

    public void setuName(String uName) {
        this.uName = uName == null ? null : uName.trim();
    }

    public String getuNumber() {
        return uNumber;
    }

    public void setuNumber(String uNumber) {
        this.uNumber = uNumber == null ? null : uNumber.trim();
    }

    public String getuPwd() {
        return uPwd;
    }

    public void setuPwd(String uPwd) {
        this.uPwd = uPwd == null ? null : uPwd.trim();
    }

    public String getuEmail() {
        return uEmail;
    }

    public void setuEmail(String uEmail) {
        this.uEmail = uEmail == null ? null : uEmail.trim();
    }

    public Integer getuType() {
        return uType;
    }

    public void setuType(Integer uType) {
        this.uType = uType;
    }

    public String getuTx() {
        return uTx;
    }

    public void setuTx(String uTx) {
        this.uTx = uTx == null ? null : uTx.trim();
    }

	@Override
	public String toString() {
		return "O_User [uId=" + uId + ", uName=" + uName + ", uNumber=" + uNumber + ", uPwd=" + uPwd + ", uEmail="
				+ uEmail + ", uType=" + uType + ", uTx=" + uTx + "]";
	}
    
}