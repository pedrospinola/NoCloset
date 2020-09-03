//
//  ViewController.swift
//  NoCloset
//
//  Created by Pedro Henrique Spínola de Assis on 31/08/20.
//  Copyright © 2020 Pedro Spínola. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

// GuardaRoupa
var acessorios:[Peca] = []
var parteCima:[Peca] = []
var parteBaixo:[Peca] = []
var calcado:[Peca] = []

// LookMontado
var lookSelecionado:[Look] = []

// LooksSeparadosEmTipos
var lookDeSair: [Look] = [Look(pecas: [acessorios[3],parteCima[3],parteBaixo[3],calcado[2]], nome: "Basiquinho"),Look(pecas: [acessorios[1],parteCima[2],parteBaixo[1],calcado[3]], nome: "Soft"), Look(pecas: [acessorios[4],parteCima[2],parteBaixo[1],calcado[1]], nome: "Rolezinho")]
var lookDeFaculdade: [Look] = [Look(pecas: [acessorios[2],parteCima[5],parteBaixo[4],calcado[4]], nome: "Aula paia"),Look(pecas: [acessorios[4],parteCima[3],parteBaixo[2],calcado[1]], nome: "Crush"), Look(pecas: [acessorios[5],parteCima[3],parteBaixo[2],calcado[1]], nome: "De boa")]

// ContadorDeLooksMontados
var contador = 0

// variável para armazenar o botão clicado
var testButton = 0

// ContadorDeTiposDeLooksSalvos
var contadorTiposDeLook = 0

// GuardaRoupaSeparado
var opcao: [[Peca]] = [acessorios, parteCima, parteBaixo, calcado]


//ViewController onde estarão agrupados os looks salvos

class TelaSeusLooks: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, CLLocationManagerDelegate{
    
    // API do Tempo
    
    //Variaveis
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var imageTempo: UIImageView!
    @IBOutlet weak var labelTemp: UILabel!
    @IBOutlet weak var labelCidade: UILabel!
    @IBOutlet weak var labelStatus: UILabel!
    @IBOutlet weak var labelDicas: UILabel!
    
    var locationManager:CLLocationManager!
    
    // O resto está na extensão API
    
    //
    
    var enviaDado = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == collectionViewLookdeSair{
            return lookDeSair.count
        } else if collectionView == collectionViewLookDeFaculdade{
            return lookDeFaculdade.count
        }
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewLooksCell", for: indexPath) as! CollectionViewLooksCell
        
        if collectionView == collectionViewLookdeSair{
            
            //analisar se é melhor colocar um count -1 ou indexpath.row
            cell.looksImage.image = lookDeSair[indexPath.row].pecas[0].foto
            cell.looksName.text = lookDeSair[indexPath.row].nome
            
        }else if collectionView == collectionViewLookDeFaculdade{
            
            cell.looksImage.image = lookDeFaculdade[indexPath.row].pecas[0].foto
            cell.looksName.text = lookDeFaculdade[indexPath.row].nome
            
        }
        
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        enviaDado = indexPath.row
//
//    }
    
    
    @IBOutlet weak var collectionViewLookdeSair: UICollectionView!
    @IBOutlet weak var collectionViewLookDeFaculdade: UICollectionView!
    
    @IBAction func buttonLookSair(_ sender: Any) {
        
        testButton = 1
    }
    
    @IBAction func buttonLookFalculdade(_ sender: Any) {
        
        testButton = 2
    }
    
    
    //  sobreescrevendo a função touchesBegan para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var climaView: UIView!
    
    override func viewWillAppear(_ animated: Bool) {
        collectionViewLookDeFaculdade.reloadData()
        collectionViewLookdeSair.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "lookDeSair"{
            
            let nextVC = segue.destination as! TelaVerLook
            
            let indexPaths: NSArray = collectionViewLookdeSair.indexPathsForSelectedItems! as NSArray
            let indexPath: NSIndexPath = indexPaths[0] as! NSIndexPath
            
            nextVC.linha = indexPath.row
            nextVC.teste = 0
            nextVC.pegaNomeDoLook = lookDeSair[indexPath.row].nome
            
        }else if segue.identifier == "lookDeFaculdade"{
            
            let nextVC = segue.destination as! TelaVerLook
            
            let indexPaths: NSArray = collectionViewLookDeFaculdade.indexPathsForSelectedItems! as NSArray
            let indexPath: NSIndexPath = indexPaths[0] as! NSIndexPath
            
            nextVC.linha = indexPath.row
            nextVC.teste = 1
            nextVC.pegaNomeDoLook = lookDeFaculdade[indexPath.row].nome
            
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        encherAcessorios()
        encherCalcado()
        encherParteCima()
        encherParteBaixo()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        climaView.layer.cornerRadius = 30
        
        collectionViewLookdeSair.delegate = self
        collectionViewLookdeSair.dataSource = self
        collectionViewLookDeFaculdade.delegate = self
        collectionViewLookDeFaculdade.dataSource = self
        
        localizacao()
        
    }
    
}

//ViewController onde o usuário vai poder visualizar um look salvo
class TelaVerLook: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    var pegaNomeDoLook = "nome"
    
