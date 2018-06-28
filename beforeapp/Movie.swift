//
//  Movie.swift
//  beforeapp
//
//  Created by Alton Henley on 6/28/18.
//  Copyright © 2018 Parse. All rights reserved.
//

import Foundation
import Parse

class Movie
{
    var id: String
    var name: String
    var released: Date
    var genre: String
    
    init(id:String, name:String, released:Date, genre:String) {
        self.id = id
        self.name = name
        self.released = released
        self.genre = genre
    }
    
    func saveMovie()
    {
        var mymovie = PFObject(className:"Movie")
        mymovie["name"] = self.name
        mymovie["genre"] = self.genre
        mymovie["released"] = self.released
        mymovie.saveEventually()
    }
    
    func getMovieById(id:String)
    {
        let query = PFQuery(className:"Movie")
        query.fromLocalDatastore()
        query.getObjectInBackground(withId: "5HO3cccB2W") { (thismovie: PFObject?, error: Error?) in
            
            if error != nil {
                print(error)
                
            } else {
                
                print(thismovie)
            }
        }
    }
    
    func getAllMovies() -> [Movie]
    {
        let query = PFQuery(className:"Movie")
        query.fromLocalDatastore()
        query.whereKeyExists("objectId")
        let data = try? query.findObjects()
        
        var movies: [Movie] = []
        
        guard let objectArray = data else {
            return movies
        }
        
        for flick in objectArray
        {
            movies.append(Movie(id:flick["objectId"] as! String,
                                name: flick["name"] as! String,
                                released: flick["released"] as! Date,
                                genre: flick["genre"] as! String))
        }
        return movies
    }
}
