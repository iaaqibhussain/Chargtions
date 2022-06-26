//
//  Created by aaqib.hussain on 15.05.22.
//

typealias ChargingPointsResponse = [ChargingPointResponse]

struct ChargingPointResponse: Decodable {
    let dataProvider: DataProviderResponse
    let operatorInfo: OperatorInfoResponse?
    let usageType: UsageTypeResponse?
    let statusType: StatusTypeResponse
    let submissionStatus: SubmissionStatusResponse
    let userComments: [UserCommentResponse]?
    let percentageSimilarity: String?
    let mediaItems: [MediaItemResponse]?
    let isRecentlyVerified: Bool
    let id: Int
    let uuid: String
    let parentChargePointID: String?
    let dataProviderID: Int
    let dataProvidersReference: String?
    let operatorID: Int?
    let operatorsReference: String?
    let usageTypeID: Int?
    let usageCost: String?
    let addressInfo: AddressInfoResponse
    let connections: [ConnectionResponse]
    let numberOfPoints: Int?
    let generalComments: String?
    let datePlanned: String?
    let statusTypeID: Int
    let metadataValues: [MetadataValueResponse]?
    let dataQualityLevel: Int
    let submissionStatusTypeID: Int

    enum CodingKeys: String, CodingKey {
        case dataProvider = "DataProvider"
        case operatorInfo = "OperatorInfo"
        case usageType = "UsageType"
        case statusType = "StatusType"
        case submissionStatus = "SubmissionStatus"
        case userComments = "UserComments"
        case percentageSimilarity = "PercentageSimilarity"
        case mediaItems = "MediaItems"
        case isRecentlyVerified = "IsRecentlyVerified"
        case id = "ID"
        case uuid = "UUID"
        case parentChargePointID = "ParentChargePointID"
        case dataProviderID = "DataProviderID"
        case dataProvidersReference = "DataProvidersReference"
        case operatorID = "OperatorID"
        case operatorsReference = "OperatorsReference"
        case usageTypeID = "UsageTypeID"
        case usageCost = "UsageCost"
        case addressInfo = "AddressInfo"
        case connections = "Connections"
        case numberOfPoints = "NumberOfPoints"
        case generalComments = "GeneralComments"
        case datePlanned = "DatePlanned"
        case statusTypeID = "StatusTypeID"
        case metadataValues = "MetadataValues"
        case dataQualityLevel = "DataQualityLevel"
        case submissionStatusTypeID = "SubmissionStatusTypeID"
    }
}

// MARK: - AddressInfoResponse
struct AddressInfoResponse: Decodable {
    let id: Int
    let title, addressLine1: String
    let addressLine2: String?
    let town: String?
    let stateOrProvince: String?
    let postcode: String?
    let countryID: Int
    let country: CountryResponse
    let latitude, longitude: Double
    let contactTelephone1, contactTelephone2, contactEmail, accessComments: String?
    let relatedURL: String?
    let distance: Double?
    let distanceUnit: Int

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Title"
        case addressLine1 = "AddressLine1"
        case addressLine2 = "AddressLine2"
        case town = "Town"
        case stateOrProvince = "StateOrProvince"
        case postcode = "Postcode"
        case countryID = "CountryID"
        case country = "Country"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case contactTelephone1 = "ContactTelephone1"
        case contactTelephone2 = "ContactTelephone2"
        case contactEmail = "ContactEmail"
        case accessComments = "AccessComments"
        case relatedURL = "RelatedURL"
        case distance = "Distance"
        case distanceUnit = "DistanceUnit"
    }
}

// MARK: - CountryResponse
struct CountryResponse: Decodable {
    let isoCode: String?
    let continentCode: String?
    let id: Int
    let title: String?

    enum CodingKeys: String, CodingKey {
        case isoCode = "ISOCode"
        case continentCode = "ContinentCode"
        case id = "ID"
        case title = "Title"
    }
}

// MARK: - ConnectionResponse
struct ConnectionResponse: Decodable {
    let id, connectionTypeID: Int
    let connectionType: ConnectionTypeResponse?
    let reference: String?
    let statusTypeID: Int?
    let statusType: StatusTypeResponse?
    let levelID: Int?
    let level: LevelResponse?
    let amps, voltage: Int?
    let powerKW: Double?
    let currentTypeID: Int?
    let currentType: CurrentTypeResponse?
    let quantity: Int?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case connectionTypeID = "ConnectionTypeID"
        case connectionType = "ConnectionType"
        case reference = "Reference"
        case statusTypeID = "StatusTypeID"
        case statusType = "StatusType"
        case levelID = "LevelID"
        case level = "Level"
        case amps = "Amps"
        case voltage = "Voltage"
        case powerKW = "PowerKW"
        case currentTypeID = "CurrentTypeID"
        case currentType = "CurrentType"
        case quantity = "Quantity"
    }
}

