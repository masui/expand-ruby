# -*- coding: utf-8 -*-
require 'rubygems'
require 're_expand'

"(月\tmon|火\ttue|水\twed|木\tthur|金\tfri)曜(1|2|3|4|5|6)限".expand { |s,a,b|
  puts "#{s} #{a} #{b}"
}


