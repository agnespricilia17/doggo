//
//  VideoHelper.swift
//  doggo
//
//  Created by agnes pricilia on 20/08/19.
//  Copyright © 2019 agnes pricilia. All rights reserved.
//

import Foundation

import AVKit
import AVFoundation

class VideoHelper {
    
    func getVideoPath(videoName: String, videoFormat: String) -> URL? {
        guard let videoPath = Bundle.main.path(forResource:videoName , ofType: videoFormat)
            else {
                print("Error : Could not locate videopath for \(videoName).\(videoFormat) ")
                return nil
        }
        return URL(fileURLWithPath: videoPath)
    }
    
    func getVideoPlayer(videoName: String, videoFormat: String) -> AVPlayerViewController? {
        guard let videoPath = getVideoPath(videoName: videoName, videoFormat: videoFormat)
            else {
                return nil
        }
        
        let videoPlayer = AVPlayer(url: videoPath)
        
        let videoPlayerController = AVPlayerViewController()
        videoPlayerController.player = videoPlayer
        
        return videoPlayerController
    }
    
    func getThumbnail(videoName: String, videoFormat: String) -> UIImage? {
        do {
            guard let videoPath = getVideoPath(videoName: videoName, videoFormat: videoFormat)
                else {
                    return nil
            }
            
            let asset = AVURLAsset(url: videoPath, options: nil)
            let imageGenerator = AVAssetImageGenerator(asset: asset)
            imageGenerator.appliesPreferredTrackTransform = true
            
            let cgImage = try imageGenerator.copyCGImage(at: CMTimeMake(value: 0, timescale: 1), actualTime: nil)
            let thumbnail = UIImage(cgImage: cgImage)
            return thumbnail
        }
        catch let error {
            print("Error : \(error.localizedDescription)")
            return nil
        }
        
        
    }
}
