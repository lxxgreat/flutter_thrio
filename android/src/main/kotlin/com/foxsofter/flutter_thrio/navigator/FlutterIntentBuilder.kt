/**
 * The MIT License (MIT)
 *
 * Copyright (c) 2019 foxsofter
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
 * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
 * IN THE SOFTWARE.
 */

package com.foxsofter.flutter_thrio.navigator

import android.app.Activity
import android.content.Context
import android.content.Intent
import io.flutter.embedding.android.FlutterActivityLaunchConfigs
import io.flutter.embedding.android.ThrioFlutterActivity
import io.flutter.embedding.android.FlutterActivity

open class FlutterIntentBuilder : IntentBuilder {

    override fun getActivityClz(): Class<out Activity> = ThrioFlutterActivity::class.java

    override fun build(context: Context, entrypoint: String): Intent {
        @Suppress("UNCHECKED_CAST")
        return FlutterActivity
            .NewEngineIntentBuilder(getActivityClz() as Class<out FlutterActivity>)
            .backgroundMode(FlutterActivityLaunchConfigs.BackgroundMode.transparent)
            .build(context)
    }
}