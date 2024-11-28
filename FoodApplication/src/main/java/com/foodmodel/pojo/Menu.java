package com.foodmodel.pojo;

public class Menu {
    private int MenuId;
    private int R_ID;
    private String Name;
    private String Description;
    private int price;
    private int Rating;
    private String isAvailable;
    private String image;

    // Constructors
    public Menu() { super(); }

    public Menu(int r_ID, String name, String description, int price, int rating,String image, String isAvailable) {
        super();
        this.R_ID = r_ID;
        this.Name = name;
        this.Description = description;
        this.price = price;
        this.Rating = rating;
       
        this.image=image;
        this.isAvailable = isAvailable;
    }

    public Menu(int menuId, int r_ID, String name, String description, int price, int rating,String image,String isAvailable) {
		super();
		MenuId = menuId;
		R_ID = r_ID;
		Name = name;
		Description = description;
		this.price = price;
		Rating = rating;
		this.image=image;
		this.isAvailable = isAvailable;
		
	}

    
    
    
    
    
	// Getters and Setters
    public int getMenuId() { return MenuId; }
    public void setMenuId(int menuId) { MenuId = menuId; }
    public int getR_ID() { return R_ID; }
    public void setR_ID(int r_ID) { R_ID = r_ID; }
    public String getName() { return Name; }
    public void setName(String name) { Name = name; }
    public String getDescription() { return Description; }
    public void setDescription(String description) { Description = description; }
    public int getPrice() { return price; }
    public void setPrice(int price) { this.price = price; }
    public int getRating() { return Rating; }
    public void setRating(int rating) { 
    	Rating = rating; 
    	}
    
    public String isAvailable() { 
    	return isAvailable; 
    	}
    public void setAvailable(String isAvailable)
    { 
    	this.isAvailable = isAvailable; 
    	
    }

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}
    

    
}