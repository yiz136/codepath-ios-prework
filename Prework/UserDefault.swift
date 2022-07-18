//
//  UserDefault.swift
//  Prework
//
//  Created by Yifei on 7/16/22.
//

import Foundation

let DEFAULT_TIP_PERCENTAGES = [0.15, 0.18, 0.2]

class UserDefault: NSObject {
    
    private static func getUserDefaults() -> UserDefaults {
        return UserDefaults.standard
    }
    
    static func getTipPcts() -> Array<Double> {
        let defaults = UserDefault.getUserDefaults()
        let tipPcts = defaults.object(forKey:)("tipPcts")
        if (tipPcts == nil) {
            return DEFAULT_TIP_PERCENTAGES
        } else {
            return (tipPcts as! NSArray) as! Array<Double>
        }
    }
    
    static func setTipPtcs(options: Array<Double>) {
        let defaults = UserDefault.getUserDefaults()
        defaults.set(options, forKey: "tipPcts")
        defaults.synchronize()
    }
    
    static func getIsDark() -> Bool {
        let defaults = UserDefault.getUserDefaults()
        return defaults.bool(forKey:)("dark")
    }
    
    static func setIsDark(isDark: Bool) {
        let defaults = UserDefault.getUserDefaults()
        defaults.set(isDark, forKey: "dark")
        defaults.synchronize()
    }
    
}
