//
//  MovieViewController.swift
//  PruebaTécnicaDxC
//
//  Created by Albert on 26/5/21.
//

import UIKit


class MovieViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private var viewModel = MovieViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.fetchMoviesData{ [weak self] in
            self?.tableView.dataSource = self
            self?.tableView.reloadData()
        }
    }
}



// MARK: - TableView
extension MovieViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MovieTableViewCell

        let movie = viewModel.cellForRowAt(indexPath: indexPath)
        
        
        return cell
    }
}
