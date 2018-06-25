#!/bin/sh

LANG1="en"
LANG2="am"

MT_TEST_DIR_DIR="MT_TEST_DIR-$LANG2-$LANG1"

# mkdir $HOME/$MT_TEST_DIR_DIR
# mkdir $HOME/$MT_TEST_DIR_DIR/corpus
# mkdir $HOME/$MT_TEST_DIR_DIR/working
# mkdir $HOME/$MT_TEST_DIR_DIR/lm
# mkdir $HOME/$MT_TEST_DIR_DIR/pre_process

SRC="$HOME/Desktop/data/$LANG1"_"$LANG2/"
SELECTOR_SCRIPS="$HOME/Desktop/data/scripts/selector_test_tune.py"
COMBINE_FILES="$HOME/Desktop/data/scripts/combine.py"
MOSSES_TOKEN="$HOME/moses/scripts/tokenizer/tokenizer.perl"
MOSSES_TRUE_CASE_MOD="$HOME/moses/scripts/recaser/train-truecaser.perl"
MOSSES_TRUE_CASE_BULD="$HOME/moses/scripts/recaser/truecase.perl"
MOSSES_CLEAN="$HOME/moses/scripts/training/clean-corpus-n.perl"
MOSSES_TRN="$HOME/moses/scripts/training/train-model.perl"
MOSSES_MERT="$HOME/moses/scripts/training/mert-moses.pl"
CORPUS="$HOME/$MT_TEST_DIR_DIR/corpus"
PreProcess="$HOME/$MT_TEST_DIR_DIR/pre_process"
SPACE_NORM="$HOME/Desktop/data/scripts/amh_space_normalizor.py"
CHAR_NORM="$HOME/Desktop/data/scripts/amh_char_normalizor_v2.py"
AMH_TAGGER="$HOME/Desktop/data/scripts/amharic_tagger_with_model.py"
ENG_TAGGER="$HOME/Desktop/data/scripts/english_tagger_with_model.py"
EXTRACT_TAGS="$HOME/Desktop/data/scripts/extract_tag.py"
LM="$HOME/$MT_TEST_DIR_DIR/lm"
WORKING="$HOME/$MT_TEST_DIR_DIR/working"


# cp "$SRC$LANG1.txt"  "$PreProcess/"
# cp "$SRC$LANG2.txt"  "$PreProcess/"

# cd $PreProcess 
# python3  "$SELECTOR_SCRIPS" $LANG1 $LANG2


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
# cd "$HOME/Desktop/data/scripts/"

# if [ $LANG2="am" ]
# 	then
# 		python2 "$SPACE_NORM" "$PreProcess/train."$LANG2
# 		python2 "$SPACE_NORM" "$PreProcess/tune."$LANG2
# 		python2 "$SPACE_NORM" "$PreProcess/test."$LANG2

# 		python2 "$CHAR_NORM" "$PreProcess/train."$LANG2
# 		python2 "$CHAR_NORM" "$PreProcess/tune."$LANG2
# 		python2 "$CHAR_NORM" "$PreProcess/test."$LANG2

# 		mv "$PreProcess/train.$LANG2" "$PreProcess/train.true."$LANG2 
# 		mv "$PreProcess/tune.$LANG2" "$PreProcess/tune.true."$LANG2 
# 		mv "$PreProcess/test.$LANG2" "$PreProcess/test.true."$LANG2 

# elif [ $LANG2="tg" ]
# 	then
# 		python2 "$SPACE_NORM" "$PreProcess/train."$LANG2
# 		python2 "$SPACE_NORM" "$PreProcess/tune."$LANG2
# 		python2 "$SPACE_NORM" "$PreProcess/test."$LANG2

# 		python2 "$CHAR_NORM" "$PreProcess/train."$LANG2
# 		python2 "$CHAR_NORM" "$PreProcess/tune."$LANG2
# 		python2 "$CHAR_NORM" "$PreProcess/test."$LANG2

# 		mv "$PreProcess/train.$LANG2" "$PreProcess/train.true."$LANG2 
# 		mv "$PreProcess/tune.$LANG2" "$PreProcess/tune.true."$LANG2 
# 		mv "$PreProcess/test.$LANG2" "$PreProcess/test.true."$LANG2 
# elif [ $LANG2="ge" ]
# 	then
# 		python2 "$SPACE_NORM" "$PreProcess/train."$LANG2
# 		python2 "$SPACE_NORM" "$PreProcess/tune."$LANG2
# 		python2 "$SPACE_NORM" "$PreProcess/test."$LANG2

