import SwiftUI
import UserNotifications

extension Font {
    static func gmarketSans(size: CGFloat) -> Font {
        return Font.custom("GmarketSansTTFMedium", size: size)
    }
}

struct ContentView: View {
    let hiragana: [String: [String]] = [
        "あ": ["a", "아"], "い": ["i", "이"], "う": ["u", "우"], "え": ["e", "에"], "お": ["o", "오"],
        "か": ["ka", "카"], "き": ["ki", "키"], "く": ["ku", "쿠"], "け": ["ke", "케"], "こ": ["ko", "코"],
        "さ": ["sa", "사"], "し": ["shi", "시"], "す": ["su", "스"], "せ": ["se", "세"], "そ": ["so", "소"],
        "た": ["ta", "타"], "ち": ["chi", "치"], "つ": ["tsu", "츠"], "て": ["te", "테"], "と": ["to", "토"],
        "な": ["na", "나"], "に": ["ni", "니"], "ぬ": ["nu", "누"], "ね": ["ne", "네"], "の": ["no", "노"],
        "は": ["ha", "하"], "ひ": ["hi", "히"], "ふ": ["hu", "후", "fu"], "へ": ["he", "헤"], "ほ": ["ho", "호"],
        "ま": ["ma", "마"], "み": ["mi", "미"], "む": ["mu", "무"], "め": ["me", "메"], "も": ["mo", "모"],
        "や": ["ya", "야"], "ゆ": ["yu", "유"], "よ": ["yo", "요"],
        "ら": ["ra", "라"], "り": ["ri", "리"], "る": ["ru", "루"], "れ": ["re", "레"], "ろ": ["ro", "로"],
        "わ": ["wa", "와"], "を": ["wo", "오"], "ん": ["nn", "받침", "n", "ㄴ", "n", "ㅇ", "n", "ㅁ"],
        "が": ["ga", "가"], "ぎ": ["gi", "기"], "ぐ": ["gu", "구"], "げ": ["ge", "게"], "ご": ["go", "고"],
        "ざ": ["za", "자"], "じ": ["ji", "지"], "ず": ["zu", "즈"], "ぜ": ["ze", "제"], "ぞ": ["zo", "조"],
        "だ": ["da", "다"], "ぢ": ["ji", "지"], "づ": ["zu", "즈"], "で": ["de", "데"], "ど": ["do", "도"],
        "ば": ["ba", "바"], "び": ["bi", "비"], "ぶ": ["bu", "부"], "べ": ["be", "베"], "ぼ": ["bo", "보"],
        "ぱ": ["pa", "파"], "ぴ": ["pi", "피"], "ぷ": ["pu", "푸"], "ぺ": ["pe", "페"], "ぽ": ["po", "포"],
        "きゃ": ["kya", "캬"], "きゅ": ["kyu", "큐"], "きょ": ["kyo", "쿄"],
        "しゃ": ["sha", "샤"], "しゅ": ["shu", "슈"], "しょ": ["sho", "쇼"],
        "ちゃ": ["cha", "챠"], "ちゅ": ["chu", "츄"], "ちょ": ["cho", "쵸"],
        "にゃ": ["nya", "냐"], "にゅ": ["nyu", "뉴"], "にょ": ["nyo", "뇨"],
        "ひゃ": ["hya", "햐"], "ひゅ": ["hyu", "휴"], "ひょ": ["hyo", "효"],
        "みゃ": ["mya", "먀"], "みゅ": ["myu", "뮤"], "みょ": ["myo", "묘"],
        "りゃ": ["rya", "랴"], "りゅ": ["ryu", "류"], "りょ": ["ryo", "료"],
        "ぎゃ": ["gya", "갸"], "ぎゅ": ["gyu", "규"], "ぎょ": ["gyo", "교"],
        "じゃ": ["ja", "쟈"], "じゅ": ["ju", "쥬"], "じょ": ["jo", "죠"],
        "びゃ": ["bya", "뱌"], "びゅ": ["byu", "뷰"], "びょ": ["byo", "뵤"],
        "ぴゃ": ["pya", "퍄"], "ぴゅ": ["pyu", "퓨"], "ぴょ": ["pyo", "표"]
    ]
    
