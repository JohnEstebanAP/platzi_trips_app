package com.example.platzi_trips_app

import android.annotation.TargetApi
import android.os.Build
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {

    @TargetApi(Build.VERSION_CODES.LOLLIPOP)
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        this.flutterEngine?.let { GeneratedPluginRegistrant.registerWith(it) }
        this.window.statusBarColor = android.graphics.Color.TRANSPARENT;
    }
}
