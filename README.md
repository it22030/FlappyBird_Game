# 🎮 Flappy Bird Game (JavaFX)

A modern desktop remake of the classic **Flappy Bird** game built using **Java**, **JavaFX**, **FXML**, and **MySQL** for high-score tracking and leaderboard management.

---

## ✨ Features

- 🕹️ **Classic Gameplay Mechanics:** Smooth gravity, velocity, flapping physics, and realistic bird rotation/tilting.
- 🚧 **Dynamic Obstacles:** Procedurally randomized pipe heights and collision detection.
- 🏆 **Score & High Score Tracking:** Real-time in-game score updates and persistent high-score record.
- 🗄️ **MySQL Database Integration:**
  - Save player names with their final scores.
  - Automatically fetch all-time highest score.
  - View top leaderboard scores.
- 🎨 **Modern JavaFX UI:** Built with FXML, Canvas rendering, custom graphics, and CSS styling.
- ⚡ **Easy 1-Click Launch:** Preconfigured run scripts (`run.bat` & `run.ps1`) and VS Code settings for seamless compilation and execution.

---

## 🛠️ Tech Stack & Requirements

- **Java JDK:** 17 or higher (tested with Java 21 & Java 25)
- **JavaFX SDK:** Version 21+ (e.g., JavaFX 23)
- **Database:** MySQL 8.0+
- **Build / Run Tools:** Command Line, VS Code, or IntelliJ IDEA

---

## 📁 Project Structure

```text
FLAPPY_GAME/
├── .vscode/                 # VS Code run & debug configurations
├── lib/
│   └── mysql-connector-j.jar# MySQL JDBC connector driver
├── src/
│   └── Application/
│       ├── Controllers/
│       │   ├── DatabaseConnection/
│       │   └── GameController.java       # Game loop, physics & UI logic
│       ├── Database/
│       │   └── DatabaseManager.java      # MySQL query & score management
│       ├── Fxmls/
│       │   ├── game.fxml                 # JavaFX layout
│       │   └── *.png                     # Sprites & background assets
│       ├── styles.css                    # UI styles
│       └── Main.java                     # Application entry point
├── run.bat                  # 1-Click Windows Batch launcher
├── run.ps1                  # 1-Click PowerShell launcher
├── .gitignore
└── README.md
```

---

## 🗄️ Database Setup (MySQL)

Make sure your MySQL server is running. You can set up the database using MySQL CLI or MySQL Workbench:

```sql
CREATE DATABASE IF NOT EXISTS flappybird;
USE flappybird;

CREATE TABLE IF NOT EXISTS scores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    player_name VARCHAR(50) NOT NULL,
    score INT NOT NULL,
    game_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);
```

> **Note:** Configure your database credentials if needed in `src/Application/Database/DatabaseManager.java` and `src/Application/Controllers/DatabaseConnection/DatabaseConnection.java`:
> - **URL:** `jdbc:mysql://localhost:3306/flappybird`
> - **User:** `root`
> - **Password:** `ashik`

---

## 🚀 How to Run the Game

### Method 1: 1-Click Script (Recommended)

Simply run the batch script or PowerShell script from the root directory:

**Windows Command Prompt:**
```cmd
run.bat
```

**PowerShell:**
```powershell
.\run.ps1
```

*(Note: Verify that `JAVAFX_PATH` inside `run.bat`/`run.ps1` points to your local JavaFX SDK `lib` folder).*

---

### Method 2: VS Code

1. Open this repository folder in **VS Code**.
2. Open `src/Application/Main.java`.
3. Click the **Run Code** (Play) button in the top-right corner, or press `F5` (Start Debugging).

---

### Method 3: IntelliJ IDEA

1. Open the project in **IntelliJ IDEA**.
2. Go to **File** ➔ **Project Structure** ➔ **Libraries**:
   - Add the JavaFX SDK `lib` folder.
   - Add `lib/mysql-connector-j.jar`.
3. In **Run/Debug Configurations**, set VM options if required:
   ```text
   --module-path "<path-to-javafx-sdk>/lib" --add-modules javafx.controls,javafx.fxml
   ```
4. Run `Main.java`.

---

## 🎮 Controls

| Action | Control |
| :--- | :--- |
| **Flap / Jump** | `SPACEBAR` or `UP ARROW` |
| **Start Game** | Click **Start Game** Button |
| **Restart Game** | Click **Play Again** Button |
| **Save Score** | Click **Save Score** Button (prompt for player name) |
| **Leaderboard** | Click **Show Top Scores** Button |

---

## 👤 Author

- **Ashikullah** ([@it22030](https://github.com/it22030))
- Department of Information Technology, MBSTU

---

## 📝 License

This project is open-source and available under the [MIT License](LICENSE).
