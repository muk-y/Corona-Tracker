class WalkthroughModel {

    String imagePath;
    String title;
    String description;

    WalkthroughModel({this.imagePath, this.title, this.description});

    void setImagePath(String imagePath) {
        this.imagePath = imagePath;
    }

    void setTitle(String title) {
        this.title = title;
    }
    
    void setDescription(String description) {
        this.description = description;
    }

    String getImagePath() { return imagePath; }
    String getTitle() { return title; }
    String getDescription() { return description; }

}