//
//  FeedVC.swift
//  socialapp
//
//  Created by Jack jones on 30/03/2017.
//  Copyright © 2017 Jack Jones. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase


class FeedVC: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var postBtn: UIButton!
    
    var posts = [Post]()
    var post: Post!
    var imagePicker: UIImagePickerController!
        
        
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.delegate = self
        tableView.dataSource = self
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
    
        FIRDatabase.database().reference().child("posts").observe(.value, with: {(snapshot)in
            if let snapshot = snapshot.children.allObjects as? [FIRDataSnapshot] {
                for data in snapshot {
                    print(data)
                    if let postDict = data.value as? Dictionary<String, AnyObject> {
                        let key = data.key
                        let post = Post(postKey: key, postData: postDict)
                        self.posts.append(post)
                    }
                }
            }
            self.tableView.reloadData()
        })
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int)->
        Int{
            return posts.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath)->
        UITableViewCell {
            let post = posts[indexPath.row]
            if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCell")as?
                PostCell{
                cell.configCell(post: post)
                return cell
            }else{
                return PostCell()
            }
    }
}
