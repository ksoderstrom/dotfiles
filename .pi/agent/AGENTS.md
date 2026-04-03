## Global coding-agent instructions

### Search and discovery tools

- Always use `rg` instead of `grep` for text search.
- Always use `fd` instead of `find` for file discovery.
- Always use `sd` instead of `sed` for text replacement in shell commands.
- Preferred patterns:
  - `rg "<pattern>" <path>`
  - `fd "<name-or-regex>" <path>`
  - `fd -H "<name-or-regex>" <path>` (when matching hidden files like `.env`, `.tmux.conf`, `.github/`)
  - `sd "<from>" "<to>" <file>`
- Do not use `grep` or `find` unless the user explicitly asks for them.
- Do not use `sed` unless the user explicitly asks for it, or `sd` cannot express the needed edit safely.

### Preferred command examples

#### `rg` examples

- Basic recursive text search:
  - `rg "TODO|FIXME" .`

- Case-insensitive search:
  - `rg -i "auth token|bearer" src/`

- Restrict by file type:
  - `rg "createServer|fastify" --type ts src/`

- Restrict by glob:
  - `rg "useEffect\(" -g "*.tsx" app/`

- Include hidden files but ignore `.git`:
  - `rg --hidden --glob '!.git' "API_KEY|SECRET" .`

- Show line numbers with surrounding context:
  - `rg -n -C 2 "rateLimit|throttle" server/`

- Find exact literal strings (no regex):
  - `rg -F "import.meta.env" web/`

- Find likely hardcoded credentials while excluding lock/vendor dirs:
  - `rg -n --hidden --glob '!.git' --glob '!node_modules' --glob '!dist' --glob '!vendor' '(api[_-]?key|secret|token|password)\\s*[:=]' .`

- Search multiple roots in one command:
  - `rg -n "TODO" src/ tests/ scripts/`

#### `fd` examples

- Basic file name search:
  - `fd "config" .`

- Regex file name search:
  - `fd ".*\\.test\\.(ts|tsx|js)$" .`

- Restrict by extension:
  - `fd -e ts -e tsx "" src/`

- Restrict by type (files only):
  - `fd -t f "docker" .`

- Restrict by type (directories only):
  - `fd -t d "migrations|seeds" .`

- Include hidden, exclude noisy directories:
  - `fd -H --exclude .git --exclude node_modules --exclude dist "" .`

- Find hidden dotfiles explicitly:
  - `fd -H "^\\.tmux\\.conf$" ~`
  - `fd -H "^\\.env(\\..+)?$" .`

- Find recently changed files (composed with `xargs`):
  - `fd -e ts -e tsx . src/ | xargs ls -lt | head -n 30`

- Find files and run a command on each:
  - `fd -e md "" docs/ -x rg -n "deprecated|obsolete" {}`

- Find large JSON files (composed pipeline):
  - `fd -e json . . -X du -h | sort -h | tail -n 20`

#### `sd` examples

- Basic in-file replacement:
  - `sd "foo" "bar" src/config.ts`

- Regex replacement with capture groups:
  - `sd "(\w+)Service" "$1Client" src/services.ts`

- Replace import paths:
  - `sd "@/components/" "@/ui/" src/pages/home.tsx`

- Normalize whitespace around `=`:
  - `sd "\s*=\s*" " = " .env.example`

- Batch replace over matched files with `fd`:
  - `fd -e ts -e tsx . src/ -X sd "from '@/old'" "from '@/new'"`

- Safe preview pattern (show candidates with `rg` before replacing):
  - `rg -n "legacyFunction\(" src/`
  - `fd -e ts . src/ -X sd "legacyFunction\(" "modernFunction("`

#### Combined `fd` + `rg` workflows

- Search only in files matched by `fd`:
  - `fd -e ts -e tsx . src/ -X rg -n "useMemo|useCallback"`

- Search all SQL migrations for dangerous operations:
  - `fd -e sql "" db/migrations -X rg -n "DROP TABLE|TRUNCATE|DELETE FROM"`

- Audit environment variable usage in backend files only:
  - `fd -e ts -e js . backend/ -X rg -n "process\\.env\\.[A-Z0-9_]+"`

- Prioritize likely relevant files, then search within them:
  - `fd "(auth|session|token)" src/ -X rg -n "TODO|FIXME|HACK"`
