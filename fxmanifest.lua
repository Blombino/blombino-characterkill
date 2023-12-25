fx_version 'cerulean'
game 'gta5'
lua54 'yes'

author 'db0pz'
discord 'https://discord.gg/akfNwTTNPu'
authors 'Blombino Community'

shared_scripts { 
	'@ox_lib/init.lua',
	'@es_extended/imports.lua'
}

client_scripts {
	'client.lua'
}

server_scripts {
    '@oxmysql/lib/MySQL.lua',
    'server.lua',
}