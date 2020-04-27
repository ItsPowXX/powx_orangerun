fx_version 'adamant'
games { 'gta5' };

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",

    "src/components/*.lua",

    "src/menu/elements/*.lua",

    "src/menu/items/*.lua",

    "src/menu/panels/*.lua",

    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",

}

client_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'cl_orange.lua'
}

server_scripts {
    '@es_extended/locale.lua',
    'config.lua',
    'sv_orange.lua'
}


dependencies {
	'es_extended'
}

--By PowX#2629