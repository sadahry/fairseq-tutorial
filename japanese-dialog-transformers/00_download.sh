#!/bin/bash
COMMIT=88d0c3eb361cc632c659d7f1ecf75ec4c5c0ddbb

mkdir -p scripts/
mkdir -p data/sp/

echo "*** copy from japanese-dialog-transformers ***"
git clone https://github.com/nttcslab/japanese-dialog-transformers.git
(cd japanese-dialog-transformers; git checkout $COMMIT)

wget -P data/pretrained https://www.dropbox.com/s/k3ugxmr7nw6t86l/japanese-dialog-transformer-1.6B.pt
wget -P data/perchat https://www.dropbox.com/s/sda9wzexh7ntlij/japanese_persona_chat.xlsx

cp  japanese-dialog-transformers/scripts/extract_persona_chat.py scripts/
cp  japanese-dialog-transformers/scripts/tokenize.sh scripts/
cp  japanese-dialog-transformers/data/dicts/* data/sp/
yes | rm -R japanese-dialog-transformers
