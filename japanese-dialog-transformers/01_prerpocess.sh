#!/bin/bash
mkdir -p data/perchat/raw
mkdir -p data/perchat/spaced

set -eu

echo "*** extract_persona_chat ***"
python scripts/extract_persona_chat.py data/perchat/japanese_persona_chat.xlsx data/perchat/raw

echo "*** tokenize_sp ***"
python scripts/tokenize_sp.py data/perchat/raw data/perchat/spaced

echo "*** fairseq-preprocess ***"
fairseq-preprocess \
    --trainpref data/perchat/spaced/train \
    --validpref data/perchat/spaced/valid \
    --testpref data/perchat/spaced/test \
    --source-lang src \
    --target-lang dst \
    --destdir data/perchat/bin \
    --tokenizer space \
    --srcdict data/sp/sp_oall_32k.txt \
    --tgtdict data/sp/sp_oall_32k.txt
