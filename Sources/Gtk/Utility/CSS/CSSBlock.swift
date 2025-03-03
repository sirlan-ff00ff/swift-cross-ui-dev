/// Type safe representation of a block of css
///
/// ```
/// .class {
///   opacity: 0.3;
/// }
/// ```
public struct CSSBlock: Equatable {
    private var cssClass: String

    /// The block's properties, keyed by property name.
    private var keyedProperties: [String: CSSProperty] = [:]

    var stringRepresentation: String {
        ".\(cssClass){\(keyedProperties.values.map(\.stringRepresentation).joined())}"
    }

    init(forCssClass cssClass: String) {
        self.cssClass = cssClass
    }

    public mutating func set(property: CSSProperty) {
        keyedProperties[property.key] = property
    }

    /// Helper to add or replace existing properties
    ///
    /// - Parameters:
    ///   - clear: Whether to clear all other properties. By default this function
    ///            is additive and does not remove other css properties previously set.
    public mutating func set(properties: [CSSProperty], clear: Bool = false) {
        if clear {
            self.clear()
        }
        for property in properties {
            keyedProperties[property.key] = property
        }
    }

    public mutating func clear() {
        keyedProperties = [:]
    }
}
