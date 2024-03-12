
import Foundation

struct DeviceModel: Encodable {
    let isVPNActive: Bool
    let deviceName: String
    let deviceModel: String
    let uniqueID: String
    let networkAddresses: [String]
    let carriers: [String]
    let iosVersion: String
    let language: String
    let timeZone: String
    let isCharging: Bool
    let memoryInfo: String
    let isScreenshotActive: Bool
    let isScreencastAcitve: Bool
    let installedApps: [String: Bool]
    let batteryLevel: Double
    let inputLanguages: [String]
    let region: String
    let usesMetricSystem: Bool
    let isFullyCharged: Bool
    
    init(isVPNActive: Bool,
         deviceName: String,
         deviceModel: String,
         uniqueID: String,
         networkAddresses: [String],
         carriers: [String],
         iosVersion: String,
         language: String,
         timeZone: String,
         isCharging: Bool,
         memoryInfo: String,
         isScreenshotActive: Bool = false,
         isScreencastAcitve: Bool = false,
         installedApps: [String : Bool],
         batteryLevel: Double,
         inputLanguages: [String],
         region: String,
         usesMetricSystem: Bool,
         isFullyCharged: Bool) {
        self.isVPNActive = isVPNActive
        self.deviceName = deviceName
        self.deviceModel = deviceModel
        self.uniqueID = uniqueID
        self.networkAddresses = networkAddresses
        self.carriers = carriers
        self.iosVersion = iosVersion
        self.language = language
        self.timeZone = timeZone
        self.isCharging = isCharging
        self.memoryInfo = memoryInfo
        self.isScreenshotActive = isScreenshotActive
        self.isScreencastAcitve = isScreencastAcitve
        self.installedApps = installedApps
        self.batteryLevel = batteryLevel
        self.inputLanguages = inputLanguages
        self.region = region
        self.usesMetricSystem = usesMetricSystem
        self.isFullyCharged = isFullyCharged
    }
    
    enum CodingKeys: String, CodingKey {
        case isVPNActive = "vivisWork"
        case deviceName = "gfdokPS"
        case deviceModel = "gdpsjPjg"
        case uniqueID = "poguaKFP"
        case networkAddresses = "gpaMFOfa"
        case carriers = "gciOFm"
        case iosVersion = "bcpJFs"
        case language = "GOmblx"
        case timeZone = "G0pxum"
        case isCharging = "Fpvbduwm"
        case memoryInfo = "Fpbjcv"
        case isScreenshotActive = "StwPp"
        case isScreencastAcitve = "KDhsd"
        case installedApps = "bvoikOGjs"
        case batteryLevel = "gfpbvjsoM"
        case inputLanguages = "gfdosnb"
        case region = "bpPjfns"
        case usesMetricSystem = "biMpaiuf"
        case isFullyCharged = "oahgoMAOI"
    }
}
