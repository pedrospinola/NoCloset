//
//  CollectionViewNovoLook.swift
//  NoCloset
//
//  Created by Pedro Henrique Spínola de Assis on 31/08/20.
//  Copyright © 2020 Pedro Spínola. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewNovoLookCell: UICollectionViewCell{
    
    @IBOutlet weak var imagemPeçaDoLook: UIImageView!
    
    @IBOutlet weak var buttonUnselectedImage: UIButton!
    
    @IBOutlet weak var buttonSelectedImage: UIButton!
    
    @IBAction func buttonUnselected(_ sender: Any) {
        buttonSelectedImage.isHidden = false
        buttonUnselectedImage.isHidden = true
    }
    
//    override func prepareForReuse() {
//        super.prepareForReuse()
//        
//        imagemPeçaDoLook.image = UIImage()
//        buttonSelectedImage.isHidden = true
//        buttonUnselectedImage.isHidden = false
//    }
    
    @IBAction func buttonSelected(_ sender: Any) {
        buttonSelectedImage.isHidden = true
        buttonUnselectedImage.isHidden = false
    }
    
    
}
