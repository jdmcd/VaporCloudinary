import Foundation
import Vapor
import HTTP

final public class Cloudinary {
    let drop: Droplet
    
    private let apiKey: String
    
    init(drop: Droplet) throws {
        self.drop = drop
        
        guard let apiKey = drop.config["cloudinary", "apiKey"]?.string else {
            throw CloudinaryError.noConfig
        }
        
        self.apiKey = apiKey
    }
    
    public func upload(file: Data, timestamp: Int? = nil, signature: String? = nil) {
        
    }
    
    private func createSignature() -> String {
        return ""
    }
}
