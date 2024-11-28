package com.foodmodel.pojo;

public class Restaurant {
	  
    private int R_ID;
    private String RName;
    private String CusineType;
    private String Address;
    private int Rating;
    private String Available;
    private String Image;
     private String OwnerName;
    // Default Constructor
    public Restaurant() {
        super();
    }

 

	// Constructor for creating a new restaurant without R_ID (for inserts)
 

    // Constructor with all fields, including R_ID (for updates and fetch)
    public Restaurant(int r_ID, String rName, String CusineType, String address, int rating, String available) {
        super();
        R_ID = r_ID;
        RName = rName;
        this.CusineType = CusineType;
        Address = address;
        Rating = rating;
        Available = available;
    }


	public Restaurant(int r_ID, String rName, String address, int rating, String available, String ownerName) {
		super();
		R_ID = r_ID;
		RName = rName;
		Address = address;
		Rating = rating;
		Available = available;
		OwnerName = ownerName;
	}



	public Restaurant(int r_ID, String rName, String cusineType, String address, int rating, String available,
			String Image) {
		super();
		R_ID = r_ID;
		RName = rName;
		CusineType = cusineType;
		Address = address;
		Rating = rating;
		Available = available;
		this.Image = Image;
	}
	public Restaurant(String rName, String cusineType, String address, int rating, String available, String image,
			String OwnerName) {
		super();
		RName = rName;
		CusineType = cusineType;
		Address = address;
		Rating = rating;
		Available = available;
		this.Image = image;
		this.OwnerName = OwnerName;
	}
	
	
	
	public Restaurant(int r_ID, String rName, String cusineType, String address, int rating, String available,
			String Image, String ownerName) {
		super();
		R_ID = r_ID;
		RName = rName;
		CusineType = cusineType;
		Address = address;
		Rating = rating;
		Available = available;
		this.Image = Image;
		OwnerName = ownerName;
	}

	// Getter and Setter methods for all attributes
    public int getR_ID() {
        return R_ID;
    }

    public void setR_ID(int r_ID) {
        R_ID = r_ID;
    }

    public String getRName() {
        return RName;
    }

    public void setRName(String rName) {
        RName = rName;
    }

    public String getCusineType() {
        return CusineType;
    }

    public void setCusineType(String cusineType) {
        CusineType = cusineType;
    }

    public String getAddress() {
        return Address;
    }

    public void setAddress(String address) {
        Address = address;
    }

    public int getRating() {
        return Rating;
    }

    public void setRating(int rating) {
        Rating = rating;
    }

    public String getisAvailable() {
        return Available;
    }

    public void setAvailable(String available) {
        Available = available;
    }

	public String getImage() {
		return Image;
	}

	public void setImage(String Image) {
		this.Image = Image;
	}



	public String getOwnerName() {
		return OwnerName;
	}

	public void setOwnerName(String ownerName) {
		OwnerName = ownerName;
	}

	@Override
	public String toString() {
		return "Restaurant [R_ID=" + R_ID + ", RName=" + RName + ", CusineType=" + CusineType + ", Address=" + Address
				+ ", Rating=" + Rating + ", Available=" + Available + ", Image=" + Image + "]";
	}

	
    

}
