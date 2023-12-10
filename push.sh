time=$(date +"%Y-%m-%d %H:%M:%S")
commit_message="update at $time"

# 添加文件到暂存区
git add .
if [ $? -ne 0 ]; then
    echo "git add fail"
fi

# 创建提交
git commit -m "$commit_message"
if [ $? -ne 0 ]; then
    echo "git commit fail"
fi

# 推送到GitHub
git push origin source
if [ $? -ne 0 ]; then
    echo "git push fail"
fi