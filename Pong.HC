// Pong Game with Scoring in TempleOS
#include "std/Kernel.h"

// dunno if this works, but it seems to be working
PongGame() {
    const xMax = 80, yMax = 25;
    
    int ballX = xMax / 2, ballY = yMax / 2;
    int ballDX = 1, ballDY = 1;
    int leftPaddleY = yMax / 2, rightPaddleY = yMax / 2;
    const paddleHeight = 3;
    bool gameRunning = TRUE;

    int leftScore = 0, rightScore = 0;

    Draw() {
        ClrScr();
        
        PrintAt(2, leftPaddleY - paddleHeight - 1, "P1: %d", leftScore);
        for (int i = -paddleHeight; i <= paddleHeight; ++i)
            if (leftPaddleY + i >= 0 && leftPaddleY + i < yMax)
                PlotChar(2, leftPaddleY + i, '|', WHITE);
        
        PrintAt(xMax - 10, rightPaddleY - paddleHeight - 1, "P2: %d", rightScore);
        for (int i = -paddleHeight; i <= paddleHeight; ++i)
            if (rightPaddleY + i >= 0 && rightPaddleY + i < yMax)
                PlotChar(xMax - 3, rightPaddleY + i, '|', WHITE);
        
        PlotChar(ballX, ballY, 'O', YELLOW);

        DispFlush();
    }

    UpdateBall() {
        ballX += ballDX;
        ballY += ballDY;

        if (ballY <= 0 || ballY >= yMax - 1)
            ballDY = -ballDY;

        if (ballX == 3 && ballY >= leftPaddleY - paddleHeight && ballY <= leftPaddleY + paddleHeight)
            ballDX = -ballDX;

        if (ballX == xMax - 4 && ballY >= rightPaddleY - paddleHeight && ballY <= rightPaddleY + paddleHeight)
            ballDX = -ballDX;

        if (ballX <= 0) {
            ++rightScore;
            ResetBall();
        }
        if (ballX >= xMax - 1) {
            ++leftScore;
            ResetBall();
        }
    }

    UpdatePaddles() {
        if (KeyPeek() == 'W' && leftPaddleY > 1) --leftPaddleY;
        if (KeyPeek() == 'S' && leftPaddleY < yMax - 2) ++leftPaddleY;

        if (KeyPeek() == KEY_UP && rightPaddleY > 1) --rightPaddleY;
        if (KeyPeek() == KEY_DOWN && rightPaddleY < yMax - 2) ++rightPaddleY;
    }

    ResetBall() {
        ballX = xMax / 2;
        ballY = yMax / 2;
        ballDX = -ballDX;
    }

    // Main game loop
    while (gameRunning) {
        UpdatePaddles();
        UpdateBall();
        Draw();
        
        Wait(5);  // TODO: implement an actual Input method for this
    }

    Print("Thanks for playing Pong in TempleOS!\n");
    Print("Rest in Peace Terry!\n");
}