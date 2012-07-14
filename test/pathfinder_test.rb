require File.expand_path('../test_helper', __FILE__)

class PathFinderTest < Test::Unit::TestCase
  def test_wave
    map1_string = <<EOS
####L
#*.\\#
# R #
#####
EOS
    map1 = Icfpc2012::Map.new(map1_string)
    pf1 = Icfpc2012::PathFinder.new(map1)
    pf1.do_wave(map1.robot.x, map1.robot.y, false)
    #pf1.trace_distmap
  end

  def test_wave_big
    map1 = Icfpc2012::Map.new(File.read('../maps/contest6.map.txt'))
    pf1 = Icfpc2012::PathFinder.new(map1)
    pf1.do_wave(map1.robot.x, map1.robot.y, true)
    pf1.trace_distmap
  end
end