# Sidekiq the Door Open

**Skill level**: Advanced

**Time limit**: 1-2 hours

[Sidekiq] is the tool of choice for processing background jobs in Ruby. It's incredibly powerful for having a task run later or in the background. For example, if a git branch is pushed, it will email everyone, that there's in update. Git doesn't wait until everyone received the email before it let's the user know that the push was successful. Instead it runs that process in the background.

Awesome right? Well slow down there are a few small caveats to using such a powerful tool. One of them is thinking about the problem in a fashion where any code could be run at any time (to an extent). This can lead to a concern called 'thread safety'.

## Instructions

Here we have a Garage Door Simulator/State machine. Currently, we can only run the machine in memory. But what happens if we introduce another garage door opener? Well that's your task!

To assist in understanding the garage door's states, here's a quick diagram

![](https://github.com/paradime/sidekiq-the-door-open/blob/master/state-machine.png)

- 1) We need some sort of state persistence. The easiest possible solution for this is having the state be written to a file. Complete the pending specs and have the door read/write state to a file.
  - a) fill in the pending specs with your expectations
  - b) modify the Door to read/write to a given file
- 2) Fill in the [RSpec-Sidekiq] tests marked with level 2
  - we'll expect that we only have 1 remote
  - add the job
- 3) Fill in the specs marked with level 3
  - these will have to do with errors and handling failures
- 4) Create specs that should test thread safety (level 4)

Useful links:
- [Railscast]
- [Thread safety]
- [Sidekiq testing]
- [DailyDrip tutorial]

Special Thanks:

This challenge was inspired by [Daily Programmer #260]

[Sidekiq testing]:https://github.com/mperham/sidekiq/wiki/Testing
[Thread safety]:http://lucaguidi.com/2014/03/27/thread-safety-with-ruby.html
[DailyDrip tutorial]:https://www.youtube.com/watch?v=bfPb1zD91Rg&list=PLjeHh2LSCFrWGT5uVjUuFKAcrcj5kSai1
[Railscast]:http://railscasts.com/episodes/366-sidekiq
[RSpec-Sidekiq]:https://github.com/philostler/rspec-sidekiq
[Daily Programmer #260]:https://www.reddit.com/r/dailyprogrammer/comments/4cb7eh/20160328_challenge_260_easy_garage_door_opener/
[Sidekiq]:http://sidekiq.org/
