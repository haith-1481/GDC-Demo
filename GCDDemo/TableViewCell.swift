//
//  TableViewCell.swift
//  GCDDemo
//
//  Created by trinh.hoang.hai on 4/2/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import UIKit
import Alamofire

class TableViewCell: UITableViewCell {

    var url = ""

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var progressLabel: UILabel!
    @IBOutlet weak var downloadButton: UIButton!

    @IBAction func download(_ sender: Any) {
        downloadButton.isEnabled = false
        progressLabel.text = "Downloading.."
        DispatchQueue.global(qos: .userInitiated).async { [weak self] in
            guard let downloadURL = self?.url else { return }
            self?.startDownload(audioUrl: downloadURL)
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func startDownload(audioUrl:String) -> Void {
        DownloadManager.shared.semaphore.wait()
        let destination: DownloadRequest.DownloadFileDestination = { _, _ in
            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
            documentsURL.appendPathComponent("\(self.url).mp4")
            return (documentsURL, [.removePreviousFile])
        }

        Alamofire.download(audioUrl, to:destination)
            .downloadProgress { (progress) in
                print(progress.fractionCompleted)
                let progressT = (Int)(progress.fractionCompleted * 100)
                self.progressLabel.text = "\(progressT)%"
            }
            .responseData { (data) in
                print("complete")
                DownloadManager.shared.semaphore.signal()
                self.progressLabel.text = "Completed!"
                self.downloadButton.isEnabled = true
        }
    }
}
