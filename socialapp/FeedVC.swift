//
//  FeedVC.swift
//  socialapp
//
//  Created by Jack jones on 30/03/2017.
//  Copyright © 2017 Jack Jones. All rights reserved.
//

import UIKit
import Firebase


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
        return PostCell()
    }
    
}
