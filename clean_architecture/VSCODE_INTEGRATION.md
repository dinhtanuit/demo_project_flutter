# VS Code Integration for Mason Templates

## Setup trong VS Code

### 1. Install Extension (Optional)

Bạn có thể cài extension Mason để dễ dàng hơn:
- Search "Mason" trong VS Code Extensions
- Hoặc dùng terminal như đã làm

### 2. Tạo Task trong VS Code

Tạo file `.vscode/tasks.json`:

```json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Mason: Generate Clean Architecture",
      "type": "shell",
      "command": "mason make clean_architecture",
      "problemMatcher": [],
      "presentation": {
        "echo": true,
        "reveal": "always",
        "focus": true,
        "panel": "dedicated"
      }
    }
  ]
}
```

### 3. Tạo Keybinding (Optional)

Thêm vào `.vscode/keybindings.json`:

```json
{
  "key": "ctrl+shift+m",
  "command": "workbench.action.tasks.runTask",
  "args": "Mason: Generate Clean Architecture"
}
```

## Cách sử dụng

### Option 1: Dùng Terminal trong VS Code

```bash
# Tạo module mới
mason make clean_architecture

# Nhập tên module: user_profile
# Output: Sinh tất cả file trong lib/features/user_profile/
```

### Option 2: Dùng VS Code Task

1. Nhấn `Cmd+Shift+P` (macOS) hoặc `Ctrl+Shift+P` (Windows/Linux)
2. Gõ "Tasks: Run Task"
3. Chọn "Mason: Generate Clean Architecture"
4. Nhập tên module

### Option 3: Dùng Snippet (Advanced)

Tạo file `.vscode/snippets.code-snippets`:

```json
{
  "Generate Clean Architecture Module": {
    "prefix": "mason-ca",
    "body": [
      "// Run: mason make clean_architecture --name ${1:module_name}",
      "// Generated files:",
      "// - lib/features/${1:module_name}/presentation/",
      "// - lib/features/${1:module_name}/domain/",
      "// - lib/features/${1:module_name}/data/"
    ],
    "description": "Generate Clean Architecture module with Mason"
  }
}
```

## Quick Commands

```bash
# List available bricks
mason list

# Get brick info
mason describe clean_architecture

# Generate with default values
echo "user_profile" | mason make clean_architecture

# Delete generated module
rm -rf lib/features/test_feature
```

## Tips

1. **Tạo alias** trong `~/.zshrc`:
```bash
alias mca='mason make clean_architecture'
```

2. **Git ignore generated files** (optional):
Thêm vào `.gitignore` nếu muốn ignore test modules:
```
lib/features/test_*/
```

3. **Auto format sau khi generate**:
```bash
mason make clean_architecture && dart format lib/
```

## Troubleshooting

### Lỗi "command not found: mason"
- Kiểm tra PATH: `echo $PATH | grep .pub-cache`
- Nếu chưa có, thêm vào ~/.zshrc:
  ```bash
  export PATH="$PATH":"$HOME/.pub-cache/bin"
  source ~/.zshrc
  ```

### Lỗi "Could not find a subcommand"
- Chạy `mason get` để sync bricks
- Kiểm tra `mason.yaml` có đúng tên brick

### Import errors sau khi generate
- Chạy `flutter pub get` để install dependencies:
  - get
  - dartz
  - equatable