# 		python2 "$CHAR_NORM" "$PreProcess/train."$LANG2
# 		python2 "$CHAR_NORM" "$PreProcess/tune."$LANG2
# 		python2 "$CHAR_NORM" "$PreProcess/test."$LANG2

# 		mv "$PreProcess/train.$LANG2" "$PreProcess/train.true."$LANG2 
# 		mv "$PreProcess/tune.$LANG2" "$PreProcess/tune.true."$LANG2 
# 		mv "$PreProcess/test.$LANG2" "$PreProcess/test.true."$LANG2 
# else
# 	"$MOSSES_TOKEN"  -l en < "$PreProcess/train.$LANG2" > "$PreProcess/train.$LANG2.tok.$LANG2"
# 	"$MOSSES_TRUE_CASE_MOD"  --model "$PreProcess/truecase-model4.$LANG2" --corpus "$PreProcess/train.$LANG2.tok.$LANG2"
# 	"$MOSSES_TRUE_CASE_BULD"  --model "$PreProcess/truecase-model4.$LANG2" < "$PreProcess/train.$LANG2.tok.$LANG2" > "$PreProcess/train.true.$LANG2"


# 	"$MOSSES_TOKEN" -l en < "$PreProcess/tune.$LANG2" > "$PreProcess/tune.$LANG2.tok.$LANG2"
# 	"$MOSSES_TRUE_CASE_MOD"  --model "$PreProcess/truecase-model5.$LANG2" --corpus "$PreProcess/tune.$LANG2.tok.$LANG2"
# 	"$MOSSES_TRUE_CASE_BULD"  --model "$PreProcess/truecase-model5.$LANG2" < "$PreProcess/tune.$LANG2.tok.$LANG2" > "$PreProcess/tune.true.$LANG2"

# 	"$MOSSES_TOKEN" -l en < "$PreProcess/test.$LANG2" > "$PreProcess/test.$LANG2.tok.$LANG2"
# 	"$MOSSES_TRUE_CASE_MOD"  --model "$PreProcess/truecase-model6.$LANG2" --corpus "$PreProcess/test.$LANG2.tok.$LANG2"
# 	"$MOSSES_TRUE_CASE_BULD"  --model "$PreProcess/truecase-model6.$LANG2" < "$PreProcess/test.$LANG2.tok.$LANG2" > "$PreProcess/test.true.$LANG2"
	
# fi

# "$MOSSES_CLEAN" "$PreProcess/train.true" $LANG2 $LANG1 "$PreProcess/train.clean" 1 80

# cp "$PreProcess/train.clean."$LANG1 "$PreProcess/train.clean."$LANG2 "$CORPUS"
# cp "$PreProcess/tune.true."$LANG1 "$PreProcess/tune.true."$LANG2 "$CORPUS"
# cp "$PreProcess/test.true."$LANG1 "$PreProcess/test.true."$LANG2 "$CORPUS"

# Tagging with best model yet
# cd $CORPUS
# python3 "$ENG_TAGGER" "$CORPUS/train.clean.$LANG1"
# python3 "$ENG_TAGGER" "$CORPUS/tune.true.$LANG1"
# python3 "$AMH_TAGGER" "$CORPUS/train.clean.$LANG2"
# python3 "$AMH_TAGGER" "$CORPUS/tune.true.$LANG2"

# #language model creation
# cd $LM

# python3 "$COMBINE_FILES" "$PreProcess/train.true."$LANG1  "$PreProcess/tune.true."$LANG1 "$LM/combined_lm.$LANG1"
# python3 "$COMBINE_FILES" "$PreProcess/train.true."$LANG2  "$PreProcess/tune.true."$LANG2 "$LM/combined_lm.$LANG2"

# python3 "$COMBINE_FILES" "$CORPUS/train.clean_tagged."$LANG1  "$CORPUS/tune.true_tagged."$LANG1 "$LM/combined_tagged_lm.$LANG1"
# python3 "$COMBINE_FILES" "$CORPUS/train.clean_tagged."$LANG2  "$CORPUS/tune.true_tagged."$LANG2 "$LM/combined_tagged_lm.$LANG2"

# python3 "$EXTRACT_TAGS" "$LM/combined_tagged_lm.$LANG1"
# python3 "$EXTRACT_TAGS" "$LM/combined_tagged_lm.$LANG2"
# #add start and end of sent using IRSTLM

# #"$HOME/moses/tools/irstlm-5.80.08/trunk/bin/add-start-end.sh" < "$LM/combined."$LANG1 >  "$LM/combined_lm."$LANG1 

# #Using SRILM to compute ngram lang model

