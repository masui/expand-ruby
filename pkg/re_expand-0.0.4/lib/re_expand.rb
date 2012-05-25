# -*- coding: utf-8 -*-
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module ReExpand
  VERSION = '0.0.4'
end

require 'Generator'
require 'Node'
require 'Asearch'
require 'Scanner'

class String
  # ExpandHelp用のライブラリを利用
  def expand(filterpat=' ')
    g = ReExpand::Generator.new
    g.add(self,"\#{$1}\t\#{$2}\t\#{$3}\t\#{$4}\t\#{$5}\t\#{$6}\t\#{$7}\t\#{$8}\t\#{$9}")
    strings = []
    #if filterpat.class == Regexp && block then
    #  g.generate(' ',block)
    #  return
    if filterpat.class == String then
      m = g.generate(filterpat)
      matched = m[0].length > 0 ? m[0] : m[1].length > 0 ? m[1] : m[2]
      strings = matched.collect { |r|
        r[0]
      }
    else
      matched = g.generate(' ')[0]
      if filterpat.class == Regexp then
        matched = matched.find_all { |r|
          filterpat.match(r[0])
        }
      end
      strings = matched.collect { |r|
        r[0]
      }
    end

    if block_given? then
      matched.each { |m|
        yield m[0], m[1].split(/\t/)
      }
    else
      strings
    end
  end
end

