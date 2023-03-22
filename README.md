# SwiftUI-MVVM-Test
MVVM DataFlow 파악을 위해 만들어 본 작은 예제 프로젝트

## Preview
![Simulator Screen Recording - iPhone 14 Pro - 2023-03-22 at 18 00 12](https://user-images.githubusercontent.com/108422901/226852305-2dde1f3c-eb58-4373-802d-398a9f864161.gif)

## Content
### 1. Model을 생성한다.
가져올 데이터의 구조에 맞게 생성한다.

```swift
struct Person: Identifiable {
    var id = UUID()
    var name: String
    var email: String
    var phone: String
}
```
*이 구조체가 `Identifiable` 하지 않으면 ForEach를 통해 값을 가져올 수 없으니 주의

<img width="667" alt="스크린샷 2023-03-22 오후 6 04 52" src="https://user-images.githubusercontent.com/108422901/226853313-5f7cd5c9-4234-4a18-9603-32bb97b160b9.png">


### 2. ViewModel을 생성한다.
ObservableObject 프로토콜을 채택하고 @Published로 값의 변화를 감시한다.

```swift
class PersonViewModel: ObservableObject {
    @Published var people: [Person] = []
    
    init() {
        addPerson()
    }
    
    func addPerson() {
        people = peopleData
    }
    
    func shuffleOrder() {
        people.shuffle()
    }
    
    func reverseOrder() {
        people.reverse()
    }
    
    func removeLastPerson() {
        people.removeLast()
    }
    
    func removeFirstPerson() {
        people.removeFirst()
    }
}
// Dummy Data
let peopleData = [
    Person(name: "팜 하니", email: "hani@mail.com", phone: "010-1234-1234"),
    Person(name: "킴 민지", email: "kim@mail.com", phone: "010-1234-1234"),
    Person(name: "해린", email: "kang@mail.com", phone: "010-1234-1234"),
    Person(name: "혜인", email: "hyein@mail.com", phone: "010-1234-1234"),
    Person(name: "다니엘", email: "daniel@mail.com", phone: "010-1234-1234")
]
```

### 3. View에서 값을 가져온다.
`ObservableObject` 데이터를 가져올 때에는 `@ObservedObject`로 선언한다.

```swift
struct MainView: View {
    @ObservedObject var viewModel = PersonViewModel()
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ScrollView {
                ForEach(viewModel.people) { person in
                    HStack {
                        Text(person.name)
                            .font(.title)
                            .fontWeight(.bold)
                        Spacer()
                        VStack(alignment: .trailing) {
                            Text(person.phone)
                            Text(person.email)
                        }
                    }
                    .padding(14)
                }
            }
            Menu("Menu".uppercased()) {
                // viewModel의 함수를 통해 실시간 데이터 처리가 View에 반영되는 것을 볼 수 있다.
                Button("Reverse") { viewModel.reverseOrder() }
                Button("Shufflle") { viewModel.shuffleOrder() }
                Button("Remove last") { viewModel.removeLastPerson() }
                Button("Remove first") { viewModel.removeFirstPerson() }
            }
        }
    }
}
```
