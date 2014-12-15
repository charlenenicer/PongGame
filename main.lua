        
        windowHeight = love.window.getHeight()
        windowWidth = love.window.getWidth()

        dividers = {}
        dividers.height = 50
        dividers.width = 4
        dividers.x = love.graphics.getWidth() / 2 - dividers.width / 2
        
        fontsize = 50
        
        paddles = {}
        paddles.height = 75
        paddles.width = 10
        
        Player1 = {}
        Player1.x = 35
        Player1.y = windowHeight / 2 - paddles.height / 2
        Player1.v = 5
        Player1.score = 0
        
        Player2 = {}
        Player2.x = windowWidth - 35 - paddles.width
        Player2.y = windowHeight / 2 - paddles.height / 2
        Player2.v = 5
        Player2.score = 0
        
        ball = {}
        ball.x = windowWidth / 2
        ball.y = windowHeight / 2
        ball.radius = 5
        ball.v = 5
        
        game = {}
        game.isStarted = true
        game.isPaused = true
        game.isTwoPlayer = false

function love.draw()

        love.graphics.setNewFont(fontsize)

        if game.isStarted and not game.isPaused then
                --Dividing line
                for i = 0, windowHeight, 100 do
                        love.graphics.rectangle("fill", dividers.x, i + 25, dividers.width, dividers.height)
                end
                
                --Scores
                love.graphics.print(Player1.score, 0, windowHeight - fontsize, 0, 1)
                love.graphics.print(Player2.score, windowWidth - 30, windowHeight - fontsize, 0, 1)
                
                --Paddles
                love.graphics.rectangle("fill", Player1.x, Player1.y, paddles.width, paddles.height)
                love.graphics.rectangle("fill", Player2.x, Player2.y, paddles.width, paddles.height)
                
                --Ball
                love.graphics.circle("fill", ball.x, ball.y, ball.radius)
                
        elseif game.isPaused then
        
                love.graphics.print("Paused", windowWidth / 2 - 90, windowHeight / 2 - fontsize / 2, 0, 1)
                
        end
end

function love.update()
        
        if not game.isPaused and game.isStarted then
        
                if love.keyboard.isDown("w") then
                        Player1.y = Player1.y - Player1.v
                end
                
                if love.keyboard.isDown("s") then
                        Player1.y = Player1.y + Player1.v
                end
                
                if game.isTwoPlayer == true then
                
                        if love.keyboard.isDown("up") then
                                Player2.y = Player2.y - Player2.v
                        end
                        
                        if love.keyboard.isDown("down") then
                                Player2.y = Player2.y + Player2.v
                        end
                end
                
                if Player1.y > windowHeight - paddles.height then
                        Player1.y = windowHeight - paddles.height
                end
                
                if Player1.y < 0 then
                        Player1.y = 0
                end
                
                if Player2.y > windowHeight - paddles.height then
                        Player2.y = windowHeight - paddles.height
                end
                
                if Player2.y < 0 then
                        Player2.y = 0
                end
                
        end
end

function love.focus()

end

function love.keypressed()

        if love.keyboard.isDown(" ") and game.isStarted then
                if game.isPaused then
                        game.isPaused = false
                else
                        game.isPaused = true
                end
        end
        
end

function love.quit()

end
