#!/bin/bash

# ----------------------
# Color Variables
# ----------------------
GREEN='\033[1;32m'
LCYAN='\033[1;36m'
RED="\033[0;31m"
NC='\033[0m' # No Color

# ----------------------
# Perform Configuration
# ----------------------

# Icon font choice
echo -e "${RED}Do you want to install Font Awesome to your project? ${NC}"
select iconFontChoise in "Yes" "No"; do
  case $iconFontChoise in
    Yes) 
      fontAwesomeInstalled=true
      break ;;
    No) 
      fontAwesomeInstalled=false
      break ;;
  esac
done
echo

# Starting script
echo -e "${GREEN}Configuring your frontend development environment... ${NC}"
echo

# Git installation
echo -e "1/20 ${LCYAN}Git installation... ${NC}"
git init
echo

# Building gitignore file for node_modules
echo -e "2/20 ${LCYAN}Building gitignore file... ${NC}"
> .gitignore # truncates existing file (or creates empty)
echo 'node_modules
' >> .gitignore
echo

# Default Npm installation
echo -e "3/20 ${LCYAN}Default Npm installation... ${NC}"
npm init -y
echo

# Building pack folders and files
echo -e "4/20 ${LCYAN}Building project folders and files... ${NC}"
mkdir "css"
mkdir "css/libraries"
mkdir "src"
mkdir "src/libraries"
mkdir "img"
mkdir "font"
mkdir "scss"
mkdir "scss/layout"
mkdir "scss/layout/general"
touch "scss/layout/general/_header.scss"
touch "scss/layout/general/_main.scss"
touch "scss/layout/general/_footer.scss"
touch "scss/layout/general/_layout.scss"
touch "scss/layout/general/_displays.scss"
mkdir "scss/utilities"
touch "scss/utilities/_mixins.scss"
touch "scss/utilities/_extends.scss"
touch "scss/utilities/_variables.scss"
echo

# JQuery installation
echo -e "5/20 ${LCYAN}JQuery installation... ${NC}"
npm i -D jquery
cp node_modules/jquery/dist/jquery.slim.min.js src/libraries/jquery.slim.min.js
echo

# Popper.js installation
echo -e "6/20 ${LCYAN}Popper.js installation... ${NC}"
npm i -D popper.js
cp node_modules/popper.js/dist/umd/popper.min.js src/libraries/popper.min.js
echo

# Bootstrap installation
echo -e "7/20 ${LCYAN}Bootstrap installation... ${NC}"
npm i -D bootstrap
cp node_modules/bootstrap/dist/css/bootstrap.min.css css/libraries/bootstrap.min.css
cp node_modules/bootstrap/dist/js/bootstrap.min.js src/libraries/bootstrap.min.js
echo

# Font Awesome installation
if $fontAwesomeInstalled
then
  echo -e "8/20 ${LCYAN}Font Awesome installation... ${NC}"
  npm i -D @fortawesome/fontawesome-free
  cp node_modules/@fortawesome/fontawesome-free/css/all.min.css css/libraries/all.min.css
else
  echo -e "8/20 ${LCYAN}Font Awesome doesn't installed... ${NC}"
fi
echo

# Typescript installation
echo -e "9/20 ${LCYAN}Typescript installation... ${NC}"
npm i -D typescript
> "tsconfig.json" # truncates existing file (or creates empty)

