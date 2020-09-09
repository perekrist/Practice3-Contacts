//
// This is a generated file, do not edit!
// Generated by R.swift, see https://github.com/mac-cain13/R.swift
//

import Foundation
import Rswift
import UIKit

/// This `R` struct is generated and contains references to static resources.
struct R: Rswift.Validatable {
  fileprivate static let applicationLocale = hostingBundle.preferredLocalizations.first.flatMap { Locale(identifier: $0) } ?? Locale.current
  fileprivate static let hostingBundle = Bundle(for: R.Class.self)

  /// Find first language and bundle for which the table exists
  fileprivate static func localeBundle(tableName: String, preferredLanguages: [String]) -> (Foundation.Locale, Foundation.Bundle)? {
    // Filter preferredLanguages to localizations, use first locale
    var languages = preferredLanguages
      .map { Locale(identifier: $0) }
      .prefix(1)
      .flatMap { locale -> [String] in
        if hostingBundle.localizations.contains(locale.identifier) {
          if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
            return [locale.identifier, language]
          } else {
            return [locale.identifier]
          }
        } else if let language = locale.languageCode, hostingBundle.localizations.contains(language) {
          return [language]
        } else {
          return []
        }
      }

    // If there's no languages, use development language as backstop
    if languages.isEmpty {
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages = [developmentLocalization]
      }
    } else {
      // Insert Base as second item (between locale identifier and languageCode)
      languages.insert("Base", at: 1)

      // Add development language as backstop
      if let developmentLocalization = hostingBundle.developmentLocalization {
        languages.append(developmentLocalization)
      }
    }

    // Find first language for which table exists
    // Note: key might not exist in chosen language (in that case, key will be shown)
    for language in languages {
      if let lproj = hostingBundle.url(forResource: language, withExtension: "lproj"),
         let lbundle = Bundle(url: lproj)
      {
        let strings = lbundle.url(forResource: tableName, withExtension: "strings")
        let stringsdict = lbundle.url(forResource: tableName, withExtension: "stringsdict")

        if strings != nil || stringsdict != nil {
          return (Locale(identifier: language), lbundle)
        }
      }
    }

    // If table is available in main bundle, don't look for localized resources
    let strings = hostingBundle.url(forResource: tableName, withExtension: "strings", subdirectory: nil, localization: nil)
    let stringsdict = hostingBundle.url(forResource: tableName, withExtension: "stringsdict", subdirectory: nil, localization: nil)

    if strings != nil || stringsdict != nil {
      return (applicationLocale, hostingBundle)
    }

    // If table is not found for requested languages, key will be shown
    return nil
  }

  /// Load string from Info.plist file
  fileprivate static func infoPlistString(path: [String], key: String) -> String? {
    var dict = hostingBundle.infoDictionary
    for step in path {
      guard let obj = dict?[step] as? [String: Any] else { return nil }
      dict = obj
    }
    return dict?[key] as? String
  }

  static func validate() throws {
    try intern.validate()
  }

  #if os(iOS) || os(tvOS)
  /// This `R.storyboard` struct is generated, and contains static references to 1 storyboards.
  struct storyboard {
    /// Storyboard `LaunchScreen`.
    static let launchScreen = _R.storyboard.launchScreen()

    #if os(iOS) || os(tvOS)
    /// `UIStoryboard(name: "LaunchScreen", bundle: ...)`
    static func launchScreen(_: Void = ()) -> UIKit.UIStoryboard {
      return UIKit.UIStoryboard(resource: R.storyboard.launchScreen)
    }
    #endif

    fileprivate init() {}
  }
  #endif

  /// This `R.image` struct is generated, and contains static references to 3 images.
  struct image {
    /// Image `addButton`.
    static let addButton = Rswift.ImageResource(bundle: R.hostingBundle, name: "addButton")
    /// Image `circule`.
    static let circule = Rswift.ImageResource(bundle: R.hostingBundle, name: "circule")
    /// Image `plus`.
    static let plus = Rswift.ImageResource(bundle: R.hostingBundle, name: "plus")

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "addButton", bundle: ..., traitCollection: ...)`
    static func addButton(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.addButton, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "circule", bundle: ..., traitCollection: ...)`
    static func circule(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.circule, compatibleWith: traitCollection)
    }
    #endif

    #if os(iOS) || os(tvOS)
    /// `UIImage(named: "plus", bundle: ..., traitCollection: ...)`
    static func plus(compatibleWith traitCollection: UIKit.UITraitCollection? = nil) -> UIKit.UIImage? {
      return UIKit.UIImage(resource: R.image.plus, compatibleWith: traitCollection)
    }
    #endif

    fileprivate init() {}
  }

  /// This `R.string` struct is generated, and contains static references to 4 localization tables.
  struct string {
    /// This `R.string.common` struct is generated, and contains static references to 2 localization keys.
    struct common {
      /// Value: An error has occurred
      static let errorTitle = Rswift.StringResource(key: "errorTitle", tableName: "Common", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ok
      static let okTitle = Rswift.StringResource(key: "okTitle", tableName: "Common", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: An error has occurred
      static func errorTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("errorTitle", tableName: "Common", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Common", preferredLanguages: preferredLanguages) else {
          return "errorTitle"
        }

        return NSLocalizedString("errorTitle", tableName: "Common", bundle: bundle, comment: "")
      }

      /// Value: Ok
      static func okTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("okTitle", tableName: "Common", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Common", preferredLanguages: preferredLanguages) else {
          return "okTitle"
        }

        return NSLocalizedString("okTitle", tableName: "Common", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.contact` struct is generated, and contains static references to 4 localization keys.
    struct contact {
      /// Value: Contacts
      static let bacButtonTitle = Rswift.StringResource(key: "bacButtonTitle", tableName: "Contact", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Notes
      static let noteLabel = Rswift.StringResource(key: "noteLabel", tableName: "Contact", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Phone
      static let phoneLAbel = Rswift.StringResource(key: "phoneLAbel", tableName: "Contact", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ringtone
      static let ringtoneLabel = Rswift.StringResource(key: "ringtoneLabel", tableName: "Contact", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Contacts
      static func bacButtonTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("bacButtonTitle", tableName: "Contact", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Contact", preferredLanguages: preferredLanguages) else {
          return "bacButtonTitle"
        }

        return NSLocalizedString("bacButtonTitle", tableName: "Contact", bundle: bundle, comment: "")
      }

      /// Value: Notes
      static func noteLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("noteLabel", tableName: "Contact", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Contact", preferredLanguages: preferredLanguages) else {
          return "noteLabel"
        }

        return NSLocalizedString("noteLabel", tableName: "Contact", bundle: bundle, comment: "")
      }

      /// Value: Phone
      static func phoneLAbel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("phoneLAbel", tableName: "Contact", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Contact", preferredLanguages: preferredLanguages) else {
          return "phoneLAbel"
        }

        return NSLocalizedString("phoneLAbel", tableName: "Contact", bundle: bundle, comment: "")
      }

      /// Value: Ringtone
      static func ringtoneLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("ringtoneLabel", tableName: "Contact", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "Contact", preferredLanguages: preferredLanguages) else {
          return "ringtoneLabel"
        }

        return NSLocalizedString("ringtoneLabel", tableName: "Contact", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.contactsList` struct is generated, and contains static references to 1 localization keys.
    struct contactsList {
      /// Value: Contacts
      static let navBarTitle = Rswift.StringResource(key: "navBarTitle", tableName: "ContactsList", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Contacts
      static func navBarTitle(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("navBarTitle", tableName: "ContactsList", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "ContactsList", preferredLanguages: preferredLanguages) else {
          return "navBarTitle"
        }

        return NSLocalizedString("navBarTitle", tableName: "ContactsList", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    /// This `R.string.createContact` struct is generated, and contains static references to 2 localization keys.
    struct createContact {
      /// Value: Notes
      static let noteLabel = Rswift.StringResource(key: "noteLabel", tableName: "CreateContact", bundle: R.hostingBundle, locales: [], comment: nil)
      /// Value: Ringtones
      static let ringroneLabel = Rswift.StringResource(key: "ringroneLabel", tableName: "CreateContact", bundle: R.hostingBundle, locales: [], comment: nil)

      /// Value: Notes
      static func noteLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("noteLabel", tableName: "CreateContact", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "CreateContact", preferredLanguages: preferredLanguages) else {
          return "noteLabel"
        }

        return NSLocalizedString("noteLabel", tableName: "CreateContact", bundle: bundle, comment: "")
      }

      /// Value: Ringtones
      static func ringroneLabel(preferredLanguages: [String]? = nil) -> String {
        guard let preferredLanguages = preferredLanguages else {
          return NSLocalizedString("ringroneLabel", tableName: "CreateContact", bundle: hostingBundle, comment: "")
        }

        guard let (_, bundle) = localeBundle(tableName: "CreateContact", preferredLanguages: preferredLanguages) else {
          return "ringroneLabel"
        }

        return NSLocalizedString("ringroneLabel", tableName: "CreateContact", bundle: bundle, comment: "")
      }

      fileprivate init() {}
    }

    fileprivate init() {}
  }

  fileprivate struct intern: Rswift.Validatable {
    fileprivate static func validate() throws {
      try _R.validate()
    }

    fileprivate init() {}
  }

  fileprivate class Class {}

  fileprivate init() {}
}

struct _R: Rswift.Validatable {
  static func validate() throws {
    #if os(iOS) || os(tvOS)
    try storyboard.validate()
    #endif
  }

  #if os(iOS) || os(tvOS)
  struct storyboard: Rswift.Validatable {
    static func validate() throws {
      #if os(iOS) || os(tvOS)
      try launchScreen.validate()
      #endif
    }

    #if os(iOS) || os(tvOS)
    struct launchScreen: Rswift.StoryboardResourceWithInitialControllerType, Rswift.Validatable {
      typealias InitialController = UIKit.UIViewController

      let bundle = R.hostingBundle
      let name = "LaunchScreen"

      static func validate() throws {
        if #available(iOS 11.0, tvOS 11.0, *) {
        }
      }

      fileprivate init() {}
    }
    #endif

    fileprivate init() {}
  }
  #endif

  fileprivate init() {}
}
