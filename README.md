# proypet

## revisar esto para mac

In addition, you need to add the Background Modes capability to your XCode project (Project > Signing and Capabilties > "+ Capability" button) and select Location Updates.

https://maps.googleapis.com/maps/api/geocode/json?latlng=-12.0166806,-77.09980399999999&key=AIzaSyAIU2POPaS1Lme5BXKIrHBm1Ohicmg9844

# despliegue android

## flutter build appbundle

# despliegue ios

## abrir en xcode, esperar q termine da cargar la barra

## flutter build ios --release

## product -> archive

## hash prueba fb

ml9LCje6qhWF4iKHkLhhJDX60yQ= (NO SIRVE)

## sha-1 de produccion

1B:1D:FB:24:2A:69:89:72:74:5F:FA:29:73:8B:CC:B7:78:51:2D:83

## sha-256 produccion

6E:38:81:DA:E9:6F:ED:1C:59:0E:B4:40:70:9B:1F:27:29:F8:C8:B7:94:97:F7:F6:CD:D9:BF:68:00:F2:1B:89

## sha pruebas

SHA1: B8:4F:EB:0C:A9:40:70:8F:CC:41:FC:75:8B:8B:5D:F2:A4:88:B0:69
SHA256: 54:17:04:87:A6:24:32:9F:92:19:D4:43:D9:4A:33:3C:83:C2:19:C7:94:69:25:3C:4A:4E:B5:5D:E2:92:A6:42

## convertir sha para facebook produccion

http://tomeko.net/online_tools/hex_to_base64.php

## hash produccion fb

Gx37JCppiXJ0X/opc4vMt3hRLYM= (FUNCIONA PRODUCCION)

## hash pruebas fb

uE/rDKlAcI/MQfx1i4td8qSIsGk= (FUNCIONA PRUEBAS)

## sha facebook

keytool -exportcert -alias upload -keystore /Users/josealonsomassarolando/keystore.jks | openssl sha1 -binary | openssl base64

Sha para Facebook -> clave: peru@123

echo 1B:1D:FB:24:2A:69:89:72:74:5F:FA:29:73:8B:CC:B7:78:51:2D:83 | xxd -r -p | openssl base64
echo B8:4F:EB:0C:A9:40:70:8F:CC:41:FC:75:8B:8B:5D:F2:A4:88:B0:69 | xxd -r -p | openssl base64
