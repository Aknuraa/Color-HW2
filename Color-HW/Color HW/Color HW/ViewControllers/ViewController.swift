//
//  ViewController.swift
//  Color HW
//
//  Created by Акнур on 8/1/20.
//  Copyright © 2020 Акнур. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var colors: [ColorModel] = []
     
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "mainCell")
    }

    override func prepare(for segue : UIStoryboardSegue, sender : Any?){
        guard segue.identifier == "PushDetailViewController", let vc = segue.destination as? DetailViewController else { return }
        vc.returnDelegate = self
    }
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        let count = colors.count
        return count < 5 ? count : 5
    }

    func collectionView(_ collectionView : UICollectionView , cellForItemAt indexPath : IndexPath) -> UICollectionViewCell{
        guard let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "mainCell", for: indexPath) as? MainCollectionViewCell else {
            return UICollectionViewCell()
        }
        itemCell.backgroundColor = colors[indexPath.row].color
        return itemCell
        
    }

    func collectionView (_ collectionView : UICollectionView, didSelectItemAt indexPath : IndexPath) {
        let menu = colors[indexPath.row]
        colorView.backgroundColor = menu.color
        label.text = menu.name
    }
}

extension ViewController: ReturnColorDelegate {
    func returnColorModel(_ colorModel: ColorModel) {
        self.navigationController?.popToRootViewController(animated: true)
        colors.insert(colorModel, at: 0)
        colorView.backgroundColor = colorModel.color
        label.text = colorModel.name
        collectionView.reloadData()
    }
}
