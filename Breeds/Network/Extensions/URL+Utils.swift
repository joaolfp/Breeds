import Foundation

extension URLRequest {

    init(with url: URL?) {
        guard let url = url else {
            preconditionFailure("Invalid URL")
        }
        self = URLRequest(url: url)
    }
}
