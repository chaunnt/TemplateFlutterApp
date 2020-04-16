#bin/sh
#create project
#flutter create --org com.my_cool_org project_name

#init assets for project
mkdir source/helloflutter/assets
cp -rf Design/Components/ source/helloflutter/assets

#init images / icon for android
cp -rf Design/Logo/android/ source/helloflutter/android/app/src/main/res

#init images / icon for ios
cp -rf Design/Logo/ios/Images.xcassets/ source/helloflutter/ios/Runner/Assets.xcassets
