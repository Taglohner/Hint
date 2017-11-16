//
//  MovieCell.swift
//  Hint
//
//  Created by Steven Taglohner on 16/11/2017.
//  Copyright © 2017 Steven Taglohner. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {
    
    //MARK: Properties

    @IBOutlet weak var movieCover: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    @IBOutlet weak var movieReleaseDate: UILabel!
    
    let lightGrayColor = UIColor(r: 98, g: 98, b: 98, alpha: 1)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        movieTitle.numberOfLines = 2
        movieTitle.textAlignment = .natural
        movieTitle.font = UIFont(name: "Helvetica Neue", size: 20)
        
        movieCover.contentMode = .scaleAspectFit
        
        movieOverview.numberOfLines = 4
        movieOverview.textAlignment = .natural
        movieOverview.font = UIFont(name: "Helvetica Neue", size: 16)
        movieOverview.textColor = lightGrayColor
        
        movieReleaseDate.numberOfLines = 1
        movieReleaseDate.textAlignment = .natural
        movieReleaseDate.font = UIFont(name: "Helvetica Neue", size: 16)
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
}
