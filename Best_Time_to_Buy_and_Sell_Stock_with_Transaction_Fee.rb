# @param {Integer[]} prices
# @param {Integer} fee
# @return {Integer}
def max_profit(prices, fee)
    sold = Array.new(prices.length)
    bought = Array.new(prices.length)
    sold[0] = 0
    bought[0] = -prices[0]
    1.upto(prices.length - 1) do |t|
      sold[t] = [bought[t - 1] + prices[t] - fee, sold[t - 1]].max
p sold
      bought[t] = [bought[t - 1], sold[t - 1] - prices[t]].max
      p bought

    end
    sold[prices.length - 1]
end

p max_profit(  [1,3,7,5,10,3], 3
    )