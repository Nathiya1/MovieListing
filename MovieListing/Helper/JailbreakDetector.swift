//
//  JailbreakDetector.swift
//  MovieListing
//
//  Created by NATHIYA on 15/07/25.
//

import Foundation
import UIKit

public class JailbreakDetector {
    
    static func isJailbroken() -> Bool {
    #if targetEnvironment(simulator)
            return false
    #else
            let paths = [
                "/Applications/Cydia.app",
                "/Library/MobileSubstrate/MobileSubstrate.dylib",
                "/bin/bash",
                "/usr/sbin/sshd",
                "/etc/apt",
                "/private/var/lib/apt/",
                "/usr/bin/ssh"
            ]

            for path in paths {
                if FileManager.default.fileExists(atPath: path) {
                    return true
                }
            }

            let testPath = "/private/" + UUID().uuidString
            do {
                try "Test".write(toFile: testPath, atomically: true, encoding: .utf8)
                return true
            } catch {}

            if UIApplication.shared.canOpenURL(URL(string: "cydia://")!) {
                return true
            }

            return false
    #endif
        }
   
}
