# README

* Ruby version - ruby-2.7.2
* Rails version -'rails', '~> 6.1.7'


* 

* ENDPOINTS -
      Method  ENDPOINTS                                                                  FORMATE

      GET     http:/[[HOST]]/v1/clock_in/:user_id                     user_id: user's id
      GET     http:/[[HOST]]/v1/friends_sleep/:user_id                user_id: user's id
      POST    http:/[[HOST]]/v1/clock_in                              [sleep][asleep_at] : Time stamp sleeping time, [sleep][wokeup_at] :Time
                                                                                                                              stamp awake time
      GET     http:/[[HOST]]/v1/followee/:id                          id: follower_id
      GET     http:/[[HOST]]/v1/followers/:id                         id: followee_id
      POST    http:/[[HOST]]/v1/follow                                [follow][follower_id] : follower_id , [follow][followee_id]: followee_id
      DELETE  http:/[[HOST]]/v1/unfollow/:id/:followee_id             id : user's id , followee_id: followee_id 




      Where ->
            follower_id: It's the Id of the User who is following other user
            followee_id: It's the id of the user who is followed by other user


* What our application do
  It's a "good night" api application based on ruby on rails frame work, In this application we have three model named User,Sleep and Follow where User have id and user name and In Sleep table we can clock in and create a daily asleep and wake up time for a user, and a user can follow and unfollow other user and also can see his followee's sleep times.
  Here we created api for the following operation

  1. Clock In operation, and return all clocked-in times, ordered by created time.
  2. Users can follow and unfollow other users.
  3. See the sleep records over the past week for their friends, ordered by the length of their sleep.
