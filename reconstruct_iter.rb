# @param {String[][]} tickets
# @return {String[]}
def find_itinerary(tickets)
    h1 = Hash.new() { []}
    iter = ["JFK"]
    

    tickets.each do |from, to|
        h1[from] = h1[from] << to
    end

    h1.each do |key, val|
        h1[key] = val.sort
    end

    while !h1[iter.last].empty?
        t = h1[iter.last].shift
        iter << t
    end

    
    iter
end

p find_itinerary([["JFK","SFO"],["JFK","ATL"],["SFO","ATL"],["ATL","JFK"],["ATL","SFO"]])