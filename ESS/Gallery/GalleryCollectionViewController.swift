//
//  GalleryCollectionViewController.swift
//  ESS
//
//  Created by wido technologies on 27/05/22.
//

import UIKit



class GalleryCollectionViewController: UICollectionViewController {

  
    
    private var gallery : [GalleryModel] = [ GalleryModel(image: "wido", name: "WIDO"),
                                             
                                             GalleryModel(image: "wido", name: "WIDO"),
    GalleryModel(image: "widocabs", name: "WIDOCABS"),
    GalleryModel(image: "Hiring!", name: "HIRING!!"),
    GalleryModel(image: "Menu-1", name: "AppOutlet"),
    GalleryModel(image: "Vizag", name: "HeadOfficeLocation(Vizag)") ,
    GalleryModel(image: "Vijayawada", name: "Franchise1(Vijayawada)"),
    GalleryModel(image: "Guntur", name: "Franchise2(Guntur)")]
    
    
   
    
    @IBOutlet weak var sideMenuBtn: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.tintColor = .white

        sideMenuBtn.target = revealViewController()
        sideMenuBtn.action = #selector(revealViewController()?.revealSideMenu)
        
    }


    override func numberOfSections(in collectionView: UICollectionView) -> Int {
            return 1
        }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            
            return gallery.count
        }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dataCell", for: indexPath) as! GalleryCollectionViewCell
        
            
            let city = gallery[indexPath.row]
            cell.imageView.image = UIImage(named: city.image)
            cell.nameLabel.text = city.name
        
            return cell
        }
}


