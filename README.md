# Reddit Code Challenge
https://www.reddit.com is a website where users can submit content (via links or plain text) into a post. Other users can up vote or down vote the post. Posts are prioritized on the site based on their votes and are categorized into "subreddits", which allow users to browse related to a certain topic.

The goal is to create a basic iOS application that lists reddit posts in a table view. 
- Each cell should contain the title and subreddit the post belongs to.
- Each cell should open the URL attached to the post in a basic web view. 
- If time provides, add some form of an input to allow the user to type in a desired subreddit.

Feel free to create the application whichever way you'd like. Feel free to use open source libraries.

A simple networking implementation has been provided. Here's an example of fetching a list of posts on the home page.

## Network Service Usage

#### Using callbacks:
```swift
let service = NetworkService()

service.execute(endpoint: .home) { result in
    switch result {
        case .success(let response):
            print(response.posts)
        case .failure:
            print("error!!!!")
    }
}
```

#### Using async/await:
```swift
let service = NetworkService()

do {
    let posts = try await service.execute(endpoint: .home)
    print(posts)
} catch {
    print("There was an error: \(error)")
}
```
