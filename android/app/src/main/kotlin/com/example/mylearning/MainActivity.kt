package com.example.mylearning

import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {
    private val channelName = "shijin"

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        var channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName);
        channel.setMethodCallHandler { call, result ->
            if (call.method == "ShowToast") {
                val message = call.argument<String>("message")
                if (message != null) {
                    Toast.makeText(this, message, Toast.LENGTH_LONG).show()
                    result.success("Toast displayed for: $message")
                } else {
                    result.error("MISSING_ARGUMENT", "Missing 'message' argument", null)
                }
            } else {
                result.notImplemented()
            }
        }
    }
}
