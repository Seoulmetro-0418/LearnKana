import SwiftUI
import UserNotifications

extension Font {
    static func gmarketSans(size: CGFloat) -> Font {
        return Font.custom("GmarketSansTTFMedium", size: size)
    }
}

struct ContentView: View {
    let hiragana: [String: String] = [
        "あ": "아", "い": "이", "う": "우", "え": "에", "お": "오",
        "か": "카", "き": "키", "く": "쿠", "け": "케", "こ": "코",
        "さ": "사", "し": "시", "す": "스", "せ": "세", "そ": "소",
        "た": "타", "ち": "치", "つ": "츠", "て": "테", "と": "토",
        "な": "나", "に": "니", "ぬ": "누", "ね": "네", "の": "노",
        "は": "하", "ひ": "히", "ふ": "후", "へ": "헤", "ほ": "호",
        "ま": "마", "み": "미", "む": "무", "め": "메", "も": "모",
        "や": "야", "ゆ": "유", "よ": "요",
        "ら": "라", "り": "리", "る": "루", "れ": "레", "ろ": "로",
        "わ": "와", "を": "오", "ん": "받침",
        "が": "가", "ぎ": "기", "ぐ": "구", "げ": "게", "ご": "고",
        "ざ": "자", "じ": "지", "ず": "즈", "ぜ": "제", "ぞ": "조",
        "だ": "다", "ぢ": "지", "づ": "즈", "で": "데", "ど": "도",
        "ば": "바", "び": "비", "ぶ": "부", "べ": "베", "ぼ": "보",
        "ぱ": "파", "ぴ": "피", "ぷ": "푸", "ぺ": "페", "ぽ": "포",
        "きゃ": "캬", "きゅ": "큐", "きょ": "쿄",
        "しゃ": "샤", "しゅ": "슈", "しょ": "쇼",
        "ちゃ": "챠", "ちゅ": "츄", "ちょ": "쵸",
        "にゃ": "냐", "にゅ": "뉴", "にょ": "뇨",
        "ひゃ": "햐", "ひゅ": "휴", "ひょ": "효",
        "みゃ": "먀", "みゅ": "뮤", "みょ": "묘",
        "りゃ": "랴", "りゅ": "류", "りょ": "료",
        "ぎゃ": "갸", "ぎゅ": "규", "ぎょ": "교",
        "じゃ": "쟈", "じゅ": "쥬", "じょ": "죠",
        "びゃ": "뱌", "びゅ": "뷰", "びょ": "뵤",
        "ぴゃ": "퍄", "ぴゅ": "퓨", "ぴょ": "표"
    ]
    
    let katakana: [String: String] = [
        "ア": "아", "イ": "이", "ウ": "우", "エ": "에", "オ": "오",
        "カ": "카", "キ": "키", "ク": "쿠", "ケ": "케", "コ": "코",
        "サ": "사", "シ": "시", "ス": "스", "セ": "세", "ソ": "소",
        "タ": "타", "チ": "치", "ツ": "츠", "テ": "테", "ト": "토",
        "ナ": "나", "ニ": "니", "ヌ": "누", "ネ": "네", "ノ": "노",
        "ハ": "하", "ヒ": "히", "フ": "후", "ヘ": "헤", "ホ": "호",
        "マ": "마", "ミ": "미", "ム": "무", "メ": "메", "モ": "모",
        "ヤ": "야", "ユ": "유", "ヨ": "요",
        "ラ": "라", "リ": "리", "ル": "루", "レ": "레", "ロ": "로",
        "ワ": "와", "ヲ": "오", "ン": "받",
        "ガ": "가", "ギ": "기", "グ": "구", "ゲ": "게", "ゴ": "고",
        "ザ": "자", "ジ": "지", "ズ": "즈", "ゼ": "제", "ゾ": "조",
        "ダ": "다", "ヂ": "지", "ヅ": "즈", "デ": "데", "ド": "도",
        "バ": "바", "ビ": "비", "ブ": "부", "ベ": "베", "ボ": "보",
        "パ": "파", "ピ": "피", "プ": "푸", "ペ": "페", "ポ": "포",
        "キャ": "캬", "キュ": "큐", "キョ": "쿄",
        "シャ": "샤", "シュ": "슈", "ショ": "쇼",
        "チャ": "챠", "チュ": "츄", "チョ": "쵸",
        "ニャ": "냐", "ニュ": "뉴", "ニョ": "뇨",
        "ヒャ": "햐", "ヒュ": "휴", "ヒョ": "효",
        "ミャ": "먀", "ミュ": "뮤", "ミョ": "묘",
        "リャ": "랴", "リュ": "류", "リョ": "료",
        "ギャ": "갸", "ギュ": "규", "ギョ": "교",
        "ジャ": "쟈", "ジュ": "쥬", "ジョ": "죠",
        "ビャ": "뱌", "ビュ": "뷰", "ビョ": "뵤",
        "ピャ": "퍄", "ピュ": "퓨", "ピョ": "표",
        "ファ": "화", "フィ": "휘", "フェ": "훼", "フォ": "호", "フュ": "휴",
        "ティ": "티", "ディ": "디", "トゥ": "투", "ドゥ": "두",
        "チェ": "체", "ジェ": "제",
        "シェ": "셰", "スィ": "시", "ズィ": "지",
        "ツァ": "차", "ツィ": "치", "ツェ": "체", "ツォ": "초",
        "テュ": "튜", "デュ": "듀",
        "ウィ": "위", "ウェ": "웨", "ウォ": "워",
        "ヴァ": "바", "ヴィ": "비", "ヴ": "브", "ヴェ": "베", "ヴォ": "보", "ヴュ": "뷰",
        "イェ": "예", "キェ": "켸", "ニェ": "녜", "ミェ": "몌", "ヒェ": "혜", "リェ": "례"
    ]
    
    
    @State private var currentCharacter: String = ""
    @State private var correctAnswer: String = ""
    @State private var userAnswer: String = ""
    @State private var feedbackMessage: String = ""
    @State private var selectedMode: String = "ひ/カ"
    @State private var isAnswered: Bool = false
    @State private var totalQuestions: Int = 0
    @State private var correctQuestions: Int = 0
    @State private var incorrectQuestions: Int = 0
    @FocusState private var isTextFieldFocused: Bool
    
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
                    .foregroundColor(feedbackMessage == NSLocalizedString("correctMessage", comment: "Correct message") ? .green : .red)
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
            correctAnswer = ""
            return
        }
        if let randomKey = keys.randomElement() {
            currentCharacter = randomKey
            correctAnswer = characterSet[randomKey] ?? ""
            userAnswer = ""
            feedbackMessage = ""
            isAnswered = false
        }
    }
    
    func checkAnswer() {
        if userAnswer.trimmingCharacters(in: .whitespacesAndNewlines) == correctAnswer {
            feedbackMessage = "정답입니다!"
            correctQuestions += 1
        } else {
            feedbackMessage = "오답입니다. 정답: \(correctAnswer)"
            incorrectQuestions += 1
        }
        isAnswered = true
        totalQuestions += 1  // 문제를 푼 후에 문제 수가 증가하도록 수정
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
