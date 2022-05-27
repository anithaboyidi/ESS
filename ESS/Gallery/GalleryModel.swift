//
//  GalleryModel.swift
//  ESS
//
//  Created by wido technologies on 27/05/22.
//


import Foundation

struct GalleryModel {
    var image:String = ""
    var name:String = ""
    
    init(image: String, name: String){
        self.image = image
        self.name = name
    }
}
