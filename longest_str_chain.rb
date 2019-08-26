# @param {String[]} words
# @return {Integer}
@max_len = 0
def longest_str_chain(words)
    h = Hash.new(0)
    sorted_words = words.sort_by(&:length)
    ret = 0
    sorted_words.each do |word|
        len_max = 0
        0.upto(word.length - 1) do |i|
            sub_word = word[0...i] + word[(i + 1)..(-1)]
            len_max = [h[sub_word], len_max].max
        end
        h[word] = len_max + 1
        ret = [ret, h[word]].max
    end
    ret
    
end

p longest_str_chain(["ksqvsyq","ks","kss","czvh","zczpzvdhx","zczpzvh","zczpzvhx","zcpzvh","zczvh","gr","grukmj","ksqvsq","gruj","kssq","ksqsq","grukkmj","grukj","zczpzfvdhx","gru"]
)