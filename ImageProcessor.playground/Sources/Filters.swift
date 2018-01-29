import UIKit

public class Filters {
    
    public static func filterByName(image: UIImage, filterName: String) -> UIImage? {
        if (filterName == "blueBoosting") {
            return blueBoosting(image)
        } else if (filterName == "purpleBoosting"){
            return purpleBoosting(image)
        } else if (filterName == "redBoosting"){
            return redBoosting(image)
        } else if (filterName == "transparentImage") {
            return transparentImage(image)
        } else if (filterName == "darkAndBrightedImage") {
            return darkAndBrightedImage(image)
        }
        
        return nil
    }
    
    public static func blueBoosting (image: UIImage) -> UIImage {
        let blueImage = BlueFilter(image: image)
        return blueImage!.blueImage(30)!
    }
    
    public static func purpleBoosting (image: UIImage) -> UIImage {
        let purpleImage = PurpleFilter(image: image)
        return purpleImage!.purpleImage(30)!
    }
    
    public static func redBoosting (image: UIImage) -> UIImage {
        let redImage = RedFilter(image: image)
        return redImage!.redImage(30)!
    }
    
    public static func transparentImage (image: UIImage) -> UIImage {
        let transparentImage = TransparencyFilter(image: image)
        return transparentImage!.transparencyImage(30)!
    }
    
    public static func darkAndBrightedImage (image: UIImage ) -> UIImage {
        let darkAndBrightedImage = DarkAndBrightedFilter(image: image)
        return darkAndBrightedImage!.darkAndBrightedImage(10)!
    }
}