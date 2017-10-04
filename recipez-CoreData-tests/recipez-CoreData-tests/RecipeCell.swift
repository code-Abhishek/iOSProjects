//
//  RecipeCell.swift
//  recipez-CoreData-tests
//
//  Created by AV on 25/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class RecipeCell: UITableViewCell {

    @IBOutlet weak var recipeLbl: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      //  recipeImg.layer.cornerRadius = 2.0
      //  recipeImg.clipsToBounds = true
    }
    
    func configureCell(recipe: Recipe) {
        recipeLbl.text = recipe.name
        recipeImg.image = recipe.getRecipeImage()
    }

}
