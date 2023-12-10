time=$(date +"%Y-%m-%d %H:%M:%S")
commit_message="update posts at $time"

# 添加文件到暂存区
git add ..
echo "git add done"

# 创建提交
git commit -m "$commit_message"
echo "git commit done"

# pull remote
git pull --rebase
echo "git pull done"

# 推送到GitHub
git push origin source
echo "git push done"