    let katakana: [String: [String]] = [
        "ア": ["a", "아"], "イ": ["i", "이"], "ウ": ["u", "우"], "エ": ["e", "에"], "オ": ["o", "오"],
        "カ": ["ka", "카"], "キ": ["ki", "키"], "ク": ["ku", "쿠"], "ケ": ["ke", "케"], "コ": ["ko", "코"],
        "サ": ["sa", "사"], "シ": ["shi", "시"], "ス": ["su", "스"], "セ": ["se", "세"], "ソ": ["so", "소"],
        "タ": ["ta", "타"], "チ": ["chi", "치"], "ツ": ["tsu", "츠"], "テ": ["te", "테"], "ト": ["to", "토"],
        "ナ": ["na", "나"], "ニ": ["ni", "니"], "ヌ": ["nu", "누"], "ネ": ["ne", "네"], "ノ": ["no", "노"],
        "ハ": ["ha", "하"], "ヒ": ["hi", "히"], "フ": ["hu", "후", "fu"], "ヘ": ["he", "헤"], "ホ": ["ho", "호"],
        "マ": ["ma", "마"], "ミ": ["mi", "미"], "ム": ["mu", "무"], "メ": ["me", "메"], "モ": ["mo", "모"],
        "ヤ": ["ya", "야"], "ユ": ["yu", "유"], "ヨ": ["yo", "요"],
        "ラ": ["ra", "라"], "リ": ["ri", "리"], "ル": ["ru", "루"], "レ": ["re", "레"], "ロ": ["ro", "로"],
        "ワ": ["wa", "와"], "ヲ": ["wo", "오"], "ン": ["nn", "받침", "n", "ㄴ", "n", "ㅇ", "n", "ㅁ"],
        "ガ": ["ga", "가"], "ギ": ["gi", "기"], "グ": ["gu", "구"], "ゲ": ["ge", "게"], "ゴ": ["go", "고"],
        "ザ": ["za", "자"], "ジ": ["ji", "지"], "ズ": ["zu", "즈"], "ゼ": ["ze", "제"], "ゾ": ["zo", "조"],
        "ダ": ["da", "다"], "ヂ": ["ji", "지"], "ヅ": ["zu", "즈"], "デ": ["de", "데"], "ド": ["do", "도"],
        "バ": ["ba", "바"], "ビ": ["bi", "비"], "ブ": ["bu", "부"], "ベ": ["be", "베"], "ボ": ["bo", "보"],
        "パ": ["pa", "파"], "ピ": ["pi", "피"], "プ": ["pu", "푸"], "ペ": ["pe", "페"], "ポ": ["po", "포"],
        "キャ": ["kya", "캬"], "キュ": ["kyu", "큐"], "キョ": ["kyo", "쿄"],
        "シャ": ["sha", "샤"], "シュ": ["shu", "슈"], "ショ": ["sho", "쇼"],
        "チャ": ["cha", "챠"], "チュ": ["chu", "츄"], "チョ": ["cho", "쵸"],
        "ニャ": ["nya", "냐"], "ニュ": ["nyu", "뉴"], "ニョ": ["nyo", "뇨"],
        "ヒャ": ["hya", "햐"], "ヒュ": ["hyu", "휴"], "ヒョ": ["hyo", "효"],
        "ミャ": ["mya", "먀"], "ミュ": ["myu", "뮤"], "ミョ": ["myo", "묘"],
        "リャ": ["rya", "랴"], "リュ": ["ryu", "류"], "リョ": ["ryo", "료"],
        "ギャ": ["gya", "갸"], "ギュ": ["gyu", "규"], "ギョ": ["gyo", "교"],
        "ジャ": ["ja", "쟈"], "ジュ": ["ju", "쥬"], "ジョ": ["jo", "죠"],
        "ビャ": ["bya", "뱌"], "ビュ": ["byu", "뷰"], "ビョ": ["byo", "뵤"],
        "ピャ": ["pya", "퍄"], "ピュ": ["pyu", "퓨"], "ピョ": ["pyo", "표"],
        "ファ": ["fa", "화"], "フィ": ["fi", "휘"], "フェ": ["fe", "훼"], "フォ": ["fo", "호"], "フュ": ["fyu", "휴"],
        "ティ": ["ti", "티"], "ディ": ["di", "디"], "トゥ": ["tu", "투"], "ドゥ": ["du", "두"],
        "チェ": ["che", "체"], "ジェ": ["je", "제"],
        "シェ": ["she", "셰"], "スィ": ["si", "시"], "ズィ": ["zi", "지"],
        "ツァ": ["tsa", "차"], "ツィ": ["tsi", "치"], "ツェ": ["tse", "체"], "ツォ": ["tso", "초"],
        "テュ": ["tyu", "튜"], "デュ": ["dyu", "듀"],
        "ウィ": ["wi", "위"], "ウェ": ["we", "웨"], "ウォ": ["wo", "워"],
        "ヴァ": ["va", "바"], "ヴィ": ["vi", "비"], "ヴ": ["vu", "브"], "ヴェ": ["ve", "베"], "ヴォ": ["vo", "보"], "ヴュ": ["vyu", "뷰"],
        "イェ": ["ye", "예"], "キェ": ["kye", "켸"], "ニェ": ["nye", "녜"], "ミェ": ["mye", "몌"], "ヒェ": ["hye", "혜"], "リェ": ["rye", "례"]
    ]
    
    
    @State private var currentCharacter: String = ""
    @State private var correctAnswer: [String] = []
    @State private var userAnswer: String = ""
    @State private var feedbackMessage: String = ""
    @State private var selectedMode: String = "ひ/カ"
    @State private var isAnswered: Bool = false
    @State private var totalQuestions: Int = 0
    @State private var correctQuestions: Int = 0
    @State private var incorrectQuestions: Int = 0
    @FocusState private var isTextFieldFocused: Bool
    @State private var correctLocalized: String = NSLocalizedString("correctMessage", comment: "correct message")
    @State private var incorrectFormatLocalized: String = ""
    
