## Usage
```
cp $DOT_DIR/serena/project.yml .serena/project.yml
sed -i 's/__PROJECT_NAME__/sis-mail-lambda/' .serena/project.yml
sed -i 's/__LANG__/python/' .serena/project.yml
```

## Future work
派生テンプレ
```
dotfiles/serena/
├─ project.base.yml        # ← 今回のやつ
├─ project.readonly.yml    # read_only: true
├─ project.ts.yml          # languages: [typescript]
├─ project.py.yml          # languages: [python]
```
