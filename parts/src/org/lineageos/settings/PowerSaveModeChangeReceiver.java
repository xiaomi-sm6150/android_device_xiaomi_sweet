/*
 * Copyright (C) 2020 Wave-OS
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.lineageos.settings;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.os.PowerManager;

import org.lineageos.settings.utils.RefreshRateUtils;

public class PowerSaveModeChangeReceiver extends BroadcastReceiver {

    private boolean shouldSwitchRefreshRate(Context context) {
        PowerManager pm = (PowerManager) context.getSystemService(Context.POWER_SERVICE);
        boolean userSwitch = RefreshRateUtils.getPowerSaveRefreshRateSwitch(context);
        return pm.isPowerSaveMode() && userSwitch;
    }

    @Override
    public void onReceive(final Context context, Intent intent) {
        int normalRefreshRate = RefreshRateUtils.getRefreshRate(context);
        int powerSaveRefreshRate = RefreshRateUtils.getPowerSaveRefreshRate(context);

        RefreshRateUtils.setFPS(shouldSwitchRefreshRate(context) ? powerSaveRefreshRate : normalRefreshRate);
    }
}
