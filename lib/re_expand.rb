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
  # restr.expand(1){ |a| ... }          許容曖昧度を指定
  # restr.expand(' abc ',1){ |a| ... }  両方指定
  #
  def expand(arg1=nil,arg2=nil,&block)
    g = ReExpand::Generator.new
    g.add(self,'')
    strings = []

    if block_given? then
      filterpat = ' '
      ambig = 0
      if arg2.nil? && arg1.class == Fixnum then
        ambig = arg1
      elsif arg2.nil? && arg1.class == String then
        filterpat = arg1
      elsif arg1 && arg2 then
        if arg1.class == Fixnum then
          ambig = arg1
          filterpat = arg2
        else
          filterpat = arg1
          ambig = arg2
        end
      end
      g.generate(filterpat,ambig,&block)
    else
      filterpat = ' '
      filterpat = arg1 if arg1
      m = g.generate(filterpat)
      matched = m[0].length > 0 ? m[0] : m[1].length > 0 ? m[1] : m[2]
      strings = matched.collect { |r|
        r[0]
      }
    end
  end
end

