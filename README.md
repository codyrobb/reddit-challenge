# reddit-challenge
## Network Service Usage

```swift
let service = NetworkService()

service.execute(endpoint: .home) { result in
    switch result {
        case .success(let post):
            print(post)
        case .failure:
            print("error!!!!")
    }
}
```
