public struct OptionSetEnum<EnumType: CaseIterable & Hashable>: OptionSet {
    
    private static var options: [EnumType: Int] {
        .init(uniqueKeysWithValues: EnumType.allCases.enumerated().map {
            (key: $1, value: 2.to(exponent: $0))
        })
    }
    
    private static func value(for option: EnumType) -> Int {
        options[option] ?? 0
    }
    
    public private(set) var rawValue: Int
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
    
    public init(_ option: EnumType) {
        self.rawValue = Self.value(for: option)
    }
    
    public init(arrayLiteral elements: EnumType...) {
        rawValue = elements.map(Self.value(for:)).reduce(0, |)
    }
}

fileprivate extension Int {
    func to(exponent n: Int) -> Int {
        Array(repeating: self, count: n).reduce(1, *)
    }
}
