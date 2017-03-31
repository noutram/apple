//
//  PostCell.swift
//  socialapp
//
//  Created by Jack jones on 31/03/2017.
//  Copyright © 2017 Jack Jones. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseDatabase

class PostCell: UITableViewCell {
    
    @IBOutlet weak var userImg: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var postImg: UIImageView!
    @IBOutlet weak var likesLbl: UILabel!
    
    var post: Post!
    var userPostKey:FIRDatabaseReference!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCell(post:Post,img:UIImage? = nil, userImg:UIImage? = nil ){
        self.post = post
        self.likesLbl.text = "\(post.likes)"
        self.username.text = post.username
        
        if img != nil {
            self.postImg.image = img
        }else{
            let ref = FIRStorage.storage().reference(forURL: post.postImg)
            ref.data(withMaxSize: 2 * 1024, completion: {(data,error) in
                if error  != nil {
                    print("couldnt loadd img")
                } else {
                    if let imgData = data {
                        if let img = UIImage(data: imgData){
                            self.postImg.image = img
                        }
                    }
                }
                
            })
        }
        if userImg != nil {
            self.postImg.image = userImg
        }else{
            let ref = FIRStorage.storage().reference(forURL: post.userImg)
            ref.data(withMaxSize: 2 * 1024, completion: {(data,error) in
                if error  != nil {
                    print("couldnt loadd img")
                } else {
                    if let imgData = data {
                        if let img = UIImage(data: imgData){
                            self.postImg.image = img
                        }
                    }
                }
                
            })
        }
    }
    
}
