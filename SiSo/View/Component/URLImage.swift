//
//  Image+URL+Cache.swift
//  SiSo
//
//  Created by 구형모 on 2022/01/08.
//

import SwiftUI

struct URLImage: View {
    @ObservedObject private var imageLoader: ImageLoader
    private let url: URL
    let imagePlaceholder = UIImage(named: "profile_dummy")!
    
    init(url: URL) {
        self.url = url
        self.imageLoader = ImageLoader(url)
    }
    
    var image: UIImage? {
        if let imageFromCache = imageCache.object(forKey: url as AnyObject) as? UIImage {
            return imageFromCache
        }
        
        return imageLoader.data.flatMap(UIImage.init)
    }
    
    var body: Image {
        Image(uiImage: image ?? imagePlaceholder)
    }
}

let imageCache = NSCache<AnyObject, AnyObject>()

final class ImageLoader: ObservableObject {
    private var task: URLSessionDataTask?
    
    @Published var data: Data?
    
    init(_ url: URL) {
        task = URLSession.shared.dataTask(with: url) { data, _, _ in
            if let data = data, let imageToCache = UIImage(data: data) {
                imageCache.setObject(imageToCache, forKey: url as AnyObject)
            }
            DispatchQueue.main.async { self.data = data }
        }
        task?.resume()
    }
    
    deinit {
        task?.cancel()
    }
}
