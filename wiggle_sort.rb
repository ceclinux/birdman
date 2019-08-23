# @param {Integer[]} nums
# @return {Void} Do not return anything, modify nums in-place instead.
def wiggle_sort(nums)
    ret = Array.new(nums.length)
    nums = first_k(nums, nums.length / 2)
    # p nums
    i = 0
    while i < ret.length 
        ret[i] = nums.shift
        i += 2
    end
    i = 1
    while i < ret.length
        ret[i] = nums.pop
        i += 2
    end
    ret
end

def first_k(nums, k)
    rand_index = 0
    less = []
    great = []
    equal = []
    rand_num = nums[rand_index]
    nums.each do |num|
        if num > rand_num
            great << num
        elsif num == rand_num
            equal << num
        else
            less << num
        end   
    end
    if k >= less.length && k <= less.length + equal.length
        return less + equal + great
    elsif k < less.length
        return first_k(less, k) + equal + great
    else
        return less + equal + first_k(great, k - less.length - equal.length)
    end
end

p wiggle_sort([1,5,1,1,6,4])