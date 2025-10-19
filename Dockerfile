# 使用輕量 Alpine 基底
FROM alpine:3.20

# 安裝必要套件
RUN apk add --no-cache wget unzip ca-certificates tzdata

# 設定時區
ENV TZ=Asia/Taipei

# 下載 OpenList 最新版本（自 GitHub 釋出）
RUN wget -O /tmp/openlist.zip https://github.com/OpenListTeam/OpenList/releases/latest/download/openlist-linux-amd64.zip \
    && unzip /tmp/openlist.zip -d /usr/local/bin \
    && chmod +x /usr/local/bin/openlist \
    && rm /tmp/openlist.zip

# 建立資料目錄
RUN mkdir -p /data
WORKDIR /data

# 開放埠
EXPOSE 5244

# 啟動指令
CMD ["openlist", "server", "--data", "/data"]
