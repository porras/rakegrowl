# rakegrowl

Do you recognize this situation? You run a `rake` task (for example, `rake spec`), which you know it's going to take some time (e.g. 3 or 4 minutes). You say _"Great moment to check what's going on on Twitter"_. 10 minutes and 3 tabs with blog posts later, you realize you were actually waiting for a task to finish, a task which finished long before. Bye, bye, productivity!!

**rakegrowl** tells you when your rake tasks end via [Growl](http://growl.info/).

## Installation

You need to have [Growl](http://growl.info/) and `growlnotify` installed to get the notifications. In any case, **rakegrowl** is harmless if there is no Growl.

To install **rakegrowl**, which is packaged as a gem, you need to run:

    sudo gem sources -a http://gemcutter.org # [if you haven't done it already]
    sudo gem install rakegrowl
  
## Setup

Add this **at the end** of your `Rakefile`:

    require "rakegrowl"

From now on, whenever you run a `rake` task, you'll get a notification when it finishes.

## Rails

If you install your gem using Rails' gem mechanism, you won't need to require anything in your `Rakefile` to get notifications **for the tasks which load the enviroment** (which are the main ones anyway).

## Copyright & Licensing

Copyright (c) 2009 Sergio Gil. MIT license, see LICENSE for details.
