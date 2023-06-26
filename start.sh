Version_de_Minecraft=$MINECRAFT_VERSION
Jarfile_name=$SERVER_JARFILE

echo "${Version_de_Minecraft}"

if [[ $Version_de_Minecraft < 1.7 ]]; then
    java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -jar $Jarfile_name
elif [[ $Version_de_Minecraft == 1.7.* || $Version_de_Minecraft == 1.8.* || $Version_de_Minecraft == 1.9.* || $Version_de_Minecraft == 1.10.* || $Version_de_Minecraft == 1.11.* ]]; then
    curl -o log4j_Fix.xml https://launcher.mojang.com/v1/objects/4bb89a97a66f350bc9f73b3ca8509632682aea2e/log4j2_17-111.xml
    java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -Dlog4j.configurationFile=log4j_Fix.xml -jar $Jarfile_name
elif [[ $Version_de_Minecraft == 1.12* || $Version_de_Minecraft == 1.13* || $Version_de_Minecraft == 1.14* || $Version_de_Minecraft == 1.15* || $Version_de_Minecraft == 1.16* ]]; then
    curl -o log4j_Fix.xml https://launcher.mojang.com/v1/objects/02937d122c86ce73319ef9975b58896fc1b491d1/log4j2_112-116.xml
    java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -Dlog4j.configurationFile=log4j_Fix.xml -jar $Jarfile_name
elif [[ $Version_de_Minecraft > 1.17 || $Version_de_Minecraft == "latest"]]; then
    java -Xms128M -XX:MaxRAMPercentage=95.0 -Dterminal.jline=false -Dterminal.ansi=true -Dlog4j2.formatMsgNoLookups=true -jar $Jarfile_name
fi