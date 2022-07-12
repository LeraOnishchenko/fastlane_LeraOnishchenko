//
//  TableViewController.swift
//  CatsAndModules_LeraOnishchenko
//
//  Created by lera on 17.06.2022.
//dff

import UIKit
import Networking
import FirebasePerformance
import FirebaseCrashlytics

class TableViewController: UIViewController, UITableViewDelegate {
    
    @IBOutlet private weak var table: UITableView!
    
    var Cats: [Cat] = []
    var after = ""
    let networking = Networking()
    override func viewDidLoad() {
        super.viewDidLoad()
        table.accessibilityIdentifier = "myUniqueTableViewIdentifier"
        let trace = Performance.startTrace(name: "Cats from Api")
        Cats = networking.gaveImage()
        trace?.stop()
        if isFirstLaunch() {
            let alert = UIAlertController(title: "UIAlertController", message: "App wants to use crashlytics. Allow?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Allow", style: UIAlertAction.Style.default, handler: {_ in Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(true)}))
            alert.addAction(UIAlertAction(title: "Do not allow", style: UIAlertAction.Style.cancel, handler: {_ in Crashlytics.crashlytics().setCrashlyticsCollectionEnabled(false)}))
            self.present(alert, animated: true, completion: nil)
        }
        
        self.table.dataSource = self
        table.delegate = self
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? ViewController,
            let index = table.indexPathForSelectedRow?.row
        {
            destination.Cat = Cats[index]
        }
    }
    private func reloadPosts(){
        after = (Cats.last?.id)!
        self.Cats += networking.gaveImage()
    }
    func isFirstLaunch() -> Bool {

        if (!UserDefaults.standard.bool(forKey: "launched_before")) {
            UserDefaults.standard.set(true, forKey: "launched_before")
            return true
        }
        return false
    }
}

extension TableViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.Cats.count
}
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableCell.self), for: indexPath) as! TableCell
    cell.config(from: Cats[indexPath.row])
        Crashlytics.crashlytics().setCustomValue(indexPath.row, forKey: "last tape row")
        cell.accessibilityIdentifier = "myCell_\(indexPath.row)"
    return cell
}

    
func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row == Cats.count - 2 {
            self.reloadPosts()
                    DispatchQueue.main.async {
                        self.table.reloadData()
                    }
            }
        }
}
