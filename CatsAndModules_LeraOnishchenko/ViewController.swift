//
//  ViewController.swift
//  CatsAndModules_LeraOnishchenko
//
//  Created by lera on 17.06.2022.
//

import UIKit
import Networking
import FirebasePerformance
import FirebaseCrashlytics

class ViewController: UIViewController {

    @IBAction func CrashApp(_ sender: Any) {
     fatalError("CrashButton was presed")
    }
    @IBOutlet weak var CrashButton: UIButton!
    @IBOutlet weak var catImage: UIImageView!
    var Cat: Cat? = nil
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = Cat?.url
        // url = nil
        let imageData = try? Data(contentsOf: url!)
        let image = UIImage(data: imageData!)
        self.catImage.image = image
    }
}

