import path from "path";
import { build } from "esbuild";
import ObfuscatorPlugin from 'esbuild-obfuscator-plugin';

export async function compile(entryFile, outputDir)
{
    const hash = Date.now().toString(36); // Generate a unique hash
    const fileName = path.basename(entryFile);
    const outputFile = path.join(outputDir, `${fileName.split(".")[0]}.${hash}.js`);

    await build({
        entryPoints: [entryFile],
        outfile: outputFile,
        bundle: true,
        minify: true,
        platform: "node",
        target: "es2017",
        format: "cjs",
        sourcemap: false,
        plugins: [
            // ObfuscatorPlugin({
            //     obfuscateOutput: false,
            // }),
        ],
    });

    console.log(`✅ Build complete: ${outputFile}`);
}

// Make this script callable via Node.js
if (process.argv.length > 3)
{
    const entryFile = process.argv[2];
    const outputDir = process.argv[3];
    await compile(entryFile, outputDir);
}