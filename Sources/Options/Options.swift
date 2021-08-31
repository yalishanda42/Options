public struct Options<EnumType: CaseIterable & Hashable>: OptionSet {

    private static var options: [EnumType: Int] {
        .init(uniqueKeysWithValues: EnumType.allCases.enumerated().map {
            (key: $1, value: Int(1 << $0))
        })
    }

    private static func value(for option: EnumType) -> Int {
        options[option] ?? 0
    }

    /// The raw value of the option set.
    public private(set) var rawValue: Int

    /// Initialize the option set via a raw value.
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }

    /// Initialize the option set via a case of the generic enum type.
    public init(_ option: EnumType) {
        rawValue = Self.value(for: option)
    }

    /// Initialize the option set via a combination of multiple cases of the generic enum type.
    public init(arrayLiteral elements: EnumType...) {
        rawValue = elements.map(Self.value(for:)).reduce(0, |)
    }

    // MARK: - Utilites

    /// Convenience property of an instance containing all possible options.
    public static var all: Self {
        .init(rawValue: options.values.reduce(0, |))
    }
    
    /// Convenience property returning all possible option combinations containing `self`, sorted by their raw values ascendingly.
    public var allCombinationsContainingSelf: [Self] {
        Self.allContaining(self)
    }
    
    /// Convenience method returning all possible instances containing the given option, sorted by their raw values ascendingly.
    public static func allContaining(_ option: EnumType) -> [Self] {
        allContaining([option])
    }

    /// Convenience method returning all possible instances containing the given option, sorted by their raw values ascendingly.
    public static func allContaining(_ option: Self) -> [Self] {
        Array(1...Self.all.rawValue)
            .map(Self.init(rawValue:))
            .filter { $0.contains(option) }
    }
    
    /// Convenience method returning an array of all cases contained in `self`, ordered by their respective option's raw value.
    public var decomposed: [EnumType] {
        EnumType.allCases.filter { contains([$0]) }
    }

}
