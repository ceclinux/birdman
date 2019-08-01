# @param {Integer[]} weights
# @param {Integer} d
# @return {Integer}
def ship_within_days(weights, d)
    max = weights.sum
    min = weights.max
    while min <= max do
        mid = (min + max) / 2
        if fit?(weights, d, mid)
            max = mid - 1
        else
            min = mid + 1
        end
    end
    max + 1
end

def fit?(weights, d, mid)
    total = 0
    day = 1
    weights.each do |t|
        if (total += t) > mid
            day += 1
            total = t
        end
        
    end
    day <= d
end
p ship_within_days([1,2,3,1,1],4)