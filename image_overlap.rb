# @param {Integer[][]} a
# @param {Integer[][]} b
# @return {Integer}
require 'set'
def largest_overlap(a, b)
    a_ones_set = Set.new
    a.each_with_index do |n,x|
        n.each_with_index do |m, y|
            if m == 1
                a_ones_set << [x, y]
            end
        end
    end
    b_ones_set = Set.new
    b.each_with_index do |n,x|
        n.each_with_index do |m, y|
            if m == 1
                b_ones_set << [x, y]
            end
        end
    end
    hash = Hash.new(0)
    a_ones_set.each do |a_coor|
        b_ones_set.each do |b_coor|
            key = [a_coor[0] - b_coor[0], a_coor[1] - b_coor[1]]
            hash[key] = hash[key] + 1
        end
    end

    hash.values.max.to_i
end

p largest_overlap([[0]], [[0]]
)