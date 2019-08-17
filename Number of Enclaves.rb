# @param {Integer[][]} a
# @return {Integer}
def num_enclaves(a)
    
    dfs(a) 
end

def dfs(arr)
    ret = 0
    searched_arr = Array.new(arr.size, false) {|t| Array.new( arr[0].size, false)}
    0.upto(arr.size - 1) do |x| 
        0.upto(arr[0].size - 1) do |y|
            if(searched_arr[x][y])
                next
            else
                if arr[x][y] == 1
                    
                    if x == 0 || y == 0 || x == arr.size - 1 || y == arr[0].size - 1
                        search_inside(x, y, arr, searched_arr)
                    end 
                end
            end    
        end
    end

    0.upto(arr.size - 1) do |x| 
        0.upto(arr[0].size - 1) do |y|
            if arr[x][y] == 1 && !searched_arr[x][y]
                ret += 1
            end
        end
    end
    ret
end

def search_inside(x, y, arr, searched_arr)
    searched_arr[x][y] = true
    if x + 1 < arr.length && arr[x + 1][y] == 1 && !searched_arr[x+1][y]
        search_inside(x + 1, y, arr, searched_arr)
    end
    if y + 1 < arr[0].length && arr[x][y+1] == 1 && !searched_arr[x][y+1]
        search_inside(x, y + 1, arr, searched_arr)
    end
    if x - 1 >= 0 && arr[x - 1 ][y] == 1 && !searched_arr[x - 1][y]
        search_inside(x - 1, y, arr, searched_arr)
    end
    if y - 1 >= 0 && arr[x][y- 1] == 1  && !searched_arr[x][y - 1]
        search_inside(x, y - 1, arr, searched_arr)
    end
end

p num_enclaves( [
    [0,0,0,1,1,1,0,1,0,0],
    [1,1,0,0,0,1,0,1,1,1],
    [0,0,0,1,1,1,0,1,0,0],
    [0,1,1,0,0,0,1,0,1,0],
    [0,1,1,1,1,1,0,0,1,0],
    [0,0,1,0,1,1,1,1,0,1],
    [0,1,1,0,0,0,1,1,1,1],
    [0,0,1,0,0,1,0,1,0,1],
    [1,0,1,0,1,1,0,0,0,0],
    [0,0,0,0,1,1,0,0,0,1]
]
)
p num_enclaves( [[0,0,0,0],[1,0,1,0],[0,1,1,0],[0,0,0,0]])