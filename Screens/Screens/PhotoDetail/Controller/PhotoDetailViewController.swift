//
//  PhotoDetailViewController.swift
//  Flickr Client App
//
//  Created by SAFA HELVACI on 3.10.2022.
//

import UIKit

class PhotoDetailViewController: UIViewController {

    var photo: Photo?
    
    
    
    @IBOutlet weak var ImageView: UIImageView!
    

    @IBOutlet weak var ownerImageView: UIImageView!
    
    @IBOutlet weak var ownerNameLabel: UILabel!
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Photo Detail"
        ImageView.backgroundColor = .gray
        ownerImageView.backgroundColor = .darkGray
        ownerNameLabel.text = "Owner Name"
        descriptionLabel.text = "Description Label Description Label Description Label Description Label Description Label"
        
        ownerNameLabel.text = photo?.ownername
        
        NetworkManager.shared.fetchImage(with: photo?.buddyIconURL) { data in
            self.ownerImageView.image = UIImage(data: data)
        }
            
            NetworkManager.shared.fetchImage(with: photo?.urlZ) { data in
                self.ImageView.image = UIImage(data: data)
            }
            
            
           title = photo?.title
            
        
        descriptionLabel.text = photo?.photoDescription?.content
    }
}
