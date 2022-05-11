//
//  Number+Extensions.swift
//  OTTPlatform
//
//  Created by Daksh on 24/02/22.
//

import Foundation
import CoreMedia

extension Double {
    
    var toValidValue: Self { return (self.isNaN || self.isInfinite) ? 0 : self }

    var milesFromMeters : Double {
        let miles = self / 1609.344
        return miles
    }
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(format: "%.1f", self)
    }
    
    var toSecondsFromMilliSec: Double {
        return self / 1000.0
    }
    
    var toSecondsFromMin: Double {
        return self * 60.0
    }
    
    var toMilliseconds: Double {
        return self * 1000.0
    }
    
    func roundTo(places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func toTime(_ zeroFormattingBehavior: DateComponentsFormatter.ZeroFormattingBehavior = .pad, _ allowedUnits: NSCalendar.Unit = [.hour, .minute, .second], _ unitsStyle: DateComponentsFormatter.UnitsStyle = .positional) -> String? {
        let dcFormatter = DateComponentsFormatter()
        dcFormatter.zeroFormattingBehavior = zeroFormattingBehavior
        dcFormatter.allowedUnits = allowedUnits
        dcFormatter.unitsStyle = unitsStyle
        
        let strTime = dcFormatter.string(from: self)
        return strTime
    }
    
    var toOrdinalValue: String? {
        let formatter = NumberFormatter()
        formatter.numberStyle = .ordinal
        return formatter.string(for: self)
    }
    
    var toCMTime: CMTime {
        return CMTime(seconds: self, preferredTimescale: CMTimeScale(NSEC_PER_SEC))
    }
    
    var toCeil: Double? {
        return (self.isNaN || self.isInfinite) ? nil : ceil(self)
    }
    
    var toTimeString : String? {
        let time = (self.isNaN || self.isInfinite) ? 0.0 :  self
        let dcFormatter = DateComponentsFormatter()
        dcFormatter.zeroFormattingBehavior = .pad
        dcFormatter.unitsStyle = .positional
        
        if time < 3600 {
            dcFormatter.allowedUnits = [.minute, .second]
        } else {
            dcFormatter.allowedUnits = [.hour, .minute, .second]
        }
        
        let strDuration = dcFormatter.string(from: time)
        return strDuration
    }
    
    var toInt: Int? {
        return (self.isNaN || self.isInfinite) ? nil : Int(self)
    }
    
    var toIntOrDefault: Int {
        return self.toInt ?? 0
    }
    
}

extension Int {
    
    var toSecondsFromMin: Int {
        return Double(self).toSecondsFromMin.toIntOrDefault
    }
    
    var toOrdinalValue: String? {
        return Double(self).toOrdinalValue
    }
    
    func between(_ value: Int, add: Int = 5) -> Bool {
        return value...(value + add) ~= self
    }
    
    func between(from: Int, to: Int) -> Bool {
        return (from > to) ? false : from...to ~= self
    }
    
    func leadingZeros(_ leadingZeros: Int = 0) -> String {
        return String(format: "%0\(leadingZeros)ld", self)
    }
    
    ///Time Formatter
    
    func toTime(_ zeroFormattingBehavior: DateComponentsFormatter.ZeroFormattingBehavior = .pad, _ allowedUnits: NSCalendar.Unit = [.hour, .minute, .second], _ unitsStyle: DateComponentsFormatter.UnitsStyle = .positional) -> String? {
        return Double(self).toTime(zeroFormattingBehavior, allowedUnits, unitsStyle)
    }
    
    var secondsToDDHHMMSS: String? {
        if (self > 24 * 60 * 60) {
            return self.toDDHH
        } else {
            return Double(self).toTimeString
        }
    }
    
    var toDDHH: String? {
        var hours = self / 3600
        let days = hours / 24
        
        var time = ""
        if (days > 0) {
            hours = hours - (days * 24)
            if (days > 1) {
                time = "\(days) day(s) \(hours) hours"
            } else {
                time = "\(days) day \(hours) hours"
            }
        } else {
            time = "\(hours) hour"
        }
        return time
    }
    
    func toSeconds(from: Calendar.Component = .day) -> Int {
        switch from {
        case .year:
            return self * 60 * 60 * 24 * 30 * 12
        case .month:
            return self * 60 * 60 * 24 * 30
        case .day:
            return self * 60 * 60 * 24
        case .hour:
            return self * 60 * 60
        case .minute:
            return self * 60
        default:
            return self
        }
    }
    
    var toCent: Self {
        self * 100
    }
}
