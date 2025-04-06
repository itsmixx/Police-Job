
# 🚔 Simple Police Job System

---

## ⚙️ Features

- ✅ Admin-only commands to assign police role
- ✅ Police-only commands to arrest or release players
- ✅ Handcuff animation support
- ✅ Clean and modular code (client/server/commands split)
- ✅ ACE permission-based security
- ✅ Supports **ESX**, **QBCore**, and **Standalone** frameworks
- ✅ Database integration for arrests (supports `oxmysql`, `mysql-async`, and `ghmattimysql`)

---

## 🛠️ Setup Instructions

1. **Extract the resource folder** into your server's `resources/` directory.
2. **Ensure it's started in your `server.cfg`:**

   ```cfg
   ensure policejob
   ```

3. **Add the following ACE permissions to your `server.cfg`:**

   ```cfg
# ACE Permissions for Admin-only Commands
add_ace group.admin command.becomepolice allow
add_ace group.admin command.removepolice allow

# Assign yourself or staff to the admin group (replace with your real Steam or license ID)
add_principal identifier.steam:110000123456789ab group.admin
# OR, for license:
# add_principal identifier.license:license:abc123... group.admin

   ```

---


## 💻 Commands

### 🔐 Admin-Only (Requires ACE)

| Command               | Description                                 |
|------------------------|---------------------------------------------|
| `/becomepolice [ID]`   | Grants police status to a player by ID      |
| `/removepolice [ID]`   | Removes police status from a player by ID   |

> 🛡️ These commands are protected by ACE permissions and can only be used by group.admin.

### 👮 Police-Only

| Command             | Description                                |
|----------------------|--------------------------------------------|
| `/arrest [ID]`       | Arrests a player (with animation)          |
| `/release [ID]`      | Releases a player from custody             |

> ✅ These commands only work if the player has been made a police officer using `/becomepolice`.

---

## 🎨 Credits

- Scripted by: **[mix]**
- Animations: Rockstar Games (GTA V)
- Compatibility: Standalone Lua Script

---
