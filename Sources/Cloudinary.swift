import Foundation
import Vapor
import HTTP

final public class Cloudinary {
    let drop: Droplet
    
    private let apiKey: String
    private let apiSecret: String
    
    init(drop: Droplet) throws {
        self.drop = drop
        
        guard let apiKey = drop.config["cloudinary", "apiKey"]?.string else {
            throw CloudinaryError.noConfig
        }
        
        guard let apiSecret = drop.config["cloudinary", "apiSecret"]?.string else {
            throw CloudinaryError.noConfig
        }
        
        self.apiKey = apiKey
        self.apiSecret = apiSecret
    }
    
    public func upload(file: Data, publicId: String, timestamp: Int? = nil, signature: String? = nil) {
        
    }
    
    private func createSignature(publicId: String, timestamp: Int? = nil) -> String {
        let unixTimestamp = timestamp ?? Int(Date().timeIntervalSince1970)
        
        let sha1 = Sha
        
        let signature = "public_id=\(publicId)&timestamp=\(unixTimestamp)\(apiSecret)"
        return ""
    }
}
