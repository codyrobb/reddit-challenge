# Reddit Code Challenge
https://www.reddit.com is a website where users can submit content (via links or plain text) into a post. Other users can up vote or down vote the post. Posts are prioritized on the site based on their votes and are categorized into "subreddits", which allow users to browse related to a certain topic.

The goal is to create a basic iOS application that lists reddit posts in a table view. 
- Each table view cell should contain the post name along with the subreddit category name. 
- There should be some UI that allows a user to type in a subreddit category (perhaps in a text field or an alert view with plain text input) and display only posts belonging to that subreddit category when they click submit (perhaps the table will get reloaded with new data, or show a new table view).
- When a user clicks on a cell, the URL attached to the post should open in a basic web view (don't worry if the content looks funny as not all URLs will be responsive in their design).

Feel free to create the application whichever way you'd like. Feel free to use open source libraries.

A simple networking implementation has been provided. Here's an example of fetching a list of posts on the home page.

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
