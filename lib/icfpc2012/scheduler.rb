module Icfpc2012
  class Scheduler

    LIGHT_SEARCH_WIDTH = 3
    attr_accessor :map_origin, :best_solution, :best_score

    def initialize(map)
      self.map_origin = map
      self.best_solution = ""
      self.best_score = 0
    end

    def recurse(map, path_so_far, score_so_far, depth)

      if(score_so_far > self.best_score)
        self.best_score = score_so_far
        self.best_solution = path_so_far
      end

      map.to_s.each_line { |line| puts line }

      pf = Icfpc2012::PathFinder.new(map)
      pf.do_wave(map.robot.position, Icfpc2012::PathFinder::MIND_ROCKS)
      #pf.print_distmap

      if(map.remaining_lambdas == 0)
        path = Icfpc2012::CoordHelper.coords_to_actions(pf.trace_shortest_path_to(map.lift_position))

        return if(path == 'E')

        wp = Icfpc2012::WaypointPath.new(map, path)
        puts l.inspect
        puts path
        puts wp.waypoints.last.map.score

        if(wp.valid?)
          path_so_far += path
          score_so_far = wp.waypoints.last.map.score

          if(score_so_far > self.best_score)
            self.best_score = score_so_far
            self.best_solution = path_so_far
          end
        end
      end

      # iterate thru
      max_iterations = LIGHT_SEARCH_WIDTH
      interation = 0
      lambdas = pf.enum_closest_lambdas
      lambdas.each { |l|

        path = Icfpc2012::CoordHelper.coords_to_actions(pf.trace_shortest_path_to(l))

        #next if(path == 'E')

        wp = Icfpc2012::WaypointPath.new(map, path)

        puts l.inspect
        puts path
        puts wp.waypoints.last.map.score

        if(wp.valid?)
          recurse(wp.waypoints.last.map, path_so_far + path, wp.waypoints.last.map.score, depth + 1)
        end

        interation+=1
        break if interation > max_iterations
      }

    end

    def solve
      recurse(map_origin, "", 0, 0)
      [best_solution, best_score]
    end
  end
end