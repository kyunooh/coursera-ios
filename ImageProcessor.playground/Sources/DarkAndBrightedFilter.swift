import UIKit


public class DarkAndBrightedFilter: RGBAImage {
    internal func darkAndBrightedImage(level: Int) -> UIImage? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        var bitmapInfo: UInt32 = CGBitmapInfo.ByteOrder32Big.rawValue
        bitmapInfo |= CGImageAlphaInfo.PremultipliedLast.rawValue & CGBitmapInfo.AlphaInfoMask.rawValue
        
        let bytesPerRow = width * 4
        
        let imageDataReference = UnsafeMutablePointer<Pixel>(pixels)
        let lastPixel = height * width
        for h in 0..<height {
            for w in 0..<width {
                let i = h * width + w
                imageDataReference[i] = darkAndBrightedPixel(pixel: &imageDataReference[i], width: w, height: h, last: lastPixel, level: level)
                
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
    
    private func darkAndBrightedPixel(inout pixel pixel: Pixel, width w: Int, height h: Int, last lastPixel: Int, level: Int) -> Pixel {
        let fRed = Float(pixel.red)
        let fGreen = Float(pixel.green)
        let fBlue = Float(pixel.blue)
        pixel.red = UInt8(min(255, Int(max(0, fRed * Float(h * w * level) / Float(lastPixel)))))
        pixel.green = UInt8(min(255, Int(max(0, fGreen * Float(h * w * level) / Float(lastPixel)))))
        pixel.blue = UInt8(min(255, Int(max(0, fBlue * Float(h * w * level) / Float(lastPixel)))))
        return pixel
    }
    
}
