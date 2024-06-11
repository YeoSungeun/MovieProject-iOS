//
//  TrendViewController.swift
//  MovieProject
//
//  Created by 여성은 on 6/11/24.
//

import UIKit
import Alamofire



class TrendViewController: UIViewController {
    
    var tableView = UITableView()
    
    static var genreList: [Int:String] = [:]
    var trendList: [TrendResult] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        callRequestGenre()
        callRequest()
        configureHierarchy()
        configureLayout()
        configureUI()
        configureTableView()
    }
    
    func configureHierarchy() {
        view.addSubview(tableView)
    }
    func configureLayout() {
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    func configureUI() {
        view.backgroundColor = .white
        tableView.backgroundColor = .white
    }
    
    func callRequestGenre() {
        let url = "https://api.themoviedb.org/3/genre/movie/list?api_key=\(APIKey.tmdbKey)"
        
        AF.request(url).responseDecodable(of: Genres.self) { response in
            switch response.result {
            case .success(let value):
                for item in value.genres {
                    TrendViewController.genreList.updateValue(item.name, forKey: item.id)
                }
                print(TrendViewController.genreList)
            case .failure(let error):
                print(error)
            }
        }
    }

    func callRequest() {
        let mediaType = MediaType.movie.rawValue
        let time_window = time_window.day.rawValue
        let url = "\(APIURL.trendURL)/\(mediaType)/\(time_window)?api_key=\(APIKey.tmdbKey)"
        
        AF.request(url, method: .get).responseDecodable(of: Trend.self) { response in
            switch response.result {
            case .success(let value):
                self.trendList = value.results
                self.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}

extension TrendViewController: UITableViewDelegate, UITableViewDataSource {
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TrendTableViewCell.self, forCellReuseIdentifier: TrendTableViewCell.identifier)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return trendList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TrendTableViewCell.identifier, for: indexPath) as! TrendTableViewCell
        
        cell.configureCell(data: trendList[indexPath.row])
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 440
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = CreditViewController()
        vc.data = trendList[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
