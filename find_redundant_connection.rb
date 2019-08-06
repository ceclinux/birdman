# @param {Integer[][]} edges
# @return {Integer[]}
require 'set'
def find_redundant_connection(edges)
    edge_coll = []
    edges.each do |edge|
        contains = []
        edge_coll.each do |coll|
            if (coll.points.include? edge[0]) || (coll.points.include? edge[1])
                contains << coll
            end
        end
        if contains.size > 1
            contains.first.add(edge)
            t = contains.reduce(&:merge)
            contains.each {|t| edge_coll.delete(t)}
            edge_coll << t
        elsif contains.empty?
            coll = EdgeColl.new
            coll.add(edge)
            edge_coll << coll 
        else
            contains.first.add(edge)
        end
    end
    (edge_coll.find {|t| t.circle?}).last
end

class EdgeColl
    attr_accessor :points, :edges, :last, :circle

    def initialize
        @circle = false
        @edges = []
        @points = Set.new
        @last = nil
    end
    
    def add(edge)
        if (@points.include? edge[0]) && (@points.include? edge[1])
            @circle=true
            @last=edge
        end
        @edges << edge
        @points << edge[0] << edge[1]
    end

    def merge(coll)
        @edges += coll.edges
        @points += coll.points
        @last = coll.last || @last
        @circle = coll.circle || @circle
        self
    end

    def circle?
        @circle
    end
end

p find_redundant_connection([[3,7],[1,4],[2,8],[1,6],[7,9],[6,10],[1,7],[2,3],[8,9],[5,9]])
