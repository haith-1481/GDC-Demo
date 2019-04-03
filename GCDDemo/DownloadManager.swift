//
//  DownloadManager.swift
//  GCDDemo
//
//  Created by trinh.hoang.hai on 4/2/19.
//  Copyright © 2019 trinh.hoang.hai. All rights reserved.
//

import Foundation
import Alamofire

class DownloadManager {
    static let shared = DownloadManager()

    let semaphore = DispatchSemaphore(value: 3)
}
