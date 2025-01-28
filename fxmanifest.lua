version "1.0.0"

-- ui_page "dist/index.html"

client_script "./dist/client/*.js"
server_script "./dist/server/*"
shared_script "./dist/shared/*"
files {
    "assets/*"
}

fx_version "cerulean"
games {"gta5"}

dependencies {
    "yarn",
    "cfx-go-builder"
}

cfx_go_config "cfx-go.config.js"