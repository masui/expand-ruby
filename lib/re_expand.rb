# -*- coding: utf-8 -*-
$:.unshift(File.dirname(__FILE__)) unless
  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

module ReExpand
  VERSION = '0.0.7'
end

require 'Generator'
require 'Node'
require 'Scanner'

# require 'asearch'

class String
  #
  # str.expand(' abc '){ |a| ... }
  # str.expand(1){ |a| ... }
  # str.expand(' abc ',1){ |a| ... }
  #
  def expand(arg1=nil,arg2=nil,&block)
    g = ReExpand::Generator.new
    # g.add(self,"\#{$1}\t\#{$2}\t\#{$3}\t\#{$4}\t\#{$5}\t\#{$6}\t\#{$7}\t\#{$8}\t\#{$9}")
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
        filterpat = arg1
        ambig = arg2
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

#    if filterpat then
#      m = g.generate(filterpat)
#      matched = m[0].length > 0 ? m[0] : m[1].length > 0 ? m[1] : m[2]
#      strings = matched.collect { |r|
#        r[0]
#      }
#    else
#      matched = g.generate(' ')[0]
#      strings = matched.collect { |r|
#        r[0]
#      }
#    end
#
#    if block_given? then
#      matched.each { |m|
#        # yield m[0], m[1].split(/\t/)
#        yield [m[0]] + m[1].split(/\t/)
#      }
#    else
#      strings
#    end
  end
end

