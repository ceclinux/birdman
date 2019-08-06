# @param {Integer[]} answers
# @return {Integer}
def num_rabbits(answers)
    h = Hash.new(0)
    answers.each do |t|
        h[t] += 1
    end
    h.map do |k, v|
        if k >= v
            k + 1
        else
            t = (v / (k + 1) ) * ( k + 1)
            if v % (k + 1) != 0
                t += (k + 1)
            end
            t
        end
    end.sum
end