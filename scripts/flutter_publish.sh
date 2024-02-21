#!/bin/bash

# if the `lib` folder is not in the current path, try to move to the parent folder
if [ ! -d "lib" ]; then
    cd ..
fi

# if the `lib` folder is not in the current path, exit
if [ ! -d "lib" ]; then
    echo "Could not find the 'lib' folder"
    exit 1
fi

flutter pub publish --dry-run


# if dry-run fails, exit
if [ $? -ne 0 ]; then
    echo "Please check the dry-run errors"
    exit 1
fi

# Update the version in the pubspec.yaml file
version=$(grep 'version: ' pubspec.yaml | sed 's/version: //')
echo "Current version: $version"

# Updates the last number of the version
new_version=$(echo $version | awk -F. '{$NF = $NF + 1;} 1' | sed 's/ /./g')
echo "New version: $new_version"

# Update the version in the pubspec.yaml file
sed -i '' "s/version: $version/version: $new_version/g" pubspec.yaml

# Commit the changes
git add pubspec.yaml
git commit -m "Published version $version"

flutter pub publish