    let modes = ["ひ/カ", "ひらがな", "カタカナ"]
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20) {
                Text(NSLocalizedString("quizTitle", comment: "Title of the quiz"))
                    .font(.gmarketSans(size: 34))
                    .bold()
                    .padding()
                
                Picker(NSLocalizedString("quizMode", comment: "Quiz Mode label"), selection: $selectedMode) {
                    ForEach(modes, id: \.self) { mode in
                        Text(mode).font(.gmarketSans(size: 18))
                    }
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding()
                
                Text(currentCharacter)
                    .font(.gmarketSans(size: 100))
                    .padding()
                
                TextField(NSLocalizedString("answerPlaceholder", comment: "Answer placeholder"), text: $userAnswer)
                    .font(.gmarketSans(size: 20))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    .autocapitalization(.none)
                    .disableAutocorrection(true)
                    .focused($isTextFieldFocused)
                    .submitLabel(.send)
                    .onSubmit {
                        checkAnswer()
                    }
                    .disabled(isAnswered)
                
                Button(isAnswered ? NSLocalizedString("nextQuestionButton", comment: "Next Question button") : NSLocalizedString("submitButton", comment: "Submit button")) {
                    if isAnswered {
                        nextQuestion()
                    } else {
                        checkAnswer()
                    }
                }
                .font(.gmarketSans(size: 20))
                .padding()
                .buttonStyle(.borderedProminent)
                
                Text(feedbackMessage)
                    .font(.gmarketSans(size: 18))
                    .foregroundColor(feedbackMessage == correctLocalized ? .green : .red)
                    .bold()
                    .padding()
                
                VStack {
                    Text(NSLocalizedString("todayRecord", comment: "Today’s record title"))
                        .font(.gmarketSans(size: 18))
                        .padding(.top, 10)
                    Text("\(NSLocalizedString("questionsSolved", comment: "Questions solved label")) \(totalQuestions)")
                    Text("\(NSLocalizedString("correctAnswers", comment: "Correct answers label")) \(correctQuestions)")
                    Text("\(NSLocalizedString("incorrectAnswers", comment: "Incorrect answers label")) \(incorrectQuestions)")
                }
                .font(.gmarketSans(size: 18))
                .padding()
            }
        }
        .onTapGesture {
            isTextFieldFocused = false
        }
        .onAppear {
            loadTodayRecord()
            nextQuestion()
            requestNotificationPermission()
            incorrectFormatLocalized = NSLocalizedString("incorrectMessage", comment: "incorrect message with answer")
        }
    }
    
    func requestNotificationPermission() {
        let center = UNUserNotificationCenter.current()
        center.requestAuthorization(options: [.alert, .sound]) { granted, error in
            if granted {
                print("알림 권한 허용됨")
                scheduleDailyNotifications()
            } else {
                print("알림 권한 거부됨")
            }
        }
    }

    func scheduleDailyNotifications() {
        let center = UNUserNotificationCenter.current()
        
        center.removeAllPendingNotificationRequests()
        
        let times = [
            (hour: 9, minute: 0),
            (hour: 16, minute: 0),
            (hour: 21, minute: 0)
        ]
        
        for (index, time) in times.enumerated() {
            var dateComponents = DateComponents()
            dateComponents.hour = time.hour
            dateComponents.minute = time.minute
            
            let content = UNMutableNotificationContent()
            content.title = "학습 알림"
            content.body = "지금은 일본어를 공부할 시간입니다!\n It's time to learn Japanese! \n 今は日本語を勉強する時間です！"
            content.sound = .default
            
            let trigger = UNCalendarNotificationTrigger(dateMatching: dateComponents, repeats: true)
            
            let request = UNNotificationRequest(identifier: "studyReminder\(index)", content: content, trigger: trigger)
            
            center.add(request) { error in
                if let error = error {
                    print("알림 등록 실패: \(error.localizedDescription)")
                }
            }
        }
    }
    
    func getCurrentDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd"
        return dateFormatter.string(from: Date())
    }
    
    func nextQuestion() {
        let characterSet = selectedMode == "ひらがな" ? hiragana :
                           (selectedMode == "カタカナ" ? katakana :
                            hiragana.merging(katakana) { (_, new) in new })

        let keys = Array(characterSet.keys)
        guard !keys.isEmpty else {
            currentCharacter = ""
            correctAnswer = []
            return
        }
        if let randomKey = keys.randomElement() {
            currentCharacter = randomKey
            correctAnswer = characterSet[randomKey] ?? []
            userAnswer = ""
            feedbackMessage = ""
            isAnswered = false
        }
    }
    
    func checkAnswer() {
        let trimmed = userAnswer.trimmingCharacters(in: .whitespacesAndNewlines)
        let languageCode = Locale.current.languageCode ?? "en"
        // 영어: 0,2,4... / 한국어: 1,3,5...
        let preferredIndexes: [Int]
        if languageCode == "ko" {
            preferredIndexes = stride(from: 1, to: correctAnswer.count, by: 2).map { $0 }
        } else {
            preferredIndexes = stride(from: 0, to: correctAnswer.count, by: 2).map { $0 }
        }
        let preferredAnswers = preferredIndexes.compactMap { idx in
            idx < correctAnswer.count ? correctAnswer[idx] : nil
        }
        let correctLocalized = NSLocalizedString("correctMessage", comment: "correct message")
        if preferredAnswers.contains(trimmed) {
            feedbackMessage = correctLocalized
            correctQuestions += 1
        } else {
            let shownAnswers = Array(Set(preferredAnswers))
            feedbackMessage = String(format: incorrectFormatLocalized, shownAnswers.joined(separator: ", "))
            incorrectQuestions += 1
        }
        isAnswered = true
        totalQuestions += 1
        CoreDataHelper.shared.saveQuizRecord(
            total: Int32(totalQuestions),
            correct: Int32(correctQuestions),
            incorrect: Int32(incorrectQuestions)
        )
    }
    
    func resetRecords() {
        totalQuestions = 0
        correctQuestions = 0
        incorrectQuestions = 0
    }

    func loadTodayRecord() {
        if let record = CoreDataHelper.shared.getCurrentQuizRecord() {
            totalQuestions = Int(record.totalQuestions)
            correctQuestions = Int(record.correctAnswers)
            incorrectQuestions = Int(record.incorrectAnswers)
        } else {
            resetRecords()
        }
    }
}
