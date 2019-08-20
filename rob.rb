# @param {Integer[]} nums
# @return {Integer}
def rob(nums)
    return 0 if nums.empty?
    return nums.first if nums.size == 1
    robbed = Array.new(nums.size, 0)
    unrobbed = Array.new(nums.size, 0)
    1.upto(nums.length - 1) do |t|
        num = nums[t]
        robbed[t] = [unrobbed[t - 1] + num, robbed[t - 2]].max
        unrobbed[t] = [unrobbed[t - 1], robbed[t - 1]].max
    end
    first_robbed = [robbed.last, unrobbed.last].max

    robbed = Array.new(nums.size - 1, 0)
    unrobbed = Array.new(nums.size - 1, 0)
    robbed[0] = nums.first
    1.upto(nums.length - 2) do |t|
        num = nums[t]
        robbed[t] = [unrobbed[t - 1] + num, robbed[t - 2]].max
        unrobbed[t] = [unrobbed[t - 1], robbed[t - 1]].max
    end
    p robbed
    p unrobbed
    [robbed.last, unrobbed.last, first_robbed].max
end

p rob([0])