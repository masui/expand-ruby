# -*- coding: utf-8 -*-
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module ReExpand
  VERSION = '0.0.7'
end

require 'Generator'
require 'Node'
require 'Scanner'

class String
  #
  # restr.expand { |a| ... }
  # restr.expand(' abc '){ |a| ... }    パタンを指定
  # restr.expand(' abc ',1){ |a| ... }  許容曖昧度を指定
  #
  def expand(filterpat=' ',ambig=0,&block)
    g = ReExpand::Generator.new
    g.add(self,'')
    strings = []

    if block_given? then
      g.generate(filterpat,ambig,&block)
    else
      m = g.generate(filterpat)
      matched = m[0].length > 0 ? m[0] : m[1].length > 0 ? m[1] : m[2]
      strings = matched.collect { |r|
        r[0]
      }
    end
  end
end

