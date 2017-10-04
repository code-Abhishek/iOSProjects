//
//  MovieCell.swift
//  Movie-Box
//
//  Created by Abhishek on 12/07/17.
//  Copyright © 2017 Abhishek. All rights reserved.
//

import UIKit

class MovieCell: UITableViewCell {

    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieReason: UILabel!
    @IBOutlet weak var movieImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func configureCell(movie: Movies){
        movieTitle.text = movie.title
        movieReason.text = movie.reason
        movieImg.image = movie.getMovieImg()
    }
    
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
