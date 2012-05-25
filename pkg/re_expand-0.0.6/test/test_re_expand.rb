# -*- coding: utf-8 -*-
require File.dirname(__FILE__) + '/test_helper.rb'

module ReExpand
  class TestReExpand < Test::Unit::TestCase
    
    def setup
    end
    
    def test_truth
      assert true
    end

    def test_array
      e = "(月|火|水|木|金)曜(1|2|3|4|5|6)限".expand
      assert_equal e.class, Array
      assert_equal e.length, 30
    end

    def test_2
      "(月|火|水|木|金)曜(1|2|3|4|5|6)限".expand { |s,a|
        assert_equal a.length, 2
      }

      e = "(月|火|水|木|金)曜(1|2|3|4|5|6)限".expand(' 1 ')
      assert_equal e.length, 5

      '(ab|cd)*'.expand(/bc/){ |s,a|
        assert_equal a.length, 1
        assert s =~ /abcd/
      }

    end

  end
end
