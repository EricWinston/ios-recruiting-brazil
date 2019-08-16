//
//  FavoriteCRUD.swift
//  MoviesApp
//
//  Created by Eric Winston on 8/15/19.
//  Copyright © 2019 Eric Winston. All rights reserved.
//

import UIKit
import CoreData

class FavoriteCRUD{
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var favorites = [Favorite]()
    static let sharedCRUD = FavoriteCRUD()
    
    private init(){
    }
    
    //MARK - Add new favorite in database
    func addFavorite(movie: SimplifiedMovie){
        
        var genNames: [String] = []
        
        for gen in movie.genres{
            genNames.append(gen.name)
        }
        
        let newFavorite = Favorite(context: context)
        newFavorite.title = movie.name
        newFavorite.overview = movie.description
        newFavorite.date = movie.date
        newFavorite.id = Int32(movie.id)
        newFavorite.genres = genNames
        newFavorite.image = movie.bannerImage?.pngData()
        
        favorites.append(newFavorite)
        saveData()
    }
    
    //MARK - Load the favorites form the database
    func loadData() throws -> [Favorite]{
        let request: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        favorites = try context.fetch(request)
        return favorites
    }
    
    //MARK - Save the context
    func saveData(){
        do{
            try context.save()
        } catch {
            print("Error: \(error)")
        }
    }
    
    //MARK - Filter the database by id
    func checkFavoriteMovies(movieId: String) -> Bool{
        let request: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        let predicate = NSPredicate(format: "id == %@", movieId)
        
        request.predicate = predicate
        
        var movie = [Favorite]()
        
        do{
            movie = try context.fetch(request)
        }catch{
            print("Error fetching data from contect")
        }
        return !movie.isEmpty
    }
    
    
    //MARK - Get a movie from the database
    func filterFavorites(format: String,filter: String) -> [Favorite]{
        let request: NSFetchRequest<Favorite> = Favorite.fetchRequest()
        let predicate = NSPredicate(format: format, filter)
        
        request.predicate = predicate
        
        var filter = [Favorite]()
        
        do{
            filter = try context.fetch(request)
        }catch{
            print("Error fetching data from contect")
        }
        
        return filter
    }
    
    
    //MARK - Delete a movie
    func deleteFavorite(movieForDeletion: Favorite){
        context.delete(movieForDeletion)
        saveData()
    }
}