    @IBOutlet weak var nomeDoLook: UILabel!
    @IBOutlet weak var collectionViewVerLook: UICollectionView!
    
    var linha = 0
    var teste = 0
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if teste == 0{
            return lookDeSair[linha].pecas.count
        } else if teste == 1 {
            return lookDeFaculdade[linha].pecas.count
        }
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionViewVerLookCell", for: indexPath) as! CollectionViewVerLookCell
        
        if teste == 0{
            
            cell.nomePecaLook.text = lookDeSair[linha].pecas[indexPath.row].nome
            cell.imagemPecaLook.image = lookDeSair[linha].pecas[indexPath.row].foto
            
        } else if teste == 1 {
            
            cell.nomePecaLook.text = lookDeFaculdade[linha].pecas[indexPath.row].nome
            cell.imagemPecaLook.image = lookDeFaculdade[linha].pecas[indexPath.row].foto
        
        }
        return cell
    }
    
    override func viewWillAppear(_ animated: Bool) {
        nomeDoLook.text = pegaNomeDoLook
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = false
        
        collectionViewVerLook.delegate = self
        collectionViewVerLook.dataSource = self
        
    }
    
    
}

//ViewController onde o usuário vai poder salvar um look novo

class TelaNovoLook: UIViewController, UITableViewDataSource, UITableViewDelegate, UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return opcao[self.section].count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewNovoLookCell", for: indexPath) as! CollectionViewNovoLookCell
        
        cell.imagemPeçaDoLook.image = opcao[self.section][indexPath.row].foto
        
        cell.imagemPeçaDoLook.layer.cornerRadius = 30
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return opcao.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewNovoLookCell", for: indexPath) as! TableViewNovoLookCell
        
        self.section = indexPath.row
        cell.sessionNewLook.text = "Acessório"
        cell.collectionViewNovoLook.delegate = self
        cell.collectionViewNovoLook.dataSource = self
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 330
    }
    
    
    //  sobreescrevendo a função touchesBegan para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    @IBOutlet weak var TableViewNovoLook: UITableView!
    
    var section = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        
        TableViewNovoLook.delegate = self
        TableViewNovoLook.dataSource = self
        
    }
    
    
}


class TelaNovoLook2: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var nomeLookTextField: UITextField!
    
    @IBOutlet weak var collectionViewNovoLook2: UICollectionView!
    
    
    @IBAction func buttonSalvaNovoLook(_ sender: Any) {
        
        adicionaLooks()
        
    }
    
    var titulos = ["Acessórios", "Parte de Cima", "Parte de Baixo", "Calçados"]
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let sectionCell = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "collectionViewLooksReusableView", for: indexPath) as! CollectionViewLooksReusableView
        
        
        sectionCell.tituloSection = titulos[indexPath.section]
        
        //        sectionCell.labelSection.text = titulos[indexPath.section]
        
        return sectionCell
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return opcao.count
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        for i in 0...opcao.count-2{
            if section == i {
                return opcao[i].count
            }
        } //rever esssa parte
        return opcao.last!.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewNovoLook2Cell", for: indexPath) as! CollectionViewNovoLook2Cell
        
        cell.imagemNovoLook2.image = opcao[indexPath.section][indexPath.row].foto
        cell.linha = indexPath.section
        cell.coluna = indexPath.row
        
        
        return cell
        
    }
    
    //  sobreescrevendo a função touchesBegan para esconder o teclado quando o usuário tocar na tela
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        navigationController?.navigationBar.prefersLargeTitles = true
        
        collectionViewNovoLook2.delegate = self
        collectionViewNovoLook2.dataSource = self
        
    }
    
    func adicionaLooks(){
        var novoArrayPeca: [Peca] = []
        
        for i in 0...opcao.count-1{
            for j in 0...opcao[i].count-1{
                if opcao[i][j].pertence == true{
                    
                    novoArrayPeca.append(opcao[i][j])
                    opcao[i][j].pertence = false
                }
                
            }
        }
        
        // salvar o nome do look aqui nessa linha
        
        lookSelecionado.append(Look(pecas: novoArrayPeca, nome: nomeLookTextField.text ?? "nome"))
        
        if testButton == 1{
            lookDeSair.append(lookSelecionado[contador])
        }else if testButton == 2{
            lookDeFaculdade.append(lookSelecionado[contador])
        }
        
        
        print(contador)
        print(lookSelecionado[contador].nome)
        print(lookSelecionado[contador].pecas)
        
        contador = contador + 1
        
        
    }
}
