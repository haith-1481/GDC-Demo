//
//  ViewController.swift
//  GCDDemo
//
//  Created by trinh.hoang.hai on 4/1/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!

    let videoUrlArray = ["https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
                         "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4",
                         "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_5mb.mp4",
                         "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4",
                         "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
                         "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",
                         "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_2mb.mp4",
                         "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_5mb.mp4",
                         "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_10mb.mp4",
                         "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_20mb.mp4",
                         "https://sample-videos.com/video123/mp4/720/big_buck_bunny_720p_1mb.mp4",]

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoUrlArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as? TableViewCell else {
            return UITableViewCell()
        }
        cell.url = videoUrlArray[indexPath.row]
        cell.nameLabel.text = "File No. \(indexPath.row)"
        return cell
    }
}
