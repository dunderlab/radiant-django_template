#!/bin/zsh

# Get distribution name from .p4a config file
DIST_NAME=$(grep -E '^--dist_name ' .p4a | awk '{print $2}')

# Display distribution name
echo "$DIST_NAME"

rm -R django/
rm -R radiant/
rm blacklist.txt
rm whitelist.txt

if [ -f "$DIST_NAME/manage.py" ]; then
    pip download --no-deps django
    unzip django*.whl "django/*" -d .
    pip download  --no-deps radiant-compiler
    unzip radiant_compiler*.whl "radiant/*" -d .
    echo '
    import sys
    import os
    from radiant.compiler import server
    with open(".p4a", "r", encoding="utf-8") as f:
      for line in f:
          if line.strip().startswith("--port"):
              PORT = int(line.split()[1])
          if line.strip().startswith("--dist_name"):
              DIST_NAME = int(line.split()[1])
    sys.path.append(os.path.join(os.path.dirname(__file__)))
    sys.path.append(os.path.join(os.path.dirname(__file__), DIST_NAME))
    server.main(DIST_NAME, ip="localhost", port=PORT)
    ' > main.py
fi

rm *.whl

echo "*.pyc" > blacklist.txt
echo "sqlite3/*" >> whitelist.txt
echo "lib-dynload/_sqlite3.so" >> whitelist.txt
echo "*.py" >> whitelist.txt

radiant_p4a apk --arch arm64-v8a