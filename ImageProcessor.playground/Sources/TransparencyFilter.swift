import UIKit


public class TransparencyFilter: RGBAImage {
    internal func transparencyImage(level: Int) -> UIImage? {
        let colorSpace = CGColorSpaceCreateDeviceRGB()
        
        var bitmapInfo: UInt32 = CGBitmapInfo.ByteOrder32Big.rawValue
        bitmapInfo |= CGImageAlphaInfo.PremultipliedLast.rawValue & CGBitmapInfo.AlphaInfoMask.rawValue
        
        let bytesPerRow = width * 4
        
        let imageDataReference = UnsafeMutablePointer<Pixel>(pixels)
        for h in 0..<height {
            for w in 0..<width {
                let i = h * width + w
                imageDataReference[i].alpha = UInt8(max(0, min(255, 255.0 - (Float(level) * 2.55))))
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
