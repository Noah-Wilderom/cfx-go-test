import { Load } from "wasm_exec-ts"

async function main() {
    try {
        await Load(
            `${GetResourcePath(GetCurrentResourceName())}/build/server/go.wasm`
        )
    } catch (error) {
        console.error(error)
    }
}

console.log("server typescript loader")

main();