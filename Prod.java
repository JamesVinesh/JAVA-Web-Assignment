package Model;

public class Prod {
    private int prodID;
    private int adminID;
    private String category;
    private String prodName;
    private double prodPrice;
    private String prodDesc;
    private int stock;
    private String prodImage; // 存储图片文件名
    private String imagePath;


    public Prod() {
    }

    // 全部属性 constructor（可选）
    public Prod(int prodID, int adminID, String category, String prodName, double prodPrice,
                String prodDesc, int stock, String prodImage) {
        this.prodID = prodID;
        this.adminID = adminID;
        this.category = category;
        this.prodName = prodName;
        this.prodPrice = prodPrice;
        this.prodDesc = prodDesc;
        this.stock = stock;
        this.prodImage = prodImage;
    }

    // Getter and Setter 方法
    public int getProdID() {
        return prodID;
    }

    public void setProdID(int prodID) {
        this.prodID = prodID;
    }

    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getProdName() {
        return prodName;
    }

    public void setProdName(String prodName) {
        this.prodName = prodName;
    }

    public double getProdPrice() {
        return prodPrice;
    }

    public void setProdPrice(double prodPrice) {
        this.prodPrice = prodPrice;
    }

    public String getProdDesc() {
        return prodDesc;
    }

    public void setProdDesc(String prodDesc) {
        this.prodDesc = prodDesc;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getProdImage() {
        return prodImage;
    }

    public void setProdImage(String prodImage) {
        this.prodImage = prodImage;
    }
    
    public String getImagePath() {
        return imagePath;
    }

    public void setImagePath(String imagePath){
        this.imagePath = imagePath;
    }
}