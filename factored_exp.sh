#!/bin/sh

LANG1="en"
LANG2="am"
START_DIR="$HOME/Desktop/data"
EXP_DIR="fact_morph_"$LANG2"_"$LANG1

# mkdir $HOME/$EXP_DIR
# mkdir $HOME/$EXP_DIR/corpus
# mkdir $HOME/$EXP_DIR/working
# mkdir $HOME/$EXP_DIR/lm
# mkdir $HOME/$EXP_DIR/pre_process

SRC="$START_DIR/$LANG1"_"$LANG2/"
SELECTOR_SCRIPS="$START_DIR/scripts/selector_test_tune.py"
COMBINE_FILES="$START_DIR/scripts/combine.py"
MOSSES_TOKEN="$HOME/master-mosesdecoder/scripts/tokenizer/tokenizer.perl"
MOSSES_TRUE_CASE_MOD="$HOME/master-mosesdecoder/scripts/recaser/train-truecaser.perl"
MOSSES_TRUE_CASE_BULD="$HOME/master-mosesdecoder/scripts/recaser/truecase.perl"
MOSSES_CLEAN="$HOME/master-mosesdecoder/scripts/training/clean-corpus-n.perl"
MOSSES_TRN="$HOME/master-mosesdecoder/scripts/training/train-model.perl"
MOSSES_MERT="$HOME/master-mosesdecoder/scripts/training/mert-moses.pl"
CORPUS="$HOME/$EXP_DIR/corpus"
PreProcess="$HOME/$EXP_DIR/pre_process"
SPACE_NORM="$START_DIR/scripts/amh_space_normalizor.py"
CHAR_NORM="$START_DIR/scripts/amh_char_normalizor_v2.py"
AMH_TAGGER="$START_DIR/scripts/amharic_tagger_with_model.py"
ENG_TAGGER="$START_DIR/scripts/english_tagger_with_model.py"
EXTRACT_TAGS="$START_DIR/scripts/extract_tag.py"
LM="$HOME/$EXP_DIR/lm"
WORKING="$HOME/$EXP_DIR/working"


# cp "$SRC$LANG1.txt"  "$PreProcess/"
# cp "$SRC$LANG2.txt"  "$PreProcess/"

# cd $PreProcess
# python3  "$SELECTOR_SCRIPS" $LANG1 $LANG2

# # # English tokenization and truecasing
# "$MOSSES_TOKEN"  -l en < "$PreProcess/train.$LANG1" > "$PreProcess/train.$LANG1.tok.$LANG1"
# "$MOSSES_TRUE_CASE_MOD"  --model "$PreProcess/truecase-model.$LANG1" --corpus "$PreProcess/train.$LANG1.tok.$LANG1"
# "$MOSSES_TRUE_CASE_BULD"  --model "$PreProcess/truecase-model.$LANG1" < "$PreProcess/train.$LANG1.tok.$LANG1" > "$PreProcess/train.true.$LANG1"


# "$MOSSES_TOKEN" -l en < "$PreProcess/tune.$LANG1" > "$PreProcess/tune.$LANG1.tok.$LANG1"
# "$MOSSES_TRUE_CASE_MOD"  --model "$PreProcess/truecase-model2.$LANG1" --corpus "$PreProcess/tune.$LANG1.tok.$LANG1"
# "$MOSSES_TRUE_CASE_BULD"  --model "$PreProcess/truecase-model2.$LANG1" < "$PreProcess/tune.$LANG1.tok.$LANG1" > "$PreProcess/tune.true.$LANG1"


# "$MOSSES_TOKEN" -l en < "$PreProcess/test.$LANG1" > "$PreProcess/test.$LANG1.tok.$LANG1"
# "$MOSSES_TRUE_CASE_MOD"  --model "$PreProcess/truecase-model3.$LANG1" --corpus "$PreProcess/test.$LANG1.tok.$LANG1"
# "$MOSSES_TRUE_CASE_BULD"  --model "$PreProcess/truecase-model3.$LANG1" < "$PreProcess/test.$LANG1.tok.$LANG1" > "$PreProcess/test.true.$LANG1"

# #Return to 
# # # Amharic tokenization and character normalaization
# cd "$START_DIR/scripts/"

# python2 "$SPACE_NORM" "$PreProcess/train."$LANG2
# python2 "$SPACE_NORM" "$PreProcess/tune."$LANG2
# python2 "$SPACE_NORM" "$PreProcess/test."$LANG2

# python2 "$CHAR_NORM" "$PreProcess/train."$LANG2
# python2 "$CHAR_NORM" "$PreProcess/tune."$LANG2
# python2 "$CHAR_NORM" "$PreProcess/test."$LANG2

# mv "$PreProcess/train.$LANG2" "$PreProcess/train.true."$LANG2 
# mv "$PreProcess/tune.$LANG2" "$PreProcess/tune.true."$LANG2 
# mv "$PreProcess/test.$LANG2" "$PreProcess/test.true."$LANG2


# "$MOSSES_CLEAN" "$PreProcess/train.true" $LANG2 $LANG1 "$PreProcess/train.clean" 1 80

