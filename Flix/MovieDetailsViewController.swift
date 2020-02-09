//
//  MovieDetailsViewController.swift
//  Flix
//
//  Created by user163612 on 2/8/20.
//  Copyright © 2020 user163612. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieDetailsViewController: UIViewController {

    @IBOutlet weak var backdropView: UIImageView!
    @IBOutlet weak var posterView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var synopsisLabel: UILabel!
    
    var movie: [String:Any]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        titleLabel.text=movie["title"] as? String
        titleLabel.sizeToFit()
        synopsisLabel.text=movie["overview"] as? String
        if let posterPath=movie["poster_path"] as? String{
            let baseURL="https://image.tmdb.org/t/p/w185"
            let posterUrl=URL(string: baseURL+posterPath)
            posterView.af_setImage(withURL: posterUrl!)
        }
        else{
            posterView.image=nil
        }
        if let backdropPath=movie["backdrop_path"] as? String{
            let backdropURL="https://image.tmdb.org/t/p/w780"
            let backdropUrl=URL(string: backdropURL+backdropPath)
            backdropView.af_setImage(withURL: backdropUrl!)
        }
        else{
            backdropView.image=nil
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
