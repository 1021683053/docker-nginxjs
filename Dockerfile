FROM nginx:alpine3.18

# 修改源
RUN echo http://mirrors.aliyun.com/alpine/v3.18/main/ > /etc/apk/repositories \
    && echo http://mirrors.aliyun.com/alpine/v3.18/community/ >> /etc/apk/repositories \
    && apk update

# 安装基础依赖
RUN apk --no-cache add \
    bash \
    tzdata \
    nodejs>18.0.0 \
    npm \
    && npm install -g pnpm

# 修改时区
RUN cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" > /etc/timezone

# 功能检查
RUN node -v \
    && npm -v \
    && pnpm -v \
    && date -R

# 移除安装依赖
RUN apk del tzdata
 