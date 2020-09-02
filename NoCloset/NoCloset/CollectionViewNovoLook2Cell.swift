//
//  collectionViewNovoLook2.swift
//  NoCloset
//
//  Created by Pedro Henrique Spínola de Assis on 02/09/20.
//  Copyright © 2020 Pedro Spínola. All rights reserved.
//

import Foundation
import UIKit

public class CollectionViewNovoLook2Cell: UICollectionViewCell {
    @IBOutlet weak var imagemNovoLook2: UIImageView!
    @IBOutlet weak var buttonUnselected2: UIButton!
    @IBOutlet weak var buttonSelected2: UIButton!
    
    @IBAction func buttonSelected2Action(_ sender: Any) {
        buttonSelected2.isHidden = true
        buttonUnselected2.isHidden = false
        
    }
    
    @IBAction func buttonUnselected2Action(_ sender: Any) {
        buttonUnselected2.isHidden = true
        buttonSelected2.isHidden = false
    }
    
}
