# 🎯 Cbot - Advanced Roblox PvP Utility Script

![Preview](https://files.catbox.moe/innrgm.png)

Cbot is a powerful, lightweight, and fully open-source Lua script designed for competitive Roblox games like *Da Hood*. It gives you a tactical edge with responsive aimlock, dynamic ESP visuals, and real-time FOV tracking — all customizable with simple keybinds.

Whether you're training, experimenting, or building your own utilities, Cbot is cleanly coded, easy to modify, and built with performance in mind.

---

## 🔧 How to Use

To load Cbot into your game session, just run this line in your executor:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/fredised/Cbot/refs/heads/main/cbot.lua"))()
````

It will automatically initialize and show `[Cbot] Loaded` in the console. You can then toggle all features with your keyboard.

---

## 🛠 Features

| Feature       | Description                                                               |
| ------------- | ------------------------------------------------------------------------- |
| 🎯 Aimlock    | Automatically locks your aim to the nearest visible target                |
| 📦 Box ESP    | Draws a 2D box around each player on your screen                          |
| 🧍 Name ESP   | Displays the player's name above their head                               |
| ❤️ Health ESP | Shows current health below the player’s ESP box                           |
| 🌀 FOV Circle | Draws a customizable circle around your cursor for visualizing aim radius |
| 🧠 Prediction | Smooth aim prediction based on player velocity for more accurate tracking |

All visuals use Roblox’s native `Drawing` API for maximum performance and compatibility.

---

## 🎮 Controls

| Key | Action            |
| --- | ----------------- |
| `Q` | Toggle Aimlock    |
| `P` | Toggle Prediction |
| `E` | Toggle Box ESP    |
| `N` | Toggle Name ESP   |
| `H` | Toggle Health ESP |
| `F` | Toggle FOV Circle |

You can press these keys at any time while in-game to instantly turn features on or off.

---

## 🧪 Prediction and Targeting

Cbot uses basic vector math to calculate where a player will be based on their velocity, making aimlock smoother and more consistent.

You can adjust this by editing the source:

```lua
local PredictionAmount = 0.11 -- Increase for more lead, lower if overcompensating
```

---

## 🖼 Live Preview

Here’s how it looks in-game:

![Cbot in Action](https://files.catbox.moe/innrgm.png)

Clean visuals, minimal lag, and solid targeting even in intense PvP scenarios.

---

## 🔓 Open Source & Licensing

Cbot is 100% open source and released under the **MIT License**. You’re free to:

* Modify it however you want
* Use it in your own projects
* Share it, fork it, or build on it

No permission needed — though credit is always appreciated.

---

## 🙋 FAQ

**Q:** Does this work on all games?
**A:** It’s optimized for *Da Hood* and similar games that use `HumanoidRootPart`, but the core logic can be adapted to others.

**Q:** Is this undetectable?
**A:** It’s client-side only, meaning it doesn’t send anything suspicious to the server. That said, use at your own risk on moderated games.

**Q:** Can I add tracers, skeleton ESP, or a GUI?
**A:** Yes — the code is clean and modular. You can expand it however you'd like.

---

## ✨ Final Notes

Cbot is built for players who want a clean, powerful tool that doesn't get in the way. Whether you're learning Lua scripting or just want an edge in-game, this script is a great base to build on.

---

**Made with ❤️ by fredised** — contributions welcome!

```
