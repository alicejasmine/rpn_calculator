NAME=flutter_web_test_deploy
BRANCH=main
curl -fsSL "https://github.com/rpede/$NAME/archive/refs/heads/$BRANCH.zip" -o $BRANCH.zip
unzip -nD $BRANCH.zip -x $NAME-$BRANCH/setup.sh $NAME-$BRANCH/README.md $NAME-$BRANCH/img/*
mv $NAME-$BRANCH/* $NAME-$BRANCH/.* ./
rm $BRANCH.zip
rmdir $NAME-$BRANCH
flutter pub add 'dev:flutter_test:{"sdk":"flutter"}'  'dev:integration_test:{"sdk":"flutter"}'
cat <<EOT >> .gitignore

# Chromedriver
chromedriver-*/
chromedriver*
LICENSE.chromedriver
EOT