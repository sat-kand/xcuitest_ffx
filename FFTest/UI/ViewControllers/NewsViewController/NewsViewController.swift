//
//  ViewController.swift
//  FFTest
//

import UIKit

class NewsViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let newsLoadingSpinner: UIActivityIndicatorView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.medium)
    
    let viewModel: NewsViewModel = NewsViewModel(apiRequestManager: FFTApiRequestManager(timeout: 5))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Style TableView
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.tableFooterView = UIView(frame: .zero)
        
        // Style/Setup loading spinner
        self.setupLoadingSpinner()
        
        // Call api to get view content
        self.getNews()
    }
    
    // Function to setup tableview loading spinner
    private func setupLoadingSpinner() {
        self.newsLoadingSpinner.hidesWhenStopped = true
        self.tableView.backgroundView = self.newsLoadingSpinner
    }
    
    // Function to call api and get tableview content
    private func getNews() {
        self.newsLoadingSpinner.startAnimating()
        self.viewModel.getNews { [weak self] (error) in
            if let _ = error {
                self?.presentAlert(title: "Oops", message: "Failed to load news, please try again.")
            } else {
                self?.tableView.reloadData()
            }
            self?.newsLoadingSpinner.stopAnimating()
        }
    }
    
    // Function to present pop-up alert, this should be moved to ulti class but that's overkill for this assignment
    private func presentAlert(title: String, message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let reloadAction = UIAlertAction(title: "Reload", style: .default) { (action:UIAlertAction) in
            self.getNews()
        }
        let cancelAction = UIAlertAction.init(title: "Cancel", style: .default, handler: nil)
        
        alertController.addAction(reloadAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}

// MARK: - UITableViewDataSource, UITableViewDelegate
extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.newsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: self.viewModel.newsTableViewCellIdentifier, for: indexPath) as! FFTNewsTableViewCell
        cell.setupContent(news: self.viewModel.newsArray[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        if let url = URL(string: self.viewModel.newsArray[indexPath.row].url) {
            self.performSegue(withIdentifier: "segueToWebView", sender: url)
        }
        
    }
}

// MARK: - View Transition
extension NewsViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueToWebView", let vc = segue.destination as? WebViewController, let url = sender as? URL {
            vc.url = url
        }
    }
}
