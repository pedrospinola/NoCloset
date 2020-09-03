//
//  EncherGuardaRoupa.swift
//  NoCloset
//
//  Created by Pedro Henrique Spínola de Assis on 03/09/20.
//  Copyright © 2020 Pedro Spínola. All rights reserved.
//

import Foundation
import UIKit

// encher Guarda-Roupa


public func encherAcessorios(){
    
    let nomes:[String] = ["Colar Flecha", "Oculos Quadrado", "Bucket Preto", "Chapéu de Palha", "Boné Azul", "Cordão de Prata", "Gorro Amarelo", "Óculos Redondo"]
    
    for n in 0..<7 {
        
        let novapeca: Peca = Peca(foto:UIImage(imageLiteralResourceName: "acessorio"+String(n+1)), nome: nomes[n])
        
        acessorios.append(novapeca)
        
    }
    
}

public func encherParteCima(){
    
    let nomes:[String] = ["Camiseta Branca", "Camiseta Marrom", "Camiseta Cinza", "Camisa Listrada", "Camisa Espacial", "Casaco Azul", "Jaqueta Jeans"]
    
    for n in 0..<7 {
        
        let novapeca: Peca = Peca(foto:UIImage(imageLiteralResourceName: "pecaCima"+String(n+1)), nome: nomes[n])
        
        parteCima.append(novapeca)
        
    }
    
}

public func encherParteBaixo(){
    
    let nomes:[String] = ["Short Pelicano", "Bermuda Jeans", "Short Bege", "Calça Adidas", "Jeans Preta", "Calça Alfaiataria", "Calça Cargo Verde", "Short Preto"]
    
    for n in 0..<7 {
        
        let novapeca: Peca = Peca(foto:UIImage(imageLiteralResourceName: "pecaBaixo"+String(n+1)), nome: nomes[n])
        
        parteBaixo.append(novapeca)
        
    }
    
}

public func encherCalcado(){
    
    let nomes:[String] = ["Sapato Preto", "Havaiana", "Sapato Branco", "Papete Preta", "Chinelo Branco", "Meia Azul", "All Star Amarelo"]
    
    for n in 0..<7 {
        
        let novapeca: Peca = Peca(foto:UIImage(imageLiteralResourceName: "calcado"+String(n+1)), nome: nomes[n])
        
        calcado.append(novapeca)
        
    }
    
}