// MARK: - ConnectionTypeResponse
struct ConnectionTypeResponse: Decodable {
    let formalName: String?
    let isDiscontinued, isObsolete: Bool?
    let id: Int
    let title: String?

    enum CodingKeys: String, CodingKey {
        case formalName = "FormalName"
        case isDiscontinued = "IsDiscontinued"
        case isObsolete = "IsObsolete"
        case id = "ID"
        case title = "Title"
    }
}

// MARK: - CurrentTypeResponse
struct CurrentTypeResponse: Decodable {
    let currentTypeDescription: String?
    let id: Int
    let title: String?

    enum CodingKeys: String, CodingKey {
        case currentTypeDescription = "Description"
        case id = "ID"
        case title = "Title"
    }
}

// MARK: - LevelResponse
struct LevelResponse: Decodable {
    let comments: String?
    let isFastChargeCapable: Bool
    let id: Int
    let title: String?

    enum CodingKeys: String, CodingKey {
        case comments = "Comments"
        case isFastChargeCapable = "IsFastChargeCapable"
        case id = "ID"
        case title = "Title"
    }
}

// MARK: - StatusTypeResponse
struct StatusTypeResponse: Decodable {
    let isOperational: Bool?
    let isUserSelectable: Bool
    let id: Int
    let title: String?

    enum CodingKeys: String, CodingKey {
        case isOperational = "IsOperational"
        case isUserSelectable = "IsUserSelectable"
        case id = "ID"
        case title = "Title"
    }
}

// MARK: - DataProviderResponse
struct DataProviderResponse: Decodable {
    let websiteURL: String
    let comments: [String]?
    let dataProviderStatusType: DataProviderStatusTypeResponse
    let isRestrictedEdit, isOpenDataLicensed, isApprovedImport: Bool
    let license: String
    let dateLastImported: String?
    let id: Int
    let title: String?

    enum CodingKeys: String, CodingKey {
        case websiteURL = "WebsiteURL"
        case comments = "Comments"
        case dataProviderStatusType = "DataProviderStatusType"
        case isRestrictedEdit = "IsRestrictedEdit"
        case isOpenDataLicensed = "IsOpenDataLicensed"
        case isApprovedImport = "IsApprovedImport"
        case license = "License"
        case dateLastImported = "DateLastImported"
        case id = "ID"
        case title = "Title"
    }
}

// MARK: - DataProviderStatusTypeResponse
struct DataProviderStatusTypeResponse: Decodable {
    let isProviderEnabled: Bool
    let id: Int
    let title: String?

    enum CodingKeys: String, CodingKey {
        case isProviderEnabled = "IsProviderEnabled"
        case id = "ID"
        case title = "Title"
    }
}

// MARK: - MediaItemResponse
struct MediaItemResponse: Decodable {
    let id, chargePointID: Int
    let itemURL, itemThumbnailURL: String
    let comment: String
    let isEnabled, isVideo, isFeaturedItem, isExternalResource: Bool
    let metadataValue: String?
    let user: UserResponse

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case chargePointID = "ChargePointID"
        case itemURL = "ItemURL"
        case itemThumbnailURL = "ItemThumbnailURL"
        case comment = "Comment"
        case isEnabled = "IsEnabled"
        case isVideo = "IsVideo"
        case isFeaturedItem = "IsFeaturedItem"
        case isExternalResource = "IsExternalResource"
        case metadataValue = "MetadataValue"
        case user = "User"
    }
}

