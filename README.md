# android-APK-Mods

#### Description
> A tool for reverse engineering Android apk files.

> Hack into android applications, some tools and instructions. decode, modify and recompile APK

#### Instructions

1. Load APK

`java -jar apktool.jar if application-name.apk`

2. Decode APK

`java -jar apktool.jar decode application-name.apk`

3. Recompile APK

`java -jar apktool.jar b application-name.apk`

4. Add signature using APK Signer

`java -jar apk-signer-1.8.5.jar certificate.pem key.pk8 application-name.apk`

#### Prerequists 
> java must installed
> apk-signer.jar
> keystore files for signing (`testkey.x509.pem`, `testkey.pk8`)
> keystore explorer
> framework.apk



> There are other tools that can be used for decoding APK in bulk. Tools are tweaked to ensure complete decoding and rebuilding APK.