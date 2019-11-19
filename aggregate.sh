OUTPUT_DIR=${PROJECT_DIR}/Output

DERIVED_DIR=${OUTPUT_DIR}/${CONFIGURATION}-derived

ARCHIVE_DIR=${OUTPUT_DIR}/${CONFIGURATION}-archive

XCFRAMEWORK_DIR=${OUTPUT_DIR}/${CONFIGURATION}-xcframework

rm -rf ${OUTPUT_DIR}

mkdir -p ${DERIVED_DIR}

mkdir -p ${ARCHIVE_DIR}

mkdir -p ${XCFRAMEWORK_DIR}

ARCHIVE_FILE_IOS=${ARCHIVE_DIR}/ios.xcarchive
echo "ARCHIVE_FILE_IOS:${ARCHIVE_FILE_IOS}"

ARCHIVE_FILE_IOS_SIMULATOR=${ARCHIVE_DIR}/iossimulator.xcarchive
echo "ARCHIVE_FILE_IOS_SIMULATOR:${ARCHIVE_FILE_IOS_SIMULATOR}"

xcodebuild archive -scheme ${PROJECT_NAME} -destination="iOS" -archivePath $ARCHIVE_FILE_IOS \
    -derivedDataPath $DERIVED_DIR -sdk iphoneos SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild archive -scheme ${PROJECT_NAME} -destination="iOS Simulator" -archivePath $ARCHIVE_FILE_IOS_SIMULATOR \
    -derivedDataPath $DERIVED_DIR -sdk iphonesimulator SKIP_INSTALL=NO BUILD_LIBRARY_FOR_DISTRIBUTION=YES

xcodebuild -create-xcframework \
    -framework $ARCHIVE_FILE_IOS/Products/Library/Frameworks/${PROJECT_NAME}.framework \
    -framework $ARCHIVE_FILE_IOS_SIMULATOR/Products/Library/Frameworks/${PROJECT_NAME}.framework \
    -output $XCFRAMEWORK_DIR/${PROJECT_NAME}.xcframework

open ${XCFRAMEWORK_DIR}
