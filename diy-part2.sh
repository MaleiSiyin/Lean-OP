#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#

#修改版本号
sed -i 's/OpenWrt/Bin AutoBuild $(TZ=UTC-8 date "+%Y.%m.%d") @ OpenWrt/g' package/lean/default-settings/files/zzz-default-settings
sed -i 's/OpenWrt/SakuraTv/g' package/base-files/files/bin/config_generate
sed -i 's/192.168.1.1/12.12.12.12/g' package/base-files/files/bin/config_generate
sed -i '/set luci.main.mediaurlbase=\/luci-static\/bootstrap/d' feeds/luci/themes/luci-theme-bootstrap/root/etc/uci-defaults/30_luci-theme-bootstrap
#删除部分软件包
rm -rf package/lean/luci-theme-argon
#下载其他软件包
cd /lede/package
mkdir /sakura
cd /sakura
git clone -b 18.06 https://github.com/jerrykuku/luci-theme-argon.git
git clone https://github.com/destan19/OpenAppFilter && mv -f OpenAppFilter/* ./
git clone https://github.com/tty228/luci-app-serverchan
git clone https://github.com/garypang13/luci-app-eqos
git clone https://github.com/jerrykuku/lua-maxminddb.git
git clone https://github.com/jerrykuku/luci-app-vssr.git
