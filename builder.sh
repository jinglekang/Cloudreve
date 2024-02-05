# 克隆仓库
# git clone --recurse-submodules https://github.com/jinglekang/Cloudreve.git
# 进入前端子模块
cd assets
# 安装依赖
# yarn install
# 开始构建
yarn run build
# 构建完成后删除映射文件
cd build
find . -name "*.map" -type f -delete
# 返回项目主目录打包静态资源
cd ../../
zip -r - assets/build >assets.zip
# 获得当前版本号、Commit
export COMMIT_SHA=$(git rev-parse --short HEAD)
# export VERSION=$(git describe --tags)
# 开始编译
# go build -a -o cloudreve -ldflags " -X 'github.com/cloudreve/Cloudreve/v3/pkg/conf.BackendVersion=$VERSION' -X 'github.com/cloudreve/Cloudreve/v3/pkg/conf.LastCommit=$COMMIT_SHA'"
go build -a -o cloudreve -ldflags " -X 'github.com/cloudreve/Cloudreve/v3/pkg/conf.LastCommit=$COMMIT_SHA'"