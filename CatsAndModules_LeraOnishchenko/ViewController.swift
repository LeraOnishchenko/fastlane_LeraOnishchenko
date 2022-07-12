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
//        let userInfo = [
//       NSLocalizedDescriptionKey: NSLocalizedString("The request failed.", comment: ""),
//        NSLocalizedFailureReasonErrorKey: NSLocalizedString("The response returned a 404.", comment: ""),
//        NSLocalizedRecoverySuggestionErrorKey: NSLocalizedString("Does this page exist?", comment: ""),
//        "ProductID": "123456",
//        "View": "MainView"]
//        let error = NSError.init(domain: NSCocoaErrorDomain,
//        code: -1001,
//        userInfo: userInfo)
        // caution: quite expensive, requires synchronous disk write
       // Crashlytics.crashlytics().record(error: error)
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

