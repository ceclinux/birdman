# @param {Integer} n
# @return {Integer}
def count_numbers_with_unique_digits(n)
    ret = 0
    ini = 1
    curr = 9
    1.upto(n) do |t|
        ret += 9 * ini
        ini = ini * curr
        curr  -= 1
    end
    ret + 1
end
