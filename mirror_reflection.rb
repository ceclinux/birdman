# @param {Integer} p
# @param {Integer} q
# @return {Integer}

def mirror_reflection(p, q)
    light(p.to_r, p.to_r, q.to_r, Rational(-q, p))    
end

def light(len, x, y , angle)
    
    if x == len && y == 0
        return 0
    end
    if x == len && y == len
        return 1
    end
    if x == 0 && y == len
        return 2
    end

    t = (if x == 0
        hit_upper(len, x, y, angle) || hit_lower(len, x, y, angle) || hit_right(len, x, y, angle)
    elsif x == len
        hit_upper(len, x, y, angle) || hit_lower(len, x, y, angle) || hit_left(len, x, y, angle)
    elsif y == 0
        hit_upper(len, x, y, angle) || hit_left(len, x, y, angle) || hit_right(len, x, y, angle)
    elsif y == len
        hit_left(len, x, y, angle) || hit_lower(len, x, y, angle) || hit_right(len, x, y, angle)
    end)
    light(len, t[0], t[1], -angle)

end

def hit_upper(len, x, y, angle)
    x += ((len - y) / angle)
    if x >= 0 && x <= len
        p [x, len]
        p "upper"
        return [x, len]
    end
    nil
end

def hit_lower(len, x, y, angle)
    x += ((0 - y) / angle)
    if x >= 0 && x <= len
        p [x, 0]
        p "lower"
        return [x, 0]
    end
    nil
end

def hit_right(len, x, y, angle)
    y  += (len - x) * angle 
    if y >= 0 && y <= len
        p [len, y]
        p "right"
        return [len, y]
    end
    nil
end

def hit_left(len, x, y, angle)
    y  += (0 - x) * angle 
    if y >= 0 && y <= len
        p [0, y]
        p "left"
        return [0, y]
    end
    nil
end

p mirror_reflection(6, 5)