//
//  CollectionViewLooksReusableView.swift
//  NoCloset
//
//  Created by Pedro Henrique Spínola de Assis on 03/09/20.
//  Copyright © 2020 Pedro Spínola. All rights reserved.
//

import Foundation
import UIKit

class CollectionViewLooksReusableView: UICollectionReusableView {
    @IBOutlet weak var labelSection: UILabel!
    
    var tituloSection: String! {
        didSet {
            labelSection.text = tituloSection
        }
    }
}
