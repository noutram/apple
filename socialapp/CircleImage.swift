//
//  CircleImage.swift
//  socialapp
//
//  Created by Jack jones on 30/03/2017.
//  Copyright © 2017 Jack Jones. All rights reserved.
//

import UIKit

class CircleImage: UIImageView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }

}
