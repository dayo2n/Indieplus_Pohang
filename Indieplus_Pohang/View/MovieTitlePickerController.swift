//
//  MoviePickerViewController.swift
//  Indieplus_Pohang
//
//  Created by GYURI PARK on 2023/06/24.
//

import Foundation
import SwiftSoup
import UIKit

//class MoviePickerViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        self.fetchHTMLParsingResultWill()
//    }
//
//    // MARK: 영화 제목 정보 가져오기
//    func fetchHTMLParsingResultWill() {
//
//        var uniqueTitles = Set<String>()
//        let urlAddress = "https://culturalspace.phcf.or.kr/joongangArtHall/indiplusMovieSchedule.do"
//        guard let url = URL(string: urlAddress) else { return }
//        do {
//            let html = try String(contentsOf: url, encoding: .utf8)
//            let doc: Document = try SwiftSoup.parse(html)
//            let movieTitles: Elements = try doc.select(".left").select("span") //.은 클래스
//
//            for i in movieTitles {
//                let title = try i.text()
//                uniqueTitles.insert(title)
//
//            }
//            let extractedTitles = extractMovieTitle(from: uniqueTitles)
//            print(extractedTitles)
//
//
//        } catch let error {
//            print("Error : \(error)")
//        }
//    }
//
//    // MARK: 영화 제목만 뽑기
//    func extractMovieTitle(from titles: Set<String>) -> [String] {
//        let targetCharacter: Character = "["
//        var extractedTitles: [String] = []
//
//        for title in titles {
//            if let index = title.firstIndex(of: targetCharacter) {
//                let extractedString = String(title[..<index])
//                extractedTitles.append(extractedString)
//            }
//        }
//        return extractedTitles
//    }
//}

class MovieTitlePickerController: UIViewController {
    let model = MovieTitlePickerModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchHTMLParsingResult()
    }

    // MARK: 영화 제목 정보 가져오기
    func fetchHTMLParsingResult() {
        model.fetchHTMLParsingResult { [weak self] (uniqueTitles, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            if let uniqueTitles = uniqueTitles {
                let extractedTitles = self?.model.extractMovieTitle(from: uniqueTitles)
                print(extractedTitles)
            }
        }
    }
}