import XCTest
@testable import PhoneNumberField

class CountriesDataSourceTests: XCTestCase {

    func testModelInitSuccess() throws {
        let sut = try makeSUT()
        XCTAssertNotNil(sut)
    }
    
    func testCountriesLocalDataReadable() throws {
        let sut = try makeSUT()
        XCTAssert(!sut.countries.isEmpty)
    }
    
    func testCountriesLocalCountEquals240() throws {
        let sut = try makeSUT()
        XCTAssertEqual(sut.countries.count, 240)
    }
    
    func testCountryCodeModelLoadsISOCodeCorrectly() throws {
        let sut = try makeSUT()
        let isoCode = sut.countries.first?.isoCode
        XCTAssertNotNil(isoCode)
    }
    
    func testCountryCodeModelSearch() throws {
        let sut = try makeSUT()
        let countryIndia = sut.countries[93]
        let countryNetherlands = sut.countries[147]
        
        
        let localisedNameIndia = countryIndia.localizedName
        XCTAssertEqual(localisedNameIndia, "India")
        
        let localisedNameNetherlands = countryNetherlands.localizedName
        XCTAssertEqual(localisedNameNetherlands, "Nederland")
    }
    
    func testCountryCodeFlag() throws {
        let sut = try makeSUT()
        let countryIndia = sut.countries[93]
        let countryNetherlands = sut.countries[147]
        XCTAssertEqual(countryIndia.flag(), "🇮🇳")
        XCTAssertEqual(countryNetherlands.flag(), "🇳🇱")
    }
    
    private func makeSUT() throws -> CountriesDataSource {
        try CountriesDataSourceLocal(displayNameLocale: "nl")
    }
}
