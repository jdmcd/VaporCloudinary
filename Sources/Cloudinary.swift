import Foundation
import Vapor
import HTTP
import CryptoSwift

final public class Cloudinary {
    private let drop: Droplet
    private let apiKey: String
    private let apiSecret: String
    private let cloudName: String
    
    init(drop: Droplet) throws {
        self.drop = drop
        
        guard let apiKey = drop.config["cloudinary", "apiKey"]?.string else {
            throw CloudinaryError.noConfig
        }
        
        guard let apiSecret = drop.config["cloudinary", "apiSecret"]?.string else {
            throw CloudinaryError.noConfig
        }
        
        guard let cloudName = drop.config["cloudinary", "cloudName"]?.string else {
            throw CloudinaryError.noConfig
        }
        
        self.apiKey = apiKey
        self.apiSecret = apiSecret
        self.cloudName = cloudName
    }
    
    public func upload(file: Data, publicId: String, timestamp: Int? = nil, signature: String? = nil) throws -> Response {
        let unixTimestamp = timestamp ?? Int(Date().timeIntervalSince1970)
        let signature = createSignature(publicId: publicId, timestamp: unixTimestamp)
        
        let parameters = JSON([
                "timestamp": try unixTimestamp.makeNode(),
                "public_id": publicId.makeNode(),
                "api_key": apiKey.makeNode(),
                "file": try file.makeNode(),
                "signature": signature.makeNode()
        ])
        
        return try drop.client.post(url(), headers: [:], query: [:], body: parameters.makeBody())
    }
    
    private func createSignature(publicId: String, timestamp: Int) -> String {
        return "public_id=\(publicId)&timestamp=\(timestamp)\(apiSecret)".sha1()
    }
    
    private func url() -> String {
        return "https://api.cloudinary.com/v1_1/\(cloudName)/image/upload"
    }
}