# cp "$PreProcess/train.clean."$LANG1 "$PreProcess/train.clean."$LANG2 "$CORPUS"
# cp "$PreProcess/tune.true."$LANG1 "$PreProcess/tune.true."$LANG2 "$CORPUS"
# cp "$PreProcess/test.true."$LANG1 "$PreProcess/test.true."$LANG2 "$CORPUS"

# # # #Tagging with best model yet

# cd $CORPUS

# python3 "$ENG_TAGGER" "$CORPUS/train.clean.$LANG1"
# python3 "$ENG_TAGGER" "$CORPUS/tune.true.$LANG1"
# python3 "$AMH_TAGGER" "$CORPUS/train.clean.$LANG2"
# python3 "$AMH_TAGGER" "$CORPUS/tune.true.$LANG2"


# # # # # language model creation
# cd $LM
# python3 "$COMBINE_FILES" "$PreProcess/train.true."$LANG1  "$PreProcess/tune.true."$LANG1 "$LM/combined_lm.$LANG1"
# python3 "$COMBINE_FILES" "$PreProcess/train.true."$LANG2  "$PreProcess/tune.true."$LANG2 "$LM/combined_lm.$LANG2"

# python3 "$COMBINE_FILES" "$CORPUS/train.clean_tagged."$LANG1  "$CORPUS/tune.true_tagged."$LANG1 "$LM/combined_tagged_lm.$LANG1"
# python3 "$COMBINE_FILES" "$CORPUS/train.clean_tagged."$LANG2  "$CORPUS/tune.true_tagged."$LANG2 "$LM/combined_tagged_lm.$LANG2"

# python3 "$EXTRACT_TAGS" "$LM/combined_tagged_lm.$LANG1" "lemma"
# python3 "$EXTRACT_TAGS" "$LM/combined_tagged_lm.$LANG1" "pos"
# python3 "$EXTRACT_TAGS" "$LM/combined_tagged_lm.$LANG2" "lemma"
# python3 "$EXTRACT_TAGS" "$LM/combined_tagged_lm.$LANG2" "pos"

# cd $LM

# $HOME/irstlm/bin/add-start-end.sh <"$LM/combined_lm.$LANG1" > "$LM/combined_lm_start_end.$LANG1"
# $HOME/irstlm/bin/add-start-end.sh <"$LM/combined_lm.$LANG2" > "$LM/combined_lm_start_end.$LANG2"
# $HOME/irstlm/bin/add-start-end.sh <"$LM/combined_tagged_lm_lemma.$LANG1" > "$LM/combined_tagged_lm_lemma_start_end.$LANG1"
# $HOME/irstlm/bin/add-start-end.sh <"$LM/combined_tagged_lm_lemma.$LANG2" > "$LM/combined_tagged_lm_lemma_start_end.$LANG2"
# $HOME/irstlm/bin/add-start-end.sh <"$LM/combined_tagged_lm_pos.$LANG1" > "$LM/combined_tagged_lm_pos_start_end.$LANG1"
# $HOME/irstlm/bin/add-start-end.sh <"$LM/combined_tagged_lm_pos.$LANG2" > "$LM/combined_tagged_lm_pos_start_end.$LANG2"

# export IRSTLM=$HOME/irstlm;
# $HOME/irstlm/bin/build-lm.sh -i "$LM/combined_lm_start_end.$LANG1" -n 3 -t /tmp -p -s improved-kneser-ney -o "$LM/surface.$LANG1.gz" -k 10
# $HOME/irstlm/bin/build-lm.sh -i "$LM/combined_lm_start_end.$LANG2" -n 3 -t /tmp -p -s improved-kneser-ney -o "$LM/surface.$LANG2.gz" -k 10
# $HOME/irstlm/bin/build-lm.sh -i "$LM/combined_tagged_lm_lemma_start_end.$LANG1" -n 3 -t /tmp -p -s improved-kneser-ney -o "$LM/lemma.$LANG1.gz" -k 10
# $HOME/irstlm/bin/build-lm.sh -i "$LM/combined_tagged_lm_lemma_start_end.$LANG2" -n 3 -t /tmp -p -s improved-kneser-ney -o "$LM/lemma.$LANG2.gz" -k 10
# $HOME/irstlm/bin/build-lm.sh -i "$LM/combined_tagged_lm_pos_start_end.$LANG1" -n 3 -t /tmp -p -s improved-kneser-ney -o "$LM/pos.$LANG1.gz" -k 10
# $HOME/irstlm/bin/build-lm.sh -i "$LM/combined_tagged_lm_pos_start_end.$LANG2" -n 3 -t /tmp -p -s improved-kneser-ney -o "$LM/pos.$LANG2.gz" -k 10

