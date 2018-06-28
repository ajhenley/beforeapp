//
//  AddMovieViewController.swift
//  beforeapp
//
//  Created by MC Student on 6/28/18.
//  Copyright © 2018 Parse. All rights reserved.
//

import UIKit
import Parse

class AddMovieViewController: UIViewController {

    @IBOutlet weak var movieName: UITextField!
    @IBOutlet weak var movieGenre: UITextField!
    @IBOutlet weak var releaseDate: UIDatePicker!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func addMovie(_ sender: Any) {
        
        let ACL = PFACL()
        ACL.hasPublicReadAccess = true
        
        var movie = PFObject(className:"movie")
        movie["name"] = movieName.text
        movie["genre"] = movieGenre.text
        movie["released"] = releaseDate.date
        movie.saveInBackground {
            (success: Bool, error: Error?) in
            if (success) {
                // The object has been saved.
            } else {
                // There was a problem, check error.description
            }
        }
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
