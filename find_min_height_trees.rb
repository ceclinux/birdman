# @param {Integer} n
# @param {Integer[][]} edges
# @return {Integer[]}
require 'set'
def find_min_height_trees(n, edges)
    s = Set.new
    edges.each do |first, second|
        s << first
        s << second
    end

    helper(edges, s)
end

def helper(edges, nodes)
    if nodes.count <= 2
        return nodes.to_a
    end
    h = Hash.new(0)
    edges.each do |first, second|
        h[first] += 1
        h[second] += 1
    end
    borders = h.select do |k, v|
        v == 1
    end.keys
    remain_edges = edges.select do |first, second|
        !(borders.include? first) && !(borders.include? second)
    end
    helper(remain_edges, h.keys - borders)
end

p find_min_height_trees( 4, [[1, 0], [1, 2], [1, 3]])