set -e

git checkout ${TRAVIS_BRANCH}

git branch

bundle exec jekyll build

git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"

git add --all -f _site/
git commit -m 'Updating.'

git remote add origin-pages "https://${GH_TOKEN}@github.com/${TRAVIS_REPO_SLUG}"
git push --quiet --set-upstream origin-pages ${TRAVIS_BRANCH}

echo "Pushed updated branch to GitHub Pages"
