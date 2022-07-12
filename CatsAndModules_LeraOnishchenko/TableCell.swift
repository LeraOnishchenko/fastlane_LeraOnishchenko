//
//  TableCell.swift
//  CatsAndModules_LeraOnishchenko
//
//  Created by lera on 23.06.2022.
//

import UIKit
import Networking
import FirebasePerformance

class TableCell: UITableViewCell {

    @IBOutlet private weak var cat: UIImageView!
    @IBOutlet private weak var catName: UILabel!
    func config(from data: Cat){
        let trace = Performance.startTrace(name: "Cats picture download")
        let url = data.url
        trace?.stop()
        let imageData = try? Data(contentsOf: url!)
        let image = UIImage(data: imageData!)
        self.cat.image = image
        self.catName.text = "kitten"
    }
}
