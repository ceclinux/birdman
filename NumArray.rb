class NumArray

    =begin
        :type nums: Integer[]
    =end
        def initialize(nums)
            return if nums.length == 0
            @nums = nums
            @block_len = (Math.sqrt nums.length).to_i
            @blocks = Array.new((nums.length.to_f / @block_len).ceil, 0)
            nums.each_with_index do |num, i|
                @blocks[i / @block_len] += num
            end
        end
    
    =begin
        :type i: Integer
        :type val: Integer
        :rtype: Void
    =end
        def update(i, val)
           
            @blocks[i / @block_len] += (val - @nums[i])
             @nums[i] = val
        end
    
    
    =begin
        :type i: Integer
        :type j: Integer
        :rtype: Integer
    =end
        def sum_range(i, j)
            return 0 if @nums.empty?
            return @nums[i] if i == j
            ret = 0
            start_block_index = (i.to_f/ @block_len).ceil
            end_block_index = (j.to_f / @block_len).floor
            # p start_block_index
            # p end_block_index
            start_block_index.upto(end_block_index - 1) do |t|
                ret += @blocks[t]
            end
            i.upto(@block_len * start_block_index - 1) do |t|
                ret += @nums[t]
            end
            (@block_len * (end_block_index) ).upto(j) do |t|
                ret += @nums[t]
            end
            ret
        end
    
    end
    
    