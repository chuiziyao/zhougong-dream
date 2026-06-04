# 周公解梦 (Zhou Gong Dream Interpretation)

> 这是一个由「锤无双」开发的免费开源 Skill，提供基于中国传统「周公解梦」理论结合现代心理学的梦境象征解析。
>
> A traditional Chinese dream interpretation skill for [WorkBuddy](https://www.codebuddy.cn) based on Zhou Gong's Dream Dictionary.

[中文](#) | [English](#english)

---

## 这是什么？

这是一个由「锤无双」开发的免费开源 Skill，提供基于中国传统「周公解梦」理论结合现代心理学的梦境象征解析。

当你向你的 AI 工具描述梦境时，这个技能会自动触发，为你提供：

- **传统解梦视角** — 基于周公解梦经典象征体系
- **现代心理分析** — 结合潜意识、情绪与压力源分析
- **结构化解析报告** — 清晰分层的梦境解读，包含运势判断与生活建议

## 触发方式

以下任意表述都会激活此技能：

- "周公解梦"
- "我梦见..."
- "梦见...是什么意思"
- "dream interpretation"
- "what does it mean when I dream about..."

## 安装

```bash
npx skills add chuiziyao/zhougong-dream@zhougong-dream
```

## 梦境解析示例

### 示例 1：职场焦虑梦
> "梦见过年前被单位裁员，老乡领导笑眯眯地给我离职材料..."

**解析要点**：
- 年关 + 被裁 = 归属创伤（职场与"家"的边界混淆）
- HR 被裁 = 身份倒错恐惧（工具人焦虑）
- 笑眯眯的领导 = 无法反驳的恶意
- 无赔偿 = 付出被清零的恐惧

**结论**：凶梦，但吉在"知凶"——潜意识提醒你对"随时可被牺牲"的预期本身，就是最大的职场风险。

### 示例 2：权力叙事梦
> "梦见帮干爹打通矿权审批，联系老同学、拥抱老领导，最后拿到 5% 干股..."

**解析要点**：
- 矿 + AI 算力 = 借老壳装新酒的真实野心
- 25 万感谢费 = 对灰色规则的肌肉记忆
- 20 年未见的邵总 = 失落的技术自我
- 5% 代持 = 潜意识里的法律防火墙
- **顺利了就醒** = 潜意识在最后一刻按了停止键

**结论**：大吉之下藏大凶——潜意识拒绝替你完成道德确认。

## 解梦框架

此技能采用五步工作流：

1. **收集梦境细节** — 人物、场景、动作、情绪、颜色、数字
2. **识别核心象征** — 将梦境拆解为独立符号元素
3. **应用解释框架** — 传统释义 + 心理象征 + 生活情境 + 情绪共鸣
4. **综合意义** — 识别主导主题、冲突符号与整体情绪基调
5. **交付解析** — 结构化报告（梦境概述 → 象征解析 → 整体运势 → 生活启示 → 建议）

## 象征词典

包含 A-Z 数百个梦境符号的详细释义，涵盖：

- 自然元素（水、火、山、树等）
- 动物（龙、虎、蛇、鱼等）
- 人物（父母、陌生人、逝者等）
- 物品与动作（飞行、坠落、考试、牙齿脱落等）
- 建筑与场所（家、学校、医院等）
- 颜色与数字的象征意义
- 传统吉凶梦分类

详见 [`references/dream_dictionary.md`](references/dream_dictionary.md)。

## 解梦原则

1. **情境优先** — 同一符号在不同情境下意义不同
2. **情感真实重于事实真实** — 梦的感受比事件更重要
3. **个人联想优先于通用释义** — 对梦者有特殊意义的符号优先
4. **重复梦境 = 重要信号** — 反复出现的梦值得特别关注
5. **避免宿命论** — 解析是洞察与可能性，而非固定预言

## 文件结构

```
zhougong-dream/
├── SKILL.md                      # 技能主文件（触发逻辑与工作流）
├── README.md                     # 本文件
└── references/
    └── dream_dictionary.md       # 梦境象征词典
```

---

---

## 仓库地址

https://github.com/chuiziyao/zhougong-dream

## 版本

**v1.0.1**

---

## English

### What is this?

A WorkBuddy skill that provides dream interpretation based on traditional Chinese "Zhou Gong's Dream Dictionary" combined with modern psychology.

### Install

```bash
npx skills add chuiziyao/zhougong-dream@zhougong-dream
```

### Triggers

- "Zhou Gong dream interpretation"
- "I dreamed about..."
- "What does it mean when I dream about..."
- Any dream-related inquiry in Chinese or English

### Features

- **Traditional Chinese symbolism** — Classical dream dictionary meanings
- **Modern psychological analysis** — Subconscious desires, fears, and life context
- **Structured reports** — Symbol analysis, fortune indication, and actionable insights
- **Comprehensive dictionary** — A-Z dream symbols with detailed meanings

## License

MIT
