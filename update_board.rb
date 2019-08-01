# @param {Character[][]} board
# @param {Integer[]} click
# @return {Character[][]}
def update_board(board, click)
    reveal(board, click)
    board
end

def reveal(board, coor)
    x = coor[0]
    y = coor[1]
    if board[x][y] == 'M'
        board[x][y] = 'X'
        return
    end
    count_mines = 0
    reveal_list = []
    adjact = true
    if x - 1 >= 0
        if board[x - 1][y] == 'M'
            count_mines+=1
            adjact = false
        elsif board[x - 1][y] == 'E'
            reveal_list << [x-1, y]
        else 
           
        end
        if y - 1 >= 0
            if board[x - 1][y - 1] == 'M'
                count_mines += 1
                adjact = false
            elsif board[x - 1][y - 1] == 'E'
                reveal_list <<  [x-1, y-1]
            else 
               
            end
        end
        if y + 1 < board[0].length
            if board[ x - 1][y + 1] == 'M'
                count_mines +=1
                adjact = false
            elsif board[ x - 1][y + 1] == 'E'
             reveal_list << [x-1, y+1]
            else 
                
            end
        end
    end
    if x + 1 < board.length
        if board[x + 1][y] == 'M'
            count_mines+=1
            adjact = false
        elsif board[x + 1][y] == 'E'
            reveal_list <<  [x+1, y]
        else 
           
        end
        if y - 1 >= 0
            if board[x + 1][y - 1] == 'M'
                count_mines += 1
                adjact = false
            elsif board[x + 1][y - 1] == 'E'
                reveal_list << [x+1, y - 1]
            else 
                
            end
        end
        if y + 1 < board[0].length
            if board[ x + 1][y + 1] == 'M'
                count_mines +=1
                adjact = false
            elsif board[ x + 1][y + 1] == 'E'
                reveal_list << [x+1, y+1]
            else 
                
            end
        end
    end
    if y - 1 >= 0
        if board[x][y - 1]  == 'M'
            count_mines += 1
            adjact = false
        elsif board[x][y - 1]  == 'E'
            reveal_list <<  [x, y - 1]
        else 
           
        end
    end
    if y + 1 < board[0].length
        if board[x][y + 1]  == 'M'
            count_mines += 1
            adjact = false
        elsif board[x][y + 1]  == 'E'
            reveal_list << [x, y + 1]
        end
    end
    if count_mines == 0 && adjact
        board[x][y] = 'B'
        reveal_list.each do |t|
            reveal(board, t)
        end
    else
        board[x][y] = count_mines.to_s
    end
    
end