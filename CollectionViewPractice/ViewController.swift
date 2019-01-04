//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by iOS Training on 1/4/19.
//  Copyright © 2019 iOS Training. All rights reserved.
//

import UIKit
import Kingfisher

struct StudentDataModel {
    var name: String = ""
    var imageURL: String = ""
}

let NO_COLS = 3
let SPACE_ITEMS = 0

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionViewStudents: UICollectionView!
    
    var arrayStudentNames = [StudentDataModel]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionViewStudents.dataSource = self
        collectionViewStudents.delegate = self
       
        for i in 1...100 {
            
            let student = StudentDataModel(name: "Student Name - \(i)", imageURL: "https://randomuser.me/api/portraits/men/\(i).jpg")
            arrayStudentNames.append(student)
        }
        
        collectionViewStudents.reloadData()
        
      
    }
    
}

extension ViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayStudentNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let studentCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Student_coll_cell" , for: indexPath) as? StudentViewItemCell {
            
             let studentModel = arrayStudentNames[indexPath.row]
            
            studentCell.lblStudentName.text = studentModel.name
            studentCell.imgViewStudent.kf.setImage(with: URL.init(string: studentModel.imageURL))
            return studentCell
        }
        return UICollectionViewCell()
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let widthCalculated = Float((Int(self.view.frame.size.width) - (3 * SPACE_ITEMS)) / NO_COLS)
        return CGSize(width: CGFloat.init(widthCalculated), height: CGFloat.init(widthCalculated * Float(1.25)))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.init(SPACE_ITEMS)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat.init(SPACE_ITEMS)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
       return UIEdgeInsets.init(top: CGFloat.init(SPACE_ITEMS), left: CGFloat.init(SPACE_ITEMS), bottom: CGFloat.init(SPACE_ITEMS), right: CGFloat.init(SPACE_ITEMS))
    }
   
}



extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
}



