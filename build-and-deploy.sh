#!/bin/bash
set -ev
if [ "${TRAVIS_PULL_REQUEST}" = "false" ]; then
    git clone --branch v2 https://github.com/go-yaml/yaml $GOPATH/src/gopkg.in/yaml.v2
    mkdir ${TRAVIS_HOME}/src
    cd ${TRAVIS_HOME}/src
    git clone https://github.com/gohugoio/hugo.git
    cd hugo
    go install

    cd ${GOPATH}/src/github.com/Crunch-io/ta-da
    git config --global user.email "systems+crunchbot@crunch.io"
    git config --global user.name "Crunchbot"

    if [ "${TRAVIS_BRANCH}" = "src" ]; then
        # Production
        npm install
        npm run build:scss
        hugo

        git clone -b master https://${GH_TOKEN}@github.com/$TRAVIS_REPO_SLUG.git OUTPUT
        cd OUTPUT
        git rm -rf .
        cp -r ../public/. .
        git add .
        git commit -m "Updating built site (build ${TRAVIS_BUILD_NUMBER})" || true
        git push origin master || true
    else
        # Dev
        # Sub in the staging URL into the config so the site URLs are built correctly
        STAGING_URL=//crunch-io.github.io/crunchy/newsite/
        perl -pe 's@\Q//crunch.io/@'"${STAGING_URL}"'@' -i config.toml
        npm install
        npm run build:scss
        hugo

        git clone --branch gh-pages https://${GH_TOKEN}@github.com/Crunch-io/crunchy.git ../crunchy
        rm -rf ../crunchy/newsite
        cp -r public/. ../crunchy/newsite
        cd ../crunchy
        git add .
        git commit -m "Updating test version of company website (build ${TRAVIS_BUILD_NUMBER})" || true
        git push origin gh-pages || true
    fi
fi