# "$HOME/moses/tools/srilm-1.7.2/bin/i686-m64/ngram-count" -text "$LM/combined_lm."$LANG1 -order 3 -lm "$LM/lm.$LANG2-$LANG1.arpa.$LANG1" -kndiscount1 -kndiscount2 -kndiscount3 -interpolate2 -interpolate3 -gt3min 1 -gt2min 1
# "$HOME/moses/tools/srilm-1.7.2/bin/i686-m64/ngram-count" -text "$LM/combined_tagged_lm_tag_sets."$LANG1 -order 3 ‐interpolate ‐kndiscount -lm "$LM/pos.arpa.$LANG1"

####Binarize LM-------------------------------------------------------------------------------------

#"$HOME/moses/bin/build_binary" "$LM/lm.$LANG2-$LANG1.arpa.$LANG1" "$LM/lm.$LANG2-$LANG1.blm.$LANG1"

###################


# ##Translation Model-------------------------------------------------------------------------------------------

cd $WORKING

# "$MOSSES_TRN" -root-dir "$WORKING/train/model" \
#     --corpus "$CORPUS/train.clean_tagged" \
#     --f $LANG2 --e $LANG1 \
#     --lm 0:3:"$LM/lm.$LANG2-$LANG1.arpa."$LANG1 \
#     --lm 2:3:"$LM/pos.arpa."$LANG1 \
#     --translation-factors 0-0,1 \
#     --external-bin-dir "$HOME/moses/tools"

# -alignment grow-diag-final-and -reordering msd-bidirectional-fe -lm 0:3:"$LM/lm.$LANG2-$LANG1.arpa."$LANG1:0 



# ####Tune------------------------------------------------------------------------------------------------------------

"$MOSSES_MERT" "$CORPUS/tune.true_tagged.$LANG2" "$CORPUS/tune.true_tagged.$LANG1" "$HOME/moses/bin/moses" "$WORKING/train/model/model/moses.ini" --mertdir "$HOME/moses/bin/" --decoder-flags "-threads 4"


# ####Binaries----------------------------------------------------------------------------------------------------

# mkdir "$WORKING/binarised-model"

# cd $WORKING

# "$HOME/moses/bin/processPhraseTableMin" -in "$WORKING/train/model/model/phrase-table.gz" -nscores 4 -out "$WORKING/binarised-model/phrase-table"

# "$HOME/moses/bin/processLexicalTableMin" -in "$WORKING/train/model/model/reordering-table.wbe-msd-bidirectional-fe.gz" -out "$WORKING/binarised-model/reordering-table"

# # step final

# cp "$WORKING/mert-work/moses.ini" "$WORKING/binarised-model"

# sed -i -e "s/PhraseDictionaryMemory/PhraseDictionaryCompact/g" "$WORKING/binarised-model/moses.ini"
# sed -i  -e "s#path=$WORKING/train/model/model/phrase-table.gz#path=$WORKING/binarised-model/phrase-table.minphr#g" "$WORKING/binarised-model/moses.ini"
# sed -i  -e "s#path=$WORKING/train/model/model/reordering-table.wbe-msd-bidirectional-fe.gz#path=$WORKING/binarised-model/reordering-table#g" "$WORKING/binarised-model/moses.ini"



# ####test with file-------------------------------------------------------------------------------------------

# "$HOME/moses/scripts/training/filter-model-given-input.pl" "$WORKING/filtered-test."$LANG2 "$WORKING/mert-work/moses.ini" "$CORPUS/test.true."$LANG2 -Binarizer "$HOME/moses/bin/processPhraseTableMin"

# ###bleu----------------------------------------------------------------------------------------------------------

# "$HOME/moses/bin/moses" -f "$WORKING/filtered-test."$LANG2"/moses.ini" < "$CORPUS/test.true."$LANG2 > "$CORPUS/test.translated."$LANG1

# ##run blue script------------------------------------------------------------------------------------------------
# "$HOME/moses/scripts/generic/multi-bleu.perl" -lc "$CORPUS/test.true."$LANG1 < "$CORPUS/test.translated."$LANG1 > "$CORPUS/BLUElog."$LANG2"_"$LANG1

# #continue to bidirectional
# echo "writting BLUE for MT_TEST_DIR-$LANG2-$LANG1 Done!! "
# echo "================================================================================"
# echo "Starting MT_TEST_DIR-$LANG1-$LANG2"
# cd "$HOME/Desktop/data/scripts/"

# ./srilim_based_MT_TEST_DIR_bi.sh

# echo "writting BLUE for MT_TEST_DIR-$LANG1-$LANG2 Done!! "
# echo "Success !!! Two MT_TEST_DIReriment done"
