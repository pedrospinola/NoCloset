//
//  Peca.swift
//  NoCloset
//
//  Created by Hélio Silva on 31/08/20.
//  Copyright © 2020 Pedro Spínola. All rights reserved.
//

import UIKit

class Peca{
    
    var foto: UIImage
    var nome: String
    var pertence: Bool = false
    
    init(foto: UIImage, nome:String) {
        self.foto = foto
        self.nome = nome
    }
    
}

class Look{
    
    var nome: String
    var pecas: [Peca]
    
    init(pecas: [Peca], nome:String) {
        self.pecas = pecas
        self.nome = nome
    }
}

class TipoLook{
    
    var nome: String
    var looks: [Look]
    
    init(looks: [Look], nome:String) {
        self.looks = looks
        self.nome = nome
    }
    
}



