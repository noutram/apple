//
//  RoundedView.swift
//  socialapp
//
//  Created by Jack jones on 30/03/2017.
//  Copyright © 2017 Jack Jones. All rights reserved.
//

import UIKit

class RoundedView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = 20
        self.clipsToBounds = true 
    }

}