# $HOME/irstlm/bin/compile-lm "$LM/surface.$LANG1.gz" "$LM/surface.blm.$LANG1"
# $HOME/irstlm/bin/compile-lm "$LM/surface.$LANG2.gz" "$LM/surface.blm.$LANG2"
# $HOME/irstlm/bin/compile-lm "$LM/lemma.$LANG1.gz" "$LM/lemma.blm.$LANG1"
# $HOME/irstlm/bin/compile-lm "$LM/lemma.$LANG2.gz" "$LM/lemma.blm.$LANG2"
# $HOME/irstlm/bin/compile-lm "$LM/pos.$LANG2.gz" "$LM/pos.blm.$LANG1"
# $HOME/irstlm/bin/compile-lm "$LM/pos.$LANG2.gz" "$LM/pos.blm.$LANG2"

# # ##Translation Model-------------------------------------------------------------------------

# cd $WORKING

# "$MOSSES_TRN" -cores 4 -mgiza -mgiza-cpus 4\
#     -root-dir "$WORKING/train" \
#     -corpus "$CORPUS/train.clean_tagged" \
#     -f "$LANG2" -e "$LANG1" \
#     -lm 0:3:"$LM/surface.blm.$LANG1" \
#     -lm 1:3:"$LM/lemma.blm.$LANG1" \
#     -lm 2:3:"$LM/pos.blm.$LANG1" \
#     -alignment-factors 0,1,2-0,1,2 \
#     -translation-factors 0-0+0-0,1+0-0,2 \
#     -generation-factors 0-1+0,1-1,2+0-0,1,2  \
#     -decoding-steps t0,g0,t1,g1,t2,g2 \
#     -external-bin-dir "/home/tsegaye/master-moses-traing-tools/"

# sed -i -e "s/KENLM/IRSTLM/g" "$WORKING/train/model/moses.ini"

# cd $WORKING

# "$MOSSES_MERT"\
#     "$CORPUS/tune.true.$LANG1" "$CORPUS/tune.true.$LANG2"\
#     "$HOME/master-mosesdecoder/bin/moses" \
#     "$WORKING/train/model/moses.ini" \
#     -mertdir "$HOME/master-mosesdecoder/bin" \
#     -rootdir "$HOME/master-mosesdecoder/scripts"

# ####Binaries-------------------------------------------------------------------------------
mkdir "$WORKING/binarised-model"
cd $WORKING

####Binaries----------------------------------------------------------------------------------------------------

"$HOME/master-mosesdecoder/bin/processPhraseTableMin" \
-in "$WORKING/train/model/phrase-table.0-0.gz" \
-nscores 4 -out "$WORKING/binarised-model/phrase-table.0-0.minphr"

"$HOME/master-mosesdecoder/bin/processPhraseTableMin" \
-in "$WORKING/train/model/phrase-table.0-0,1.gz" \
-nscores 4 -out "$WORKING/binarised-model/phrase-table.0-0,1.minphr"

"$HOME/master-mosesdecoder/bin/processPhraseTableMin" \
-in "$WORKING/train/model/phrase-table.0-0,2.gz" \
-nscores 4 -out "$WORKING/binarised-model/phrase-table.0-0,2.minphr"

# # # # # step final

cp "$WORKING/mert-work/moses.ini" "$WORKING/binarised-model"

sed -i -e "s/PhraseDictionaryMemory/PhraseDictionaryCompact/g" "$WORKING/binarised-model/moses.ini"
sed -i  -e "s#path=$WORKING/train/model/phrase-table.0-0.gz#path=$WORKING/binarised-model/phrase-table.0-0.minphr#g" "$WORKING/binarised-model/moses.ini"
sed -i  -e "s#path=$WORKING/train/model/phrase-table.0-0,1.gz#path=$WORKING/binarised-model/phrase-table.0-0,1.minphr#g" "$WORKING/binarised-model/moses.ini"
sed -i  -e "s#path=$WORKING/train/model/phrase-table.0-0,2.gz#path=$WORKING/binarised-model/phrase-table.0-0,2.minphr#g" "$WORKING/binarised-model/moses.ini"

# ####test with file-------------------------------------------------------------------------------------------

"$HOME/master-mosesdecoder/scripts/training/filter-model-given-input.pl" "$WORKING/filtered-test."$LANG2 "$WORKING/binarised-model/moses.ini" "$CORPUS/test.true.$LANG2" -Binarizer "$HOME/master-mosesdecoder/bin/processPhraseTableMin"

# # ###bleu----------------------------------------------------------------------------------------------------------

"$HOME/master-mosesdecoder/bin/moses" -f "$WORKING/filtered-test."$LANG2"/moses.ini" < "$CORPUS/test.true.$LANG2" > "$CORPUS/test.translated.$LANG1"

# # #run blue script------------------------------------------------------------------------------------------------
"$HOME/master-mosesdecoder/scripts/generic/multi-bleu.perl" -lc "$CORPUS/test.true.$LANG1" < "$CORPUS/test.translated.$LANG1" > "$HOME/$EXP_DIR/blue_to_$LANG1.txt"

echo "writting BLUE for EXP-$LANG2-$LANG1 Done!! "
# echo "================================================================================"
# echo "Starting EXP-$LANG1-$LANG2"

# cd "$START_DIR/scripts/"

# bash bi_factored_exp.sh