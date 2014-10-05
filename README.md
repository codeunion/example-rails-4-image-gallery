A multi-user photo upload site built in rails.

## Demonstration Objectives
This example is intended to demonstrate:
1. Making very small, purposeful commits
2. Using feature-tests to shape your codebase
3. Regular refactoring to the [4 rules of simple
   design](http://www.jbrains.ca/permalink/the-four-elements-of-simple-design)
   (Taken a bit to an extreme)

## Releases
Each feature is linked to a pull request which adds the feature. Every commit
explains my reasoning in (some level of) detail. I'd recommend reading the pull
requests oldest to newest, commit by commit, both messages and code.

### Release 1.0.0

- [ ] [A guest may register as a
  `User`](https://github.com/codeunion/example-rails-4-image-gallery/pull/1
- [ ] A `User` may upload a `Image`
- [ ] A `User` may see a list of their `Image`s
- [ ] A guest may not find a `User`s `Image`
- [ ] A guest may view a `User`s `Image` if they are given a secret
  read-only link.

### Release 1.1.0

- [ ] A `User` may create a `Gallery`
- [ ] A `User` may add one of their `Image`s to a `Gallery`
- [ ] A guest may not find a `User`s `Gallery`
- [ ] A guest may view a `User`s `Gallery` if they are given a secret read-only
  link.

### Release 1.2.0

- [ ] A `User` may make a `Gallery` public
- [ ] A guest may browse public `Gallery`s

### Release 1.3.0

- [ ] A guest may suggest a `Tag` for a public `Image`
- [ ] A `User` may approve a `Tag` for a public `Image`
- [ ] A guest may browse public `Image`s by `Tag`

### Release 1.4.0

- [ ] A guest may search public `Gallery`s for `Image`s

## Running the code

Once you've forked and cloned this repo, you'll want to:

```
bundle install
rake db:setup
rake
rails s
```
