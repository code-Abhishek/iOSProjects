//
//  PostCell.swift
//  MyHood
//
//  Created by AV on 21/02/17.
//  Copyright © 2017 AV. All rights reserved.
//

import UIKit

class PostCell: UITableViewCell {

    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var postTitle: UILabel!
    @IBOutlet weak var postDesc: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        postImg.layer.cornerRadius = postImg.frame.size.width / 2
        postImg.clipsToBounds =  true
    }
    
    func configureCell (post: Post) {
        postTitle.text = post.title
        postDesc.text = post.desc
        postImg.image = DataServices.instance.imageForPath(post.imgPath)
    }
}
