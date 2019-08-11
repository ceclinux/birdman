class TimeMap

    =begin
        Initialize your data structure here.
    =end
        def initialize()
            @hash = {}
        end
    
    
    =begin
        :type key: String
        :type value: String
        :type timestamp: Integer
        :rtype: Void
    =end
        def set(key, value, timestamp)
            if @hash[key]
                
                @hash[key] << [value, timestamp]
            else
                @hash[key] = [[value, timestamp]]
            end
            
        end
    
    
    =begin
        :type key: String
        :type timestamp: Integer
        :rtype: String
    =end
        def get(key, timestamp)
            val = @hash[key]
         
          
            low = 0
            high = val.size - 1
            target = timestamp
            return "" if val.empty? || target < val.first[1]
            while low <= high
                mid = (low + high) / 2
                if target < val[mid][1]
                    high = mid - 1
                elsif target >= val[mid][1]
                    low = mid + 1
                else
                    return val[mid][0]
                end
               
            end
             return val[low - 1][0]
        end
    
    
    end
    
    # Your TimeMap object will be instantiated and called as such:
    # obj = TimeMap.new()
    # obj.set(key, value, timestamp)
    # param_2 = obj.get(key, timestamp)