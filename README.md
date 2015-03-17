# gc_stats

[![Build Status](https://api.travis-ci.org/cerner/gc_stats.svg)][travis]
[![Gem Version](http://img.shields.io/gem/v/gc_stats.svg)][gem]
[![Code Climate](http://img.shields.io/codeclimate/github/cerner/gc_stats.svg)][codeclimate]
[![Dependencies Status](http://img.shields.io/gemnasium/cerner/gc_stats.svg)][gemnasium]

[travis]: https://travis-ci.org/cerner/gc_stats
[gem]: https://rubygems.org/gems/gc_stats
[codeclimate]: https://codeclimate.com/github/cerner/gc_stats
[gemnasium]: https://gemnasium.com/cerner/gc_stats

gc_stats is a Ruby gem for Rails applications that collects and logs garbage collection statistics during each request. GC statistics are only logged if a GC event is detected. This allows you to track and analyze the GC characteristics of your Rails application.

## Installation

gc_stats requires Ruby 2.1+ and has been tested with Rails 4.1.0. gc_stats may be compatible with older versions of Rails but this has not been validated.

If you're adding this gem to a Rails application, add this line to your application's Gemfile:

    gem 'gc_stats', '~> 1.0'

If you're adding the gem to an engine, add this line to your gemspec:

    gem.add_dependency 'gc_stats', '~> 1.0'

Once you have added a dependency to this gem and installed it, simply require this gem in an initializer in your project via:

    require 'gc_stats'

## Usage

With gc_stats, all of your final controller log messages will now contain the PID of the Ruby process. For example:

    Completed 200 OK in 5ms (PID: 12875)

If a garbage collection event occurs during a request, you will see additional information in this same final controller log message that will contain the GC statistics. For example:

    Completed 200 OK in 38ms (PID: 12875 | GC: [total_gc_time: 22.574 ms | num_events: 1 | major/minor/count: 9/24/33])

An explanation of each field being logged follows:

* PID - The process id obtained from [Process.pid](http://ruby-doc.org/core-2.1.0/Process.html#method-c-pid)
* total_gc_time - The total time taken for garbage collection during this request, converted to milliseconds ([GC::Profiler.total_time](http://ruby-doc.org/core-2.1.0/GC/Profiler.html#method-c-total_time))
* num_events - The number of garbage collection events that occurred during the request
* major - The total number of GC runs that traversed the whole Ruby heap, including old, young and remembered objects over the life of this process
* minor - The total number of GC runs that only traversed the young generation of objects and the objects in the remember set over the life of this process
* count - The total number of GC runs (this is the sum of major and minor GC events) over the life of this process

Both *total_gc_time* and *num_events* are specific to the individual request being handled.


Conversely, *major*, *minor*, and *count* apply to the lifetime of the process. As such, you will see these three values continually increase over time as your process performs garbage collections.

## Issues

Please browse our [existing issues](https://github.com/cerner/gc_stats/issues) before logging new issues.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md)

## License

Copyright 2015 Cerner Innovation, Inc.

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in compliance with the License. You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0 Unless required by applicable law or agreed to in writing, software distributed under the License is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the License for the specific language governing permissions and limitations under the License.
