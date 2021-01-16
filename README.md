# WebpageViewCounter

## Installation and usage

Checkout the code locally
  
  $ git clone https://github.com/JamalAfridi/webpage_view_counter.git
  
 Ensure the correct version of ruby using your version manager, for RVM this is
 
  $ rvm use
  
Bundle install the gems

  $ bundle install
  
The code can be exercised with the provided log file via the commad

  $ ruby -Ilib ./bin/webpage_view_counter webserver.log
  
Tests can be exercised via the test suite by running rspec

  $ rspec
  
This includes unit tests and an integration test using a provded test log

