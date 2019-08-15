//
//  DetailsController.swift
//  MoviesApp
//
//  Created by Eric Winston on 8/15/19.
//  Copyright © 2019 Eric Winston. All rights reserved.
//

import UIKit

class DetailsController: UIViewController {
    let screen = DetailsView()
    let viewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        self.view = screen
        
        screen.configure(detailedMovie: viewModel.movie!, genreNames: viewModel.detailsGenres())
        screen.button.addTarget(self, action: #selector(addFavoriteAction), for: .touchUpInside)
    }
    
    @objc func addFavoriteAction(){
        viewModel.addFavorite()
    }
}
