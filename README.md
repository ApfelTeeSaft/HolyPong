# Pong Game in TempleOS

This is a simple Pong game created for TempleOS using the HolyC programming language. Player 1 controls the left paddle with the keys `W` (up) and `S` (down), and Player 2 controls the right paddle with the keypad arrows `↑` (up) and `↓` (down). Each player’s score is displayed above their respective paddles.

## How to Run the Game

### 1. Set Up TempleOS in a Virtual Machine

If you don’t have TempleOS set up yet, follow these steps:

1. **Download TempleOS**:
   - Download the latest ISO from the [TempleOS website](https://templeos.org/).

2. **Set Up TempleOS in VirtualBox**:
   - Install [VirtualBox](https://www.virtualbox.org/) or another virtual machine software.
   - Create a new VM with the following settings:
     - **64-bit OS**
     - **512 MB RAM** or more
     - **1 GB storage** or more
   - Attach the TempleOS ISO to the VM and boot into TempleOS.

### 2. Save the Pong Code in TempleOS

1. Open the editor in TempleOS by pressing `F7` or by typing `Edit` in the command line and pressing `Enter`.
2. Copy the Pong game code (from `Pong.HC` provided in this repository) and paste it into the TempleOS editor.
3. Save the file as `Pong.HC` by pressing `F2`, entering `Pong.HC`, and pressing `Enter`.

### 3. Run the Game

1. Go to the TempleOS command line.
2. Load and run the game by typing:
   ```c
   #include "Pong.HC"
   PongGame();
   ```
3. The game will start, and you can control the paddles as specified.

## Adding a Desktop Shortcut in the Red Sea Menu

You can create a shortcut in the TempleOS "Red Sea" menu for easier access to the Pong game.

1. **Open the Red Sea Menu Configuration File**:
   - At the TempleOS command line, open the `REDSEA.HC` file by typing:
     ```c
     Edit("SYS:/REDSEA.HC");
     ```

2. **Add a Menu Entry for Pong**:
   - Scroll to the bottom of the file or locate an appropriate section to add your entry.
   - Add the following line:
     ```c
     MenuItem("Pong Game", "include \"Pong.HC\"");
     ```
   - This line adds a new menu item labeled "Pong Game" to the Red Sea menu. Selecting it will load and run `Pong.HC`.

3. **Save the File**:
   - Press `F2` to save your changes and exit the editor.

4. **Test the Shortcut**:
   - Reload the Red Sea menu by typing:
     ```c
     RedSeaMenu();
     ```
   - Press `F1` to open the menu. You should see "Pong Game" listed. Select it to run the game.

## Controls

- **Player 1 (Left Paddle)**: Use `W` (up) and `S` (down).
- **Player 2 (Right Paddle)**: Use `↑` (up arrow) and `↓` (down arrow) on the keypad.

## Game Rules

- Each time the ball crosses a side of the screen, the opposite player scores a point.
- The game will reset the ball after each score.
- The scores are displayed above each paddle.

Rest in Peace Terry.