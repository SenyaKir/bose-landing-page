#!/bin/bash

set -e

echo '🧹 Cleaning cache and dist...'
rm -rf .parcel-cache dist

echo '🔨 Building with Parcel...'
npx parcel build src/index.html --public-url ./ --dist-dir dist --no-source-maps

echo '🖼️  Restoring SVGs broken by Parcel optimizer...'
cp src/images/categorys/Portable-speakers-1.svg dist/Portable-speakers-1.feee45b5.svg
cp src/images/categorys/Portable-speakers-2.svg dist/Portable-speakers-2.36494912.svg
cp src/images/categorys/Earphones-2.svg         dist/Earphones-2.10deb99a.svg
cp src/images/categorys/Smart-Home-1.svg         dist/Smart-Home-1.db9e0f75.svg

echo '🚀 Deploying to GitHub Pages...'
npx gh-pages -d dist

echo '✅ Done! https://senyakir.github.io/bose-landing-page/'
