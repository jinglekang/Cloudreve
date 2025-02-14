# 构建镜像
docker build -t cloudreve:latest . --build-arg "HTTPS_PROXY=http://192.168.81.232:7890"
# 删除构件中的临时镜像
docker image prune -f
# 停止旧容器
docker stop cloudreve
# 删除老容器
docker rm cloudreve
# 启动服务
docker run -d --name cloudreve -p 5200:5200 -v /root/docker/cloudreve/cloudreve.db:/cloudreve/cloudreve.db -v /root/docker/cloudreve/avatar:/cloudreve/avatar -v /root/cloudreve/uploads:/cloudreve/uploads -v /root/docker/cloudreve/data:/data --restart unless-stopped cloudreve:latest
