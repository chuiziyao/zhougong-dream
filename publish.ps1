# 周公解梦 Skill 一键发布脚本 for WorkBuddy
# 用法：右键 → 使用 PowerShell 运行，或在终端执行: .\publish.ps1
#
# 第一次发布前，需要去 GitHub 生成 Personal Access Token：
# https://github.com/settings/tokens/new
# 勾选 [repo] 权限，然后复制 token 粘贴到本脚本提示处

$ErrorActionPreference = "Stop"
$repoName = "zhougong-dream"
$githubUser = "chuiziyao"

Write-Host "=== 周公解梦 Skill 发布工具 ===" -ForegroundColor Cyan
Write-Host ""

# 检查 git
if (-not (Get-Command git -ErrorAction SilentlyContinue)) {
    Write-Host "错误：未找到 git。请先安装 Git: https://git-scm.com/download/win" -ForegroundColor Red
    exit 1
}

# 检查 GitHub token
$token = $env:GITHUB_TOKEN
if (-not $token) {
    Write-Host "需要 GitHub Personal Access Token 来创建仓库。" -ForegroundColor Yellow
    Write-Host "获取方式：GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic) → Generate new token" -ForegroundColor Yellow
    Write-Host "权限需要勾选: repo (完整仓库权限)" -ForegroundColor Yellow
    Write-Host ""
    $token = Read-Host -Prompt "请输入你的 GitHub Personal Access Token"
    if (-not $token) {
        Write-Host "未提供 token，退出。" -ForegroundColor Red
        exit 1
    }
}

# 创建仓库
Write-Host "正在创建 GitHub 仓库 $repoName ..." -ForegroundColor Green
$headers = @{
    "Authorization" = "token $token"
    "Accept" = "application/vnd.github.v3+json"
}
$body = @{
    name = $repoName
    description = "A traditional Chinese dream interpretation skill for WorkBuddy based on Zhou Gong's Dream Dictionary (周公解梦)."
    private = $false
    auto_init = $false
} | ConvertTo-Json

try {
    $response = Invoke-RestMethod -Uri "https://api.github.com/user/repos" -Method Post -Headers $headers -Body $body -ContentType "application/json"
    Write-Host "仓库创建成功: $($response.html_url)" -ForegroundColor Green
} catch {
    if ($_.Exception.Response.StatusCode -eq 422) {
        Write-Host "仓库已存在，跳过创建。" -ForegroundColor Yellow
    } else {
        Write-Host "创建仓库失败: $_" -ForegroundColor Red
        exit 1
    }
}

# 配置远程仓库并推送
Write-Host "正在推送代码..." -ForegroundColor Green
$remoteUrl = "https://$token@github.com/$githubUser/$repoName.git"

git remote remove origin 2>$null
git remote add origin $remoteUrl
git branch -m main 2>$null

try {
    git push -u origin main
    Write-Host ""
    Write-Host "发布成功！" -ForegroundColor Green
    Write-Host "仓库地址: https://github.com/$githubUser/$repoName" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "别人可以用以下命令安装你的 skill:" -ForegroundColor Yellow
    Write-Host "  npx skills add $githubUser/$repoName@$repoName" -ForegroundColor White
} catch {
    Write-Host "推送失败: $_" -ForegroundColor Red
    Write-Host "请检查 token 是否有 repo 权限。" -ForegroundColor Yellow
}

# 清理 token 从远程 URL
git remote set-url origin "https://github.com/$githubUser/$repoName.git"
