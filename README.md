# WebpageViewCounter

This is the Smart Pensions kata 

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

## Approach
- I solved this challenge by iterating through each line of the log file and for each
line I parsed it based on the path before each whitespace, dis-regarding the IP address in order to get the webpage path and unique web page path and then adding
these to a hash as a key and incrementing the value by one in order to create an aggregate for the amount of visits 

## Time and space complexity
- Linear O(n) due to looping through each line of the log aswell as creating a new hash for each webpage path

## Thoughts and considerations
- This approach used the paths in the log file only but there were also IP address present, some entries in the log file had different paths related to the same IP address, however maybe we should be counting visits based on IP address?
- Another approach would be to go off the IP addresses, storing these in a set in order to keep track of all unique visits 
- Current implementation requires a hash to be used in order to aggregate the visits
- Line presenter allows for a template which can be extended for other kinds of visits we want to display

## Potential improvements
- Could have parsed/aggregated log in seperate steps which would have seperated concerns a litter more leading to better OO Design, however I decided to do both of these things at once while reading the line to reduce space used
