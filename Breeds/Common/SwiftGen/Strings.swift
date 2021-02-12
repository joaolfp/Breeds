// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// ♡ ADD TO FAVORITES
  internal static let addFavorites = L10n.tr("Localizable", "addFavorites")
  /// Breeds
  internal static let breedsName = L10n.tr("Localizable", "breedsName")
  /// BreedEntity
  internal static let entityName = L10n.tr("Localizable", "entityName")
  /// Favorites
  internal static let favoritesName = L10n.tr("Localizable", "favoritesName")
  /// Height:
  internal static let height = L10n.tr("Localizable", "height")
  /// heart
  internal static let iconFavorite = L10n.tr("Localizable", "iconFavorite")
  /// list.dash
  internal static let iconList = L10n.tr("Localizable", "iconList")
  /// Life span:
  internal static let lifeSpan = L10n.tr("Localizable", "lifeSpan")
  /// Connection error
  internal static let messageError = L10n.tr("Localizable", "messageError")
  /// This dog has no description
  internal static let notDescription = L10n.tr("Localizable", "notDescription")
  /// ♡ REMOVE TO FAVORITES
  internal static let removeFavorites = L10n.tr("Localizable", "removeFavorites")
  /// Weight:
  internal static let weight = L10n.tr("Localizable", "weight")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
