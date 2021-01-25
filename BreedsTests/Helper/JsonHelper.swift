import Foundation

private class BundleTestClass {}

enum JSONHelper {

    static func load<Element: Decodable>(withFile fileJson: String) -> Element? {
        var jsonData: Element?
        if let url = Bundle(for: BundleTestClass.self).url(forResource: fileJson, withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                jsonData = try decoder.decode(Element.self, from: data)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        return jsonData
    }

    static func loadData(withFile fileJson: String) -> Data? {
        var data: Data?
        if let url = Bundle(for: BundleTestClass.self).url(forResource: fileJson, withExtension: "json") {
            do {
                data = try Data(contentsOf: url)
            } catch {
                debugPrint(error.localizedDescription)
            }
        }
        return data
    }
}
