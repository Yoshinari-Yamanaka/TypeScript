# yarn
1. yarn init
create a package.json

2. add,upgrade,remove
    * yarn add packageName@xxx.xxx
    add package
    * yarn upgrade packageName@xxx.xxx 
    upgrade package
    * yarn remove packageName@xxx.xxx
    remove package

3. yarn install or yarn
    this command allows you to install packegs based on package.json
    When you've done `yarn add packageName@xxx.xxx`, you don't need do this command,
    but you add some packages on packeg.json manually, which means that you do not run `yarn add`
    you have to `yarn install` or `yarn`
   

4. yarn outdated
info Color legend : 
 "<red>"    : Major Update backward-incompatible updates 
 "<yellow>" : Minor Update backward-compatible features 
 "<green>"  : Patch Update backward-compatible bug fixes

**yarn upgrade --latest** will upgrade former version package

# tsc
1. tsc --init
creates tsconfig.json
this is like

```json
{
  "compilerOptions": {
    "target": "ES2020",                          /* Specify ECMAScript target version: 'ES3' (default), 'ES5', 'ES2015', 'ES2016', 'ES2017', 'ES2018', 'ES2019', 'ES2020', or 'ESNEXT'. */
    "module": "commonjs",                     /* Specify module code generation: 'none', 'commonjs', 'amd', 'system', 
    // "outFile": "./",                       /* Concatenate and emit output to single file. */
    "outDir": "./dist",                        /* Redirect output structure to the directory. */

    /* Strict Type-Checking Options */
    "strict": true,                           /* Enable all strict type-checking options. */
    // "allowSyntheticDefaultImports": true,  /* Allow default imports from modules with no default export. This does not
    "esModuleInterop": true,                  /* Enables emit interoperability between CommonJS and ES Modules via 
    /* Advanced Options */
    "skipLibCheck": true,                     /* Skip type checking of declaration files. */
    "forceConsistentCasingInFileNames": true  /* Disallow inconsistently-cased references to the same file. */
  },
  "include": ["src/*"],
  "exclude": ["node_modules/*"]
}
```

2. tsc -p src/to/tsconfig.json or tsc
this command allows you to transpile TypeScript Source Code to specified JS version Source Code


# How to upload TypeScript Source Code to AWS Lambda

```bash
#!/bin/sh

set -euo 

rm -rf ./dist

# transpile
tsc -p tsconfig.json

cp ./package.json ./yarn.lock ./dist
cd dist

# yarn install or yarn
yarn install

# upload source code to AWS Lambda
zip -r ./lambda.zip *

aws lambda update-function-code \
    --function-name x \
    --zip-file fileb://lambda.zip
```