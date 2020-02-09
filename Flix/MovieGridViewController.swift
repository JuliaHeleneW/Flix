//
//  MovieGridViewController.swift
//  Flix
//
//  Created by user163612 on 2/8/20.
//  Copyright © 2020 user163612. All rights reserved.
//

import UIKit
import AlamofireImage

class MovieGridViewController: UIViewController ,UICollectionViewDataSource,UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "MovieGridCell",for:indexPath) as! MovieGridCell
        let movie=movies[indexPath.item]
        if let posterPath=movie["poster_path"] as? String{
            let baseURL="https://image.tmdb.org/t/p/w185"
            let posterUrl=URL(string: baseURL+posterPath)
            cell.posterView.af_setImage(withURL: posterUrl!)
        }
        else{
            cell.posterView.image=nil
        }
        return cell
        
    }
    
    var movies=[[String:Any]]()

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate=self
        collectionView.dataSource=self
        let layout=collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.minimumLineSpacing=4
        layout.minimumInteritemSpacing=4
        let width=(view.frame.size.width-layout.minimumInteritemSpacing*2)/2
        layout.itemSize=CGSize(width:width,height:width*1.6)

        // Do any additional setup after loading the view.
        let url = URL(string: "https://api.themoviedb.org/3/movie/297762/similar?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
              let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            
            self.movies=dataDictionary["results"] as! [[String:Any]]
            self.collectionView.reloadData()

              // TODO: Get the array of movies
              // TODO: Store the movies in a property to use elsewhere
              // TODO: Reload your table view data

           }
        }
        task.resume()    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //find the selected movie
        let cell=sender as! UICollectionViewCell
        let indexPath=collectionView.indexPath(for: cell)!
        let movie=movies[indexPath.row]
        //pass the selected movie to the details view controller
        let detailsViewController=segue.destination as! MovieDetailsViewController
        detailsViewController.movie=movie
        collectionView.deselectItem(at: indexPath, animated: true)
    }}
