class Trie
    attr_accessor :children, :flag, :value
    def initialize
        @children = Array.new(26)
        @flag = false
        @value = 0
    end
end
class MapSum

        def initialize()
            @trie = Trie.new
            @hash = Hash.new
        end
    
        def insert(key, val)
            trie = @trie
            key.chars.each do |c|
                if trie.children[c.ord - 'a'.ord].nil?
                    trie.children[c.ord - 'a'.ord] = Trie.new
                end
                trie = trie.children[c.ord - 'a'.ord]
                
                trie.value += val
                if @hash[key]
                    trie.value -= @hash[key]
                end
                trie.flag = true
            end
            @hash[key] = val
        end
    
        def sum(prefix)
            trie = @trie
            prefix.chars.each do |c|
                if !trie.children[c.ord - 'a'.ord].nil?
                    trie = trie.children[c.ord - 'a'.ord]
                else
                    return 0
                end
            end
            return trie.value
        end
    
    
    end
    
    # Your MapSum object will be instantiated and called as such:
    # obj = MapSum.new()
    # obj.insert(key, val)
    # param_2 = obj.sum(prefix)