echo '{
  "files": ["src/main.ts"],
  "compilerOptions": {
    /* Basic Options */
    // "incremental": true,                   /* Enable incremental compilation */
    "target": "es5" /* Specify ECMAScript target version: ES3 (default), ES5, ES2015, ES2016, ES2017, ES2018, ES2019, ES2020, or ESNEXT. */,
    "module": "commonjs" /* Specify module code generation: none, commonjs, amd, system, umd, es2015, es2020, or ESNext. */,
    // "lib": [],                             /* Specify library files to be included in the compilation. */
    // "allowJs": true,                       /* Allow javascript files to be compiled. */
    // "checkJs": true,                       /* Report errors in .js files. */
    // "jsx": "react" /* Specify JSX code generation: preserve, react-native, or react. */,
    // "declaration": true,                   /* Generates corresponding .d.ts file. */
    // "declarationMap": true,                /* Generates a sourcemap for each corresponding .d.ts file. */
    // "sourceMap": true,                     /* Generates corresponding .map file. */
    // "outFile": "./",                       /* Concatenate and emit output to single file. */
    // "outDir": "build" /* Redirect output structure to the directory. */,
    // "rootDir": "src" /* Specify the root directory of input files. Use to control the output directory structure with --outDir. */,
    // "composite": true,                     /* Enable project compilation */
    // "tsBuildInfoFile": "./",               /* Specify file to store incremental compilation information */
    // "removeComments": true,                /* Do not emit comments to output. */
    // "noEmit": true,                        /* Do not emit outputs. */
    // "importHelpers": true,                 /* Import emit helpers from tslib. */
    // "downlevelIteration": true,            /* Provide full support for iterables in for-of, spread, and destructuring when targeting ES5 or ES3. */
    // "isolatedModules": true,               /* Transpile each file as a separate module (similar to ts.transpileModule). */

    /* Strict Type-Checking Options */
    "strict": true /* Enable all strict type-checking options. */,
    "noImplicitAny": true /* Raise error on expressions and declarations with an implied any type. */,
    //"strictNullChecks": true /* Enable strict null checks. */,
    //"strictFunctionTypes": true /* Enable strict checking of function types. */,
    // "strictBindCallApply": true,           /* Enable strict bind, call, and apply methods on functions. */
    // "strictPropertyInitialization": true,  /* Enable strict checking of property initialization in classes. */
    // "noImplicitThis": true,                /* Raise error on this expressions with an implied any type. */
    "alwaysStrict": true /* Parse in strict mode and emit "use strict" for each source file. */,

    /* Additional Checks */
    // "noUnusedLocals": true,                /* Report errors on unused locals. */
    // "noUnusedParameters": true,            /* Report errors on unused parameters. */
    // "noImplicitReturns": true,             /* Report error when not all code paths in function return a value. */
    // "noFallthroughCasesInSwitch": true,    /* Report errors for fallthrough cases in switch statement. */

    /* Module Resolution Options */
    // "moduleResolution": "node",            /* Specify module resolution strategy: node (Node.js) or classic (TypeScript pre-1.6). */
    //"baseUrl": "src" /* Base directory to resolve non-absolute module names. */,
    // "paths": {"~*": ["./*"]} /* A series of entries which re-map imports to lookup locations relative to the baseUrl. */,
    // "rootDirs": [],                        /* List of root folders whose combined content represents the structure of the project at runtime. */
    // "typeRoots": [],                       /* List of folders to include type definitions from. */
    // "types": [],                           /* Type declaration files to be included in compilation. */
    // "allowSyntheticDefaultImports": true,  /* Allow default imports from modules with no default export. This does not affect code emit, just typechecking. */
    "esModuleInterop": true /* Enables emit interoperability between CommonJS and ES Modules via creation of namespace objects for all imports. Implies allowSyntheticDefaultImports. */,
    // "preserveSymlinks": true,              /* Do not resolve the real path of symlinks. */
    // "allowUmdGlobalAccess": true,          /* Allow accessing UMD globals from modules. */

    /* Source Map Options */
    // "sourceRoot": "",                      /* Specify the location where debugger should locate TypeScript files instead of source locations. */
    // "mapRoot": "",                         /* Specify the location where debugger should locate map files instead of generated locations. */
    // "inlineSourceMap": true,               /* Emit a single file with source maps instead of having a separate file. */
    // "inlineSources": true,                 /* Emit the source alongside the sourcemaps within a single file; requires --inlineSourceMap or --sourceMap to be set. */

    /* Experimental Options */
    // "experimentalDecorators": true,        /* Enables experimental support for ES7 decorators. */
    // "emitDecoratorMetadata": true,         /* Enables experimental support for emitting type metadata for decorators. */

    /* Advanced Options */
    "forceConsistentCasingInFileNames": true /* Disallow inconsistently-cased references to the same file. */
  }
}' >> tsconfig.json
echo

# ESLint & Prettier installation
echo -e "10/20 ${LCYAN}ESLint & Prettier installation... ${NC}"
npm i -D eslint @typescript-eslint/parser @typescript-eslint/eslint-plugin prettier

> .eslintignore # truncates existing file (or creates empty)
echo 'node_modules
dist
coverage
' >> .eslintignore
echo

# Airbnb's JavaScript style guide packages installation
echo -e "11/20 ${LCYAN}Airbnb's JavaScript style guide packages installation... ${NC}"
npm install eslint-config-airbnb-typescript \
            eslint-plugin-import \
            @typescript-eslint/eslint-plugin \
            --save-dev
echo

# Prettier's Eslint packages installation
echo -e "12/20 ${LCYAN}Prettier's Eslint packages installation... ${NC}"
npm i -D eslint-config-prettier eslint-plugin-prettier
echo

# Building eslintrc.json file
echo -e "13/20 ${LCYAN}Building eslintrc.json file...${NC}"
> ".eslintrc" # truncates existing file (or creates empty)

echo '{
  "root": true,
  "parser": "@typescript-eslint/parser",
  "parserOptions": {
    "project": "./tsconfig.json"
  },
  "plugins": ["@typescript-eslint", "prettier"],
  "extends": ["airbnb-typescript/base", "prettier"],
  "rules": {
    "no-console": 1,
    "prettier/prettier": 1
  }
}' >> .eslintrc
echo

# Building prettierrc.json file
echo -e "14/20 ${LCYAN}Building your prettierrc.json file... ${NC}"
> .prettierrc # truncates existing file (or creates empty)
echo '{
  "singleQuote": true,
  "trailingComma": "es5"
}' >> .prettierrc
echo

# Gulp packages installation
echo -e "15/20 ${LCYAN}Gulp packages installation... ${NC}"
npm i -D gulp gulp-concat gulp-uglify gulp-rename gulp-sass gulp-typescript gulp-sourcemaps gulp-clean-css del
echo

