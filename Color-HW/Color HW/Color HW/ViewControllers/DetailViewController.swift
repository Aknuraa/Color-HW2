//
//  DetailViewController.swift
//  Color HW
//
//  Created by Акнур on 8/1/20.
//  Copyright © 2020 Акнур. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
                
    @IBOutlet weak var collectionView: UICollectionView!
    
    var returnDelegate: ReturnColorDelegate?
    
    var colors = [
        ColorModel(name: "black", color: .black),
        ColorModel(name: "darkGray", color: .darkGray),
        ColorModel(name: "lightGray", color: .lightGray),
        ColorModel(name: "gray", color: .gray),
        ColorModel(name: "red", color: .red),
        ColorModel(name: "green", color: .green),
        ColorModel(name: "blue", color: .blue),
        ColorModel(name: "yellow", color: .yellow),
        ColorModel(name: "magenta", color: .magenta),
        ColorModel(name: "orange", color: .orange),
        ColorModel(name: "purple", color: .purple),
        ColorModel(name: "brown", color: .brown),
        
    ]
     
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.register(MenuCollectionViewCell.self, forCellWithReuseIdentifier: "menuCell")
    }
    
    
}

extension DetailViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return colors.count
    }

    func collectionView(_ collectionView : UICollectionView , cellForItemAt indexPath : IndexPath) -> UICollectionViewCell{
        guard let itemCell = collectionView.dequeueReusableCell(withReuseIdentifier: "menuCell", for: indexPath) as? MenuCollectionViewCell else {
            return UICollectionViewCell()
        }
        itemCell.backgroundColor = colors[indexPath.row].color
        return itemCell
        
    }

    func collectionView (_ collectionView : UICollectionView, didSelectItemAt indexPath : IndexPath) {
        returnDelegate?.returnColorModel(colors[indexPath.item])
    }
}

extension UIImage {
    static func from(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor)
        context!.fill(rect)
        let img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return img!
    }
}
