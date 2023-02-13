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

    var videoInfo = [Youtube]()
    func testYouTubeNetwork() throws {
        let key = "&key=" + Bundle.main.apiKey
        let urlString = "https://www.googleapis.com/youtube/v3/search?q=harry+potter&part=snippet&type=video" + key
        if let url = URL(string: urlString) {
                URLSession.shared.dataTask(with: url) { data, response, error in
                    if let data = data {
                        do {
                            XCTAssertNotNil(response,"통신 성공")
                            
                            let response = try JSONDecoder().decode(YouTubeApiResponse.self, from: data)
                            self.videoInfo = response.items
                            XCTAssertEqual(self.videoInfo.count, 5, "JSONDecoder 성공! 총 10개의 item이 있다.")
                            
                        } catch {
                            print(error)
                        }
                    }
                }.resume()
            }
    }
    
    func testFormatter() throws {
        let date = "2023-01-13T00:00:09Z"
        let startIndex = date.index(date.startIndex, offsetBy: 0)// 사용자지정 시작인덱스
        let endIndex = date.index(date.startIndex, offsetBy: 10)// 사용자지정 끝인덱스
        let sliced_str = date[startIndex ..< endIndex]
        
        print(sliced_str)
        XCTAssertEqual(sliced_str, "2023-01-13", "DateFormatter 성공!")
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"

        let convertDate = dateFormatter.date(from: String(sliced_str)) // Date 타입으로 변환

        let myDateFormatter = DateFormatter()
        myDateFormatter.dateFormat = "yyyy년MM월dd일"
        let convertStr = myDateFormatter.string(from: convertDate!)
        XCTAssertEqual(convertStr, "2023년01월13일", "DateFormatter 성공!")
    }
}
