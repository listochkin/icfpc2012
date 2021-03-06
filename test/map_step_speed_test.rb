require File.expand_path('../test_helper', __FILE__)
require 'benchmark'
include Benchmark          # we need the CAPTION and FORMAT constants

class MapStepSpeedTest < Test::Unit::TestCase
  def test_step1
      map1_string = <<-'EOS'.gsub /^.*?-/, ''
        -#######################################
        -#****................#..1...\\\\\\\B..#
        -#R.......##############################
        -#.. ..................................#
        -#.. ........       \            ......#
        -#.. .*. ....**.*...#....... ..........#
        -#.. ... ....\\\\...#.A..... ..........#
        -#.. ... ....\ .....#.......    *  \\..#
        -#.. ... ....\......#....... ..........#
        -#.. ... ....\......#....... ..........#
        -#.. ... ...........#................**#
        -#..\\\\\...........#................\\#
        -########### ############## ############
        -#...*.................................#
        -#....*..................        ......#
        -#... .*....*.............. ..... .....#
        -#....*2*........########.. ..... .....L
        -#...*...*.......#\\\#..... ...*.......#
        -#.....\\\.......#\\\#....**..***......#
        -#....    .......#\\\#*................#
        -#...............#\\\#*...**...*.......#
        -#...............#.....................#
        -######       ############## ### #######
        -#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
        -#######################################
        -
        -Trampoline A targets 1
        -Trampoline B targets 2
      EOS

    map1_res_string = <<-'EOS'.gsub /^.*?-/, ''
      -#######################################
      -#    ................#..            ..#
      -#**   ...##############################
      -#..  .................................#
      -#..  .......                      ....#
      -#..  *. ....  . .  #. ..... ..... ....#
      -#..  .. ....   *   #. ..... ..... ....#
      -#..  .. .... *... .#.......    *    ..#
      -#..  .. .... .... .#....... ....... ..#
      -#..  ..     *.... .#....... ....... ..#
      -#..      ........ .#...........       #
      -#..* *   ..       .#......      ...* *#
      -########### ############## ############
      -#...*...    .............. ...........#
      -#....*.. ...............        ......#
      -#... . . .. ...                       #
      -#....      *    ########.. ..... ....RO
      -#...**    ......#   #..    ...*.......#
      -#.....    ......#   #.. .**..***......#
      -#.... * *.......#   # . ..............#
      -#...... ........#   #      ...*.......#
      -#...... ........#..  * * ** ..........#
      -######       ############## ### #######
      -#      *                              #
      -#######################################
    EOS
    map1 = Icfpc2012::Map.new(map1_string)
    map1_res = Icfpc2012::Map.new(map1_res_string)
    commands = "RRRRLDDDDDDDDRDLLRURRDRRUURRRRUUURRRRRRUURRRRRRRRRRRRRRRDDDRRDDDDRRLULLLLLDLLLLLDDDDDDLLLDDDUDDDLLLLUUUULLDRDLDRRDRRRURRDRRRDDRRRRRRRRRRLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLRRRRRRUUUUULRRRUULDLLLRRRUUUURRRUURRRRRRUUUUUUURRRRDDRRRRRRRRRRRRRRRRRRRRURRRRRRRRRRRRRRRRRRRRRRD"
    
    map2 = map1
    commands.chars.to_a.each {|cmd| map2 = map2.step(cmd)}

    assert_equal(map1_res.map_array.inspect, map2.map_array.inspect)
  end

  def test_step2
      map1_string = <<-'EOS'.gsub /^.*?-/, ''
        -#######################################
        -#****................#..1...\\\\\\\B..#
        -#R.......##############################
        -#.. ..................................#
        -#.. ........       \            ......#
        -#.. .*. ....**.*...#....... ..........#
        -#.. ... ....\\\\...#.A..... ..........#
        -#.. ... ....\ .....#.......    *  \\..#
        -#.. ... ....\......#....... ..........#
        -#.. ... ....\......#....... ..........#
        -#.. ... ...........#................**#
        -#..\\\\\...........#................\\#
        -########### ############## ############
        -#...*.................................#
        -#....*..................        ......#
        -#... .*....*.............. ..... .....#
        -#....*2*........########.. ..... .....L
        -#...*...*.......#\\\#..... ...*.......#
        -#.....\\\.......#\\\#....**..***......#
        -#....    .......#\\\#*................#
        -#...............#\\\#*...**...*.......#
        -#...............#.....................#
        -######       ############## ### #######
        -#\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\#
        -#######################################
        -
        -Trampoline A targets 1
        -Trampoline B targets 2
      EOS

    map1_res_string = <<-'EOS'.gsub /^.*?-/, ''
      -#######################################
      -#    ................#..            ..#
      -#**   ...##############################
      -#..  .................................#
      -#..  .......                      ....#
      -#..  *. ....  . .  #. ..... ..... ....#
      -#..  .. ....   *   #. ..... ..... ....#
      -#..  .. .... *... .#.......    *    ..#
      -#..  .. .... .... .#....... ....... ..#
      -#..  ..     *.... .#....... ....... ..#
      -#..      ........ .#...........       #
      -#..* *   ..       .#......      ...* *#
      -########### ############## ############
      -#...*...    .............. ...........#
      -#....*.. ...............        ......#
      -#... . . .. ...                       #
      -#....      *    ########.. ..... ....RO
      -#...**    ......#   #..    ...*.......#
      -#.....    ......#   #.. .**..***......#
      -#.... * *.......#   # . ..............#
      -#...... ........#   #      ...*.......#
      -#...... ........#..  * * ** ..........#
      -######       ############## ### #######
      -#      *                              #
      -#######################################
    EOS
    map1 = Icfpc2012::Map.new(map1_string)
    map1_res = Icfpc2012::Map.new(map1_res_string)
    commands = "RRRRLDDDDDDDDRDLLRURRDRRUURRRRUUURRRRRRUURRRRRRRRRRRRRRRDDDRRDDDDRRLULLLLLDLLLLLDDDDDDLLLDDDUDDDLLLLUUUULLDRDLDRRDRRRURRDRRRDDRRRRRRRRRRLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLRRRRRRUUUUULRRRUULDLLLRRRUUUURRRUURRRRRRUUUUUUURRRRDDRRRRRRRRRRRRRRRRRRRRURRRRRRRRRRRRRRRRRRRRRRD"
    
    premaps = Array.new
    maps = Array.new
    (0..2).each {|i| premaps[i] = map1}
    (0..10).each {|i| maps[i] = map1}
    
    n = maps.size
    n_cmd = n * commands.size
    Benchmark.benchmark(CAPTION, 7, FORMAT, ">total  :", ">avg    :", ">avg map:", ">avg cmd:") do |x|
      t1 = x.report("premap  :")  {premaps.each_index{|i| commands.chars.to_a.each {|c| premaps[i] = premaps[i].step(c)} } }
      
      t2 = x.report("map     :") {maps.each_index{|i| commands.chars.to_a.each{|c| maps[i] = maps[i].step(c)} } }
      [t1+t2, (t1+t2)/2, t2 / n, t2 / n_cmd]
    end
   
    premaps.each do |map|
      assert_equal(map1_res.map_array.inspect, map.map_array.inspect)
    end
    maps.each do |map|
      assert_equal(map1_res.map_array.inspect, map.map_array.inspect)
    end
  end

end
