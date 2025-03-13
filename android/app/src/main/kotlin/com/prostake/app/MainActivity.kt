package com.prostake.app

import android.os.Bundle
//import androidx.activity.EdgeToEdge
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Enable edge-to-edge mode using the recommended approach
//        EdgeToEdge.enable(this)

        // Ensure full-screen immersive mode
        WindowCompat.setDecorFitsSystemWindows(window, false)
    }
}