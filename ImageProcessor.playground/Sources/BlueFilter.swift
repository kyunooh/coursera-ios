import UIKit

public class BlueFilter: RGBAImage {
    public func blueImage(level: Int) -> UIImage? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        var bitmapInfo: UInt32 = CGBitmapInfo.ByteOrder32Big.rawValue
        bitmapInfo |= CGImageAlphaInfo.PremultipliedLast.rawValue & CGBitmapInfo.AlphaInfoMask.rawValue
        
        let bytesPerRow = width * 4
        
        let imageDataReference = UnsafeMutablePointer<Pixel>(pixels)
        for h in 0..<height {
            for w in 0..<width {
                let i = h * width + w
                
                let green =  Float(imageDataReference[i].green) - (Float(level) * 2.55)
                imageDataReference[i].green = UInt8(max(0, min(255, green)))
                
                let blue = Float(imageDataReference[i].blue) + (Float(level) * 2.55)
                imageDataReference[i].blue = UInt8(max(0, min(255, blue)))
                
                let red = Float(imageDataReference[i].red) - (Float(level) * 2.55)
                imageDataReference[i].red = UInt8(max(0, min(255, red)))
                
                
            }
        }
        
        defer {
            imageDataReference.destroy()
        }
        
        let imageContext = CGBitmapContextCreateWithData(imageDataReference, width, height, 8, bytesPerRow, colorSpace, bitmapInfo, nil, nil)
        
        guard let cgImage = CGBitmapContextCreateImage(imageContext) else {return nil}
        let image = UIImage(CGImage: cgImage)
        return image
    }
}