# Building gulp file
echo -e "16/20 ${LCYAN}Building gulpfile.js... ${NC}"
> gulpfile.js # truncates existing file (or creates empty)

echo "/* eslint-disable strict */

'use strict';

// Assign programs to variables
const gulp = require('gulp');
const concat = require('gulp-concat');
const uglify = require('gulp-uglify');
const rename = require('gulp-rename');
const sass = require('gulp-sass');
const maps = require('gulp-sourcemaps');
const cleanCss = require('gulp-clean-css');
const del = require('del');
const ts = require('gulp-typescript');
const tsProject = ts.createProject('tsconfig.json');

// Tsify
gulp.task('tsify', function () {
    return tsProject.src()
        .pipe(tsProject())
        .js.pipe(gulp.dest('src'));
});

// Concat js files
gulp.task('concat-script', () => {
  return gulp
    .src(['src/main.js'])
    .pipe(maps.init())
    .pipe(concat('app.js'))
    .pipe(maps.write('./'))
    .pipe(gulp.dest('src'));
});

// Minify the app.js file
gulp.task('minify-script', () => {
  return gulp
    .src('src/app.js')
    .pipe(maps.init())
    .pipe(uglify())
    .pipe(rename('app.min.js'))
    .pipe(maps.write('./'))
    .pipe(gulp.dest('src'));
});

// Compile Sass, than write .map
gulp.task('compile-sass', () => {
  return gulp
    .src('scss/style.scss')
    .pipe(maps.init())
    .pipe(sass())
    .pipe(maps.write('./'))
    .pipe(gulp.dest('css'));
});

// Minify css and create min.map
gulp.task('minify-css', () => {
  return gulp
    .src('css/style.css')
    .pipe(maps.init())
    .pipe(cleanCss())
    .pipe(rename('style.min.css'))
    .pipe(maps.write('./'))
    .pipe(gulp.dest('css'));
});

// Create dist folder
gulp.task('dist', () => {
  return gulp
    .src(
      [
        'css/style.min.css',
        'css/libraries/**',
        'src/app.min.js',
        'src/libraries/**',
        '*.html',
        'img/**',
        'font/**',
      ],
      {
        base: './',
      }
    )
    .pipe(gulp.dest('dist'));
});

// Clean dist, css folders and app*.js* files
gulp.task('clean', () => {
  return del(['dist', 'css', 'src/app*.js*']);
});

// Watch Task
gulp.task('watch-files', () => {
  gulp.watch('scss/**/*.scss', gulp.series('compile-sass', 'minify-css'));
  gulp.watch('src/main.ts', gulp.series('tsify', 'concat-script', 'minify-script'));
});

// Multiple Tasks
gulp.task(
  'build',
  gulp.series(
    'tsify',
    'concat-script',
    'minify-script',
    'compile-sass',
    'minify-css',
    'dist'
  )
);

// Watch files with serve command
gulp.task('serve', gulp.series('watch-files'));

// Default task for multiple tasks
gulp.task('default', gulp.series('clean', 'build'));" >> gulpfile.js
echo

# Building main.js file
echo -e "17/20 ${LCYAN}Building your main.js file... ${NC}"
touch src/main.ts
echo

# Building index.html file
echo -e "18/20 ${LCYAN}Building your index.html file... ${NC}"
> index.html # truncates existing file (or creates empty)
echo '<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />

    <!-- Title -->
    <title>Frontend Starter Pack</title>
    <!-- /Title -->

    <!-- Minified CSS File -->' > index.html

if $fontAwesomeInstalled 
then    
  echo '    <link rel="stylesheet" href="css/libraries/all.min.css" />' >> index.html
fi      

echo '    <link rel="stylesheet" href="css/libraries/bootstrap.min.css" />
    <link rel="stylesheet" href="css/style.min.css" />
    <!-- /Minified CSS File -->
  </head>

  <body>

    <!-- Minified JavaScript Sources -->
    <script src="src/libraries/jquery.slim.min.js"></script>
    <script src="src/libraries/popper.min.js"></script>
    <script src="src/libraries/bootstrap.min.js"></script>
    <script src="src/app.min.js"></script>
    <!-- /Minified JavaScript Sources -->
  </body>
</html>
' >> index.html
echo

# Building style.scss file
echo -e "19/20 ${LCYAN}Building your style.scss file... ${NC}"
> scss/style.scss # truncates existing file (or creates empty)

echo '// ------------------------------ */
// ----- PARTIAL IMPORTS ----- */
// ------------------------------ */

// Utilities
@import "utilities/variables", "utilities/mixins", "utilities/extends";

// General styles
@import "layout/general/layout", "layout/general/header", "layout/general/main",
    "layout/general/footer", "layout/general/displays";
' >> scss/style.scss
echo

# Building dist folder
echo -e "20/20 ${LCYAN}Building the dist folder... ${NC}"
mkdir "dist"
gulp build
echo

# Finishing the script
echo -e "${GREEN}Frontend Starter Pack installation is finished!${NC}"
echo

# Start watching the project
echo -e "${LCYAN}Starting to watch the project with gulp... ${NC}"
echo
gulp serve