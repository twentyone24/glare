//
//  TorchService.swift
//  glare
//
//  Created by NAVEEN MADHAN on 1/19/22.
//

import Foundation
import AVFoundation

func toggleTorch (on: Bool) {
    guard let device = AVCaptureDevice.default(for: .video) else { return }
    if device.hasTorch {
        do{
            try device.lockForConfiguration()
            if on == true {
                device.torchMode = .on
            } else {
                device.torchMode = . off
            }
        } catch {
            print("Torch could not be used now!")
        }
    }
}
