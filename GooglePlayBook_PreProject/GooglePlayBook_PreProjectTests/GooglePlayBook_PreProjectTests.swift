//
//  GooglePlayBook_PreProjectTests.swift
//  GooglePlayBook_PreProjectTests
//
//  Created by 김소영 on 2023/02/08.
//  Copyright © 2023 SoYoungKim. All rights reserved.
//

import XCTest
@testable import GooglePlayBook_PreProject

class GooglePlayBook_PreProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    // 검색 text test "" -> "+"
    func testSearchText() throws {
        let searchString = "This is my string"
        let newString = searchString.replacingOccurrences(of: " ", with: "+", options: .literal, range: nil)
        
        XCTAssertEqual(newString, "This+is+my+string", "공백을 +로 변경 완료.")
    }
    
    // 네트워크 연결 Test/ JSONDecoder Test
    var bookInfo = [Book]()
    func testNetwork() throws {
        if let url = URL(string: "https://www.googleapis.com/books/v1/volumes?q=harry+potter") {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            XCTAssertNotNil(response,"통신 성공")
                            
                            let response = try JSONDecoder().decode(ApiResponse.self, from: data)
                            self.bookInfo = response.items
                            XCTAssertEqual(self.bookInfo.count, 10, "JSONDecoder 성공! 총 10개의 item이 있다.")
                            
                        } catch {
                            print(error)
                        }
                    }
                }.resume()
            }
    }

}
