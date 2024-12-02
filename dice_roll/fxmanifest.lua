fx_version 'cerulean'
game 'rdr3'

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

author 'hannibal lickedher'
description 'Six Sided Dice Roll'
version '1.0.0'


client_scripts {
    "client.lua"
}

server_scripts {
    "config.lua",
    "server.lua"
}


ui_page "nui/index.html"

files {
    "nui/index.html",
    "nui/images/*.png"
}
