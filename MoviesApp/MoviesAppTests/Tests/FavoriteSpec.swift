//
//  FavoriteSpec.swift
//  MoviesAppTests
//
//  Created by Eric Winston on 8/20/19.
//  Copyright © 2019 Eric Winston. All rights reserved.
//

import Foundation
import Quick
import Nimble

@testable import MoviesApp

class FavoriteSpec: QuickSpec{
    
    override func spec() {
        
        let mock = FavoriteMock()
        let crud = CRUDMock()
        let viewModel = FavoriteViewModel(crud: crud)
        let controller = FavoriteController(crud: crud)
        
        beforeEach {
            viewModel.favorites = mock.favorites
            viewModel.images = mock.images
        }
        
        describe("Load favorites from the database") {
            it("has to enter the loadFavorites function"){
                viewModel.loadFavorites()
                expect(crud.hasLoadData).to(beTrue())
            }
        }
        
        describe("Check if is deleting favorites") {
            it("has to call the delete favorite function"){
                let fav = Favorite()
                viewModel.deleteFavorite(movie: fav, at: 0)
                expect(crud.hasDeletedFav).to(beTrue())
            }
        }
        
        describe("Check filter by name") {
            it("has to call the delete favorite function"){
                let fav = Favorite()
                viewModel.deleteFavorite(movie: fav, at: 0)
                expect(crud.hasDeletedFav).to(beTrue())
            }
        }
        
        
        describe("Check if the view is loading") {
            it("view has to be equal to equal to the FavoriteView"){
                controller.viewDidLoad()
                expect(controller.view) == controller.screen
            }
        }
        
        describe("Check if the view is loading") {
            it("view has to be equal to equal to the FavoriteView"){
                controller.viewDidLoad()
                expect(controller.view) == controller.screen
            }
        }
    }
}
