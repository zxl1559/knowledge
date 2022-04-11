# Git

## 修改本地仓库

`git add ./file1 file2`: 把所有更改文件/指定文件存到 index;

`git restore --staged ./file`: `git add file` 的逆过程

`git commit [-a] [-m "modify info"]`: `-m`后面的信息类似备注, 对该`commit`语句进行诠释; `-a`: 是`git add .`的缩写

`git reset commit_id`: 回滚到该 commit_id 执行之后的结果

`git status`: 查看当前 git 的状态

`git log`: 查看所有 commit 记录

`git show commit_id`: 查看该commit 的具体修改内容

`git tag 1.0.0 commit_id`: 为某个 commit 之后的状态创建一个别名(版本号)

## 同步远程仓库和本地仓库

`git clone/pull https.... [cust_foder]`: 将服务器上的仓库文件下载到本地, 并将名字改为 `cust_folder`

`git push -u origin master/branch_name`: 将本地仓库同步到远服务器上的指定 `master/branch`

## 团队协作开发

`git branch`: 当前仓库都有那些分支

`git branch branch_name`: 创建分支

`git branch -d branch_name`: 删除分支

`git push origin --delete remoteBranchName`: 删除远程分支

删除远程分支的某个文件
`git rm -r --cached file_path`
`git commit -m "删除远程文件"`
`git push origin cur_branch_name`

`git checkout branch_name`: 切换至某分支

`git cheakout -b branch_name`: 切换至某分支, 如果还不存在, 则创建该分支

`git merge branch1`: 把 branch1 合并到master

![image-20210701234801066](https://gitee.com/AragornJIA/image/raw/master/image/reabse%E5%92%8Cmerge.png)

`git rebase` 和`git merge`的区别: `merge`容易造成文件冲突, 而 `rebase`则相当于处理顺序一前一后
