//
//  Artist.swift
//  TwoDayDemo
//
//  Created by ya Liu on 2017/8/22.
//  Copyright © 2017年 wasterd. All rights reserved.
//

import UIKit

class Artist {
    var name = ""
    var bio = ""
    var imge: UIImage
    var works = [Work]()
    
    init(name: String, bio: String, image: UIImage,  works:[Work]) {
        self.name = name
        self.bio = bio
        self.imge = image
        self.works = works
    }
    
    
   static  func getDataFromBundle() -> [Artist]{
        var artits = [Artist]()
        
        guard let url = Bundle.main.url(forResource: "artists", withExtension: "json") else {
            return artits
        }
        
        do {
            let data = try Data.init(contentsOf: url)
            guard let rootObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
                return artits
            }
            
            guard let artistObjects = rootObject["artists"] as? [[String: Any]] else {
                return artits
            }
            
            for artistObject in artistObjects {
                if let name = artistObject["name"] as? String ,
                    let bio  = artistObject["bio"] as? String,
                    let imageName = artistObject["image"] as? String,
                    let image = UIImage(named:imageName),
                    let worksObject = artistObject["works"] as? [[String : String]]{
                    var works = [Work]()
                    for work in worksObject {
                        if let workTitle = work["title"],
                            let workInfo = work["info"],
                            let workImage = work["image"]{
                            works.append(Work(title: workTitle, image: workImage, info: workInfo, isExpanded: false))
                        }
                        }
                            let artist = Artist(name: name, bio: bio, image: image, works: works)
                            artits.append(artist)
                        }
                }

        }catch  {
            return artits
        }
        return artits
    }
}