// MARK: - UserResponse
struct UserResponse: Decodable {
    let id: Int
    let identityProvider, identifier, currentSessionToken: String?
    let username: String
    let profile, location, websiteURL: String?
    let reputationPoints: Int
    let permissions, permissionsRequested, dateLastLogin: String?
    let isProfilePublic, isEmergencyChargingProvider, isPublicChargingProvider, latitude: String?
    let longitude, emailAddress, emailHash: String?
    let profileImageURL: String
    let isCurrentSessionTokenValid, apiKey, syncedSettings: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case identityProvider = "IdentityProvider"
        case identifier = "Identifier"
        case currentSessionToken = "CurrentSessionToken"
        case username = "Username"
        case profile = "Profile"
        case location = "Location"
        case websiteURL = "WebsiteURL"
        case reputationPoints = "ReputationPoints"
        case permissions = "Permissions"
        case permissionsRequested = "PermissionsRequested"
        case dateLastLogin = "DateLastLogin"
        case isProfilePublic = "IsProfilePublic"
        case isEmergencyChargingProvider = "IsEmergencyChargingProvider"
        case isPublicChargingProvider = "IsPublicChargingProvider"
        case latitude = "Latitude"
        case longitude = "Longitude"
        case emailAddress = "EmailAddress"
        case emailHash = "EmailHash"
        case profileImageURL = "ProfileImageURL"
        case isCurrentSessionTokenValid = "IsCurrentSessionTokenValid"
        case apiKey = "APIKey"
        case syncedSettings = "SyncedSettings"
    }
}

// MARK: - MetadataValueResponse
struct MetadataValueResponse: Decodable {
    let id, metadataFieldID: Int
    let itemValue: String
    let metadataFieldOption, metadataFieldOptionID: String?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case metadataFieldID = "MetadataFieldID"
        case itemValue = "ItemValue"
        case metadataFieldOption = "MetadataFieldOption"
        case metadataFieldOptionID = "MetadataFieldOptionID"
    }
}

// MARK: - OperatorInfoResponse
struct OperatorInfoResponse: Decodable {
    let websiteURL: String?
    let comments: String?
    let phonePrimaryContact: String?
    let phoneSecondaryContact: String?
    let isPrivateIndividual: Bool?
    let addressInfo, bookingURL: String?
    let contactEmail: String?
    let faultReportEmail: String?
    let isRestrictedEdit: Bool?
    let id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case websiteURL = "WebsiteURL"
        case comments = "Comments"
        case phonePrimaryContact = "PhonePrimaryContact"
        case phoneSecondaryContact = "PhoneSecondaryContact"
        case isPrivateIndividual = "IsPrivateIndividual"
        case addressInfo = "AddressInfo"
        case bookingURL = "BookingURL"
        case contactEmail = "ContactEmail"
        case faultReportEmail = "FaultReportEmail"
        case isRestrictedEdit = "IsRestrictedEdit"
        case id = "ID"
        case title = "Title"
    }
}

// MARK: - SubmissionStatusResponse
struct SubmissionStatusResponse: Decodable {
    let isLive: Bool
    let id: Int
    let title: String?

    enum CodingKeys: String, CodingKey {
        case isLive = "IsLive"
        case id = "ID"
        case title = "Title"
    }
}

// MARK: - UsageTypeResponse
struct UsageTypeResponse: Decodable {
    let isPayAtLocation, isMembershipRequired, isAccessKeyRequired: Bool?
    let id: Int
    let title: String?

    enum CodingKeys: String, CodingKey {
        case isPayAtLocation = "IsPayAtLocation"
        case isMembershipRequired = "IsMembershipRequired"
        case isAccessKeyRequired = "IsAccessKeyRequired"
        case id = "ID"
        case title = "Title"
    }
}

// MARK: - UserCommentResponse
struct UserCommentResponse: Decodable {
    let id, chargePointID, commentTypeID: Int?
    let commentType: CommentTypeResponse?
    let userName, comment: String
    let rating: Int?
    let relatedURL: String?
    let user: UserResponse?
    let checkinStatusTypeID: Int?
    let checkinStatusType: CheckinStatusTypeResponse?

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case chargePointID = "ChargePointID"
        case commentTypeID = "CommentTypeID"
        case commentType = "CommentType"
        case userName = "UserName"
        case comment = "Comment"
        case rating = "Rating"
        case relatedURL = "RelatedURL"
        case user = "User"
        case checkinStatusTypeID = "CheckinStatusTypeID"
        case checkinStatusType = "CheckinStatusType"
    }
}

// MARK: - CheckinStatusTypeResponse
struct CheckinStatusTypeResponse: Decodable {
    let isPositive, isAutomatedCheckin: Bool
    let id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case isPositive = "IsPositive"
        case isAutomatedCheckin = "IsAutomatedCheckin"
        case id = "ID"
        case title = "Title"
    }
}

// MARK: - CommentTypeResponse
struct CommentTypeResponse: Decodable {
    let id: Int
    let title: String

    enum CodingKeys: String, CodingKey {
        case id = "ID"
        case title = "Title"
    }
}
