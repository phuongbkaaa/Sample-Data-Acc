# Add project specific ProGuard rules here.
# By default, the flags in this file are appended to flags specified
# in /home/marcel/Android/Sdk/tools/proguard/proguard-android.txt
# You can edit the include path and order by changing the proguardFiles
# directive in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# Add any project specific keep options here:

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

#Line numbers
-renamesourcefileattribute SourceFile
-keepattributes SourceFile,LineNumberTable

#Mobile Internet Manager
-keepnames class com.simpletool.datasaving.** { *; }

#JNI
-keepclasseswithmembernames class * {
    native <methods>;
}

#JNI callbacks
-keep class com.simpletool.datasaving.Allowed { *; }
-keep class com.simpletool.datasaving.Packet { *; }
-keep class com.simpletool.datasaving.ResourceRecord { *; }
-keep class com.simpletool.datasaving.Usage { *; }
-keep class com.simpletool.datasaving.ServiceSinkhole {
    void nativeExit(java.lang.String);
    void nativeError(int, java.lang.String);
    void logPacket(com.simpletool.datasaving.Packet);
    void dnsResolved(com.simpletool.datasaving.ResourceRecord);
    boolean isDomainBlocked(java.lang.String);
    com.simpletool.datasaving.Allowed isAddressAllowed(com.simpletool.datasaving.Packet);
    void accountUsage(com.simpletool.datasaving.Usage);
}

#AndroidX
-keep class androidx.appcompat.widget.** { *; }
-keep class androidx.appcompat.app.AppCompatViewInflater { <init>(...); }
-keepclassmembers class * implements android.os.Parcelable { static ** CREATOR; }

#Glide
-keep public class * implements com.bumptech.glide.module.GlideModule
-keep public class * extends com.bumptech.glide.module.AppGlideModule
-keep enum com.bumptech.glide.** {*;}
#-keep public enum com.bumptech.glide.load.resource.bitmap.ImageHeaderParser$** {
#    **[] $VALUES;
#    public *;
#}

#AdMob
-dontwarn com.google.android.gms.internal.**
