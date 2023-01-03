enum MismatchError: Error {
    case nameMismatch
}

func guess(name userInput: String)
throws {
    if (userInput != "KIM") {
        throw MismatchError.nameMismatch
    }
}

do {
    try guess(name: "LEE")
    print("pass")
} catch {
    print("error : \(error)")
}
