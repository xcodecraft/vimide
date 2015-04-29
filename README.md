# VimIDE
--------------------

VimIDE 是一款支持团队协同的集成化开发环境。与同类产品相比，其最大特色在于支持一次安装/部署/更新，开发机所有用户均无缝接入最新版，并支持了个人与团队的配置/插件完全共享与独立的定制化操作。

## 本离线版特色

- 支持部署本机 Vim 除 rigger-ng 外全部功能，给予开发人员本地线上体验一致的 IDE 环境；
- 安装方式与开发环境 VimIDE 升级一致，为 VimIDE 与 team 目录无缝解耦做好准备；
- 完全兼容 Mac OS / Linux 环境，暂不支持 Windows 。

## 安装方式

> 与其他离线 Vim 配置相比，本环境特色在于：完整的分离了公共插件和个人插件的部署方式，并保留了 VJ 特有的备份 / 还原 / 更新功能， 保障了 VJ 开发的独立与安全性。


### 1、下载配置文件
将 VJ 配置文件下载到任意「有权限的」文件夹下：

```bash
git clone git@github.com:leiming/vimide.git
```

### 2、设置并部署 VJ

VimIDE 公共插件路径为 `/var/local/team_bundle/` ，若需更改默认路径，则需配置 `team_bundle/config.sh` 中 `TEAM_BUNDLE_DIR` 变量。

```bash
cd vimide
source update.sh

# 需要本机 sudo 密码建立 /var/local/team_bundle/ 路径
```

### 3、安装VJ插件

```bash
vim +BundleInstall +BundleClean! +qa
```
