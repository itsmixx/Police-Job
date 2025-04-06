-- Framework Configuration
-- Choose the framework the server is using. Options: 'esx', 'qbcore', 'vrp', 'standalone'
framework = 'esx'  -- Change to 'qbcore' for QBCore, 'vrp' for vRP, 'standalone' for no framework

-- Police Job Name
policeJobName = 'police'

-- Arrest Duration (in seconds)
arrestDuration = 300

-- Messages Configuration
becomePoliceMessage = "^1Police Job: You are now a police officer!"
arrestedMessage = "^1Police Job: You are now in custody!"
releasedMessage = "^1Police Job: You have been released from custody!"

-- Animation Settings
enableArrestAnimation = true  -- Enable or disable arrest animations
arrestAnimationDict = "mp_arresting"
arrestAnimationName = "idle"
arrestAnimationDuration = 5000  -- Duration in milliseconds (5 seconds)

enableReleaseAnimation = true  -- Enable or disable the release animation
releaseAnimationDict = "mp_arresting"
releaseAnimationName = "release"

-- Database Configuration (optional for ESX/QBCore)
database = 'oxmysql'  -- Options: 'mysql-async', 'ghmattimysql', 'oxmysql'
