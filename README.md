## Introduction

I don't agree with Capybara's rack_test driver knowing anything about Rails 3.  [Kalv's written about it](http://kalv.co.uk/2010/10/27/stop-being-clever-capybara/) and I've raised an [issue against Capybara](https://github.com/jnicklas/capybara/issues#issue/184/comment/520051).

I've created this as a kinda failing test to expose one side of the problem.  Rack does not equal Rails 3 yet Capybara's rack_test driver does 'clever' things with some arbitrary data-* attributes that Rails 3 emits.