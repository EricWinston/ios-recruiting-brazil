//
//  FavoriteMock.swift
//  MoviesAppTests
//
//  Created by Eric Winston on 8/20/19.
//  Copyright © 2019 Eric Winston. All rights reserved.
//

import Foundation
import UIKit


@testable import MoviesApp

class FavoriteMock{
    var favorites = [Favorite]()
    var images = [UIImage]()
    
    init() {
        createFavorite()
        createFavorite()
        
        let img = UIImage(named: "check_icon")
        let img2 = UIImage(named: "check_icon")
        images.append(contentsOf: [img!,img2!])
    }
    
    
    func createFavorite(){
        let newFavorite = Favorite()
        favorites.append(newFavorite)
    }
}
