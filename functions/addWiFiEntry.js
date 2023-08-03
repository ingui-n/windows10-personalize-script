import dotenv from 'dotenv';
import {log} from "../logger.js";
import {execute, getTempPath} from "../globals.js";

dotenv.config();

const addWiFiEntry = async () => {
  log({source: 'addWiFiEntry', message: 'Adding new Wi-Fi entry'});

  if (process.env.WIFI_SSID === '' || process.env.WIFI_KEY === '') {
    log({source: 'addWiFiEntry', message: 'ssid or key is missing'});
    return false;
  }

  const tempPath = await getTempPath();
  const xmlPath = `${tempPath}\\${process.env.WIFI_SSID}`;

  const {ok} = await execute(`
    Copy-Item "software\\wifi-entry.xml" -Destination "${xmlPath}";
    (Get-Content ${xmlPath}) | ForEach-Object { $_ -replace '{SSID}', '${process.env.WIFI_SSID}' } | Set-Content ${xmlPath};
    (Get-Content ${xmlPath}) | ForEach-Object { $_ -replace '{PASSWORD}', '${process.env.WIFI_KEY}' } | Set-Content ${xmlPath};
    netsh wlan add profile filename="${xmlPath}";
    netsh wlan connect name="${process.env.WIFI_SSID}"
  `);

  return ok;
};

export default addWiFiEntry;
