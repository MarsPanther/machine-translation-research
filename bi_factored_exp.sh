#!/bin/sh

LANG1="en"
LANG2="am"
START_DIR="$HOME/Desktop/data"
EXP_DIR="Factored-generation-and-translation3-$LANG1-$LANG2"

mkdir $HOME/$EXP_DIR
mkdir $HOME/$EXP_DIR/corpus
mkdir $HOME/$EXP_DIR/working
mkdir $HOME/$EXP_DIR/lm
mkdir $HOME/$EXP_DIR/pre_process

SRC="$START_DIR/tree_$LANG1"_"$LANG2/"
SELECTOR_SCRIPS="$START_DIR/scripts/selector_test_tune.py"
COMBINE_FILES="$START_DIR/scripts/combine.py"
MOSSES_TOKEN="$HOME/mosesdecoder/scripts/tokenizer/tokenizer.perl"
MOSSES_TRUE_CASE_MOD="$HOME/mosesdecoder/scripts/recaser/train-truecaser.perl"
MOSSES_TRUE_CASE_BULD="$HOME/mosesdecoder/scripts/recaser/truecase.perl"
MOSSES_CLEAN="$HOME/mosesdecoder/scripts/training/clean-corpus-n.perl"
MOSSES_TRN="$HOME/mosesdecoder/scripts/training/train-model.perl"
MOSSES_MERT="$HOME/mosesdecoder/scripts/training/mert-moses.pl"
CORPUS="$HOME/$EXP_DIR/corpus"
PreProcess="$HOME/$EXP_DIR/pre_process"
SPACE_NORM="$START_DIR/scripts/amh_space_normalizor.py"
CHAR_NORM="$START_DIR/scripts/amh_char_normalizor_v2.py"
AMH_TAGGER="$START_DIR/scripts/amharic_tagger_with_model.py"
ENG_TAGGER="$START_DIR/scripts/english_tagger_with_model.py"
EXTRACT_TAGS="$START_DIR/scripts/extract_tag.py"
LM="$HOME/$EXP_DIR/lm"
WORKING="$HOME/$EXP_DIR/working"

PREV_SRC="$HOME/Factored-generation-and-translation3-$LANG2-$LANG1"

cp -R "$PREV_SRC/corpus/." "$HOME/$EXP_DIR/corpus"
cp -R "$PREV_SRC/lm/." "$HOME/$EXP_DIR/lm"


rm -rf "$HOME/$EXP_DIR/corpus/train.clean_tagged.0-0.$LANG1"
rm -rf "$HOME/$EXP_DIR/corpus/train.clean_tagged.0-0.$LANG2"
rm -rf "$HOME/$EXP_DIR/corpus/test.translated.$LANG1"

# ##Translation Model-------------------------------------------------------------------------
cd $WORKING

"$MOSSES_TRN" -cores 4 \
    -root-dir "$WORKING/train/model" \
    -corpus "$CORPUS/train.clean_tagged" \
    -f "$LANG1" -e "$LANG2" \
    -lm 0:3:"$LM/surface.blm."$LANG2 \
    -lm 2:3:"$LM/pos.blm."$LANG2 \
    -translation-factors 0-0 \
    -generation-factors 0-2 \
    -generation-type single \
    -decoding-steps t0,g0 \
    -external-bin-dir "$HOME/mosesdecoder/tools"

cd $WORKING

"$MOSSES_MERT" "$CORPUS/tune.true.$LANG1" "$CORPUS/tune.true.$LANG2" \
    "$HOME/mosesdecoder/bin/moses" \
    "$WORKING/train/model/model/moses.ini" \
    -mertdir "$HOME/mosesdecoder/bin/" \
    -rootdir "$HOME/mosesdecoder/scripts" \
    -decoder-flags '-threads 4'


####Binaries-------------------------------------------------------------------------------
mkdir "$WORKING/binarised-model"
cd $WORKING

# ####Binaries----------------------------------------------------------------------------------------------------

"$HOME/mosesdecoder/bin/processPhraseTableMin" \
-in "$WORKING/train/model/model/phrase-table.0-0.gz" \
-nscores 4 -out "$WORKING/binarised-model/phrase-table"

# # # step final

cp "$WORKING/mert-work/moses.ini" "$WORKING/binarised-model"

sed -i -e "s/PhraseDictionaryMemory/PhraseDictionaryCompact/g" "$WORKING/binarised-model/moses.ini"
sed -i -e "s/SRILM/KENLM/g" "$WORKING/binarised-model/moses.ini"
sed -i  -e "s#path=$WORKING/train/model/model/phrase-table.0-0.gz#path=$WORKING/binarised-model/phrase-table.minphr#g" "$WORKING/binarised-model/moses.ini"

####test with file-------------------------------------------------------------------------------------------

"$HOME/mosesdecoder/scripts/training/filter-model-given-input.pl" "$WORKING/filtered-test."$LANG1 "$WORKING/binarised-model/moses.ini" "$CORPUS/test.true."$LANG1 -Binarizer "$HOME/mosesdecoder/bin/processPhraseTableMin"

# ###bleu----------------------------------------------------------------------------------------------------------

"$HOME/mosesdecoder/bin/moses" -f "$WORKING/filtered-test."$LANG1"/moses.ini" < "$CORPUS/test.true."$LANG1 > "$CORPUS/test.translated."$LANG2

# #run blue script------------------------------------------------------------------------------------------------
"$HOME/mosesdecoder/scripts/generic/multi-bleu.perl" -lc "$CORPUS/test.true."$LANG2 < "$CORPUS/test.translated."$LANG2 > "$HOME/$EXP_DIR/blue_to_$LANG1.txt"
echo "Success !!! Two Experiment done"