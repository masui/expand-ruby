# -*- coding: utf-8 -*-
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module ReExpand
  VERSION = '0.0.3'
end

require 'Generator'
require 'Node'
require 'Asearch'
require 'Scanner'

class String
  # ExpandHelp用のライブラリを利用
  def expand(filterpat=' ')
    g = ReExpand::Generator.new
    g.add(self,'')
    strings = []
    #if filterpat.class == Regexp && block then
    #  g.generate(' ',block)
    #  return
    if filterpat.class == String then
      matched = g.generate(filterpat)
      res = matched[0].length > 0 ? matched[0] : matched[1].length > 0 ? matched[1] : matched[2]
      strings = res.collect { |r|
        r[0]
      }
    else
      matched = g.generate(' ')
      strings = matched[0].collect { |r|
        r[0]
      }
      if filterpat.class == Regexp then
        strings = strings.find_all { |s|
          filterpat.match(s)
        }
      end
    end

    if block_given? then
      strings.each { |string|
        yield string
      }
    else
      strings
    end
  end
end

