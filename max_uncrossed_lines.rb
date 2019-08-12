# @param {Integer[]} a
# @param {Integer[]} b
# @return {Integer}
def max_uncrossed_lines(a, b)
    dp = Array.new(a.length) {|t| Array.new(b.length)}
    1.upto(a.length) do |x|
        1.upto(b.length) do |y|
            if a[x] == b[y]
                dp[x][y] = dp[x - 1][y - 1]
            else
                dp[x][y] = [dp[x - 1][y], dp[x][y - 1]].max
            end
        end
    end
    return dp[a.length][b.length]
end