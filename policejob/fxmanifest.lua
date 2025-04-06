fx_version 'cerulean'
game 'gta5'

author 'mixy'
description 'Police job script all frameworks'
version '1.0.0'

client_scripts {
    'client/client.lua'
}

server_scripts {
    'config.lua',
    'server/server.lua',
    'server/commands.lua'
}

lua54 'yes'

dependencies {
    'oxmysql',   
    'mysql-async', 
    'ghmattimysql', 
}
