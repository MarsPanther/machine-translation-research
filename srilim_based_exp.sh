#!/bin/sh

LANG1="en"
LANG2="am"

EXP_DIR="EXP-$LANG2-$LANG1-START"

# mkdir $HOME/$EXP_DIR
# mkdir $HOME/$EXP_DIR/corpus
# mkdir $HOME/$EXP_DIR/working
# mkdir $HOME/$EXP_DIR/lm
# mkdir $HOME/$EXP_DIR/pre_process

SRC="$HOME/Desktop/data/$LANG1"_"$LANG2/"
SELECTOR_SCRIPS="$HOME/Desktop/data/scripts/selector_test_tune.py"
COMBINE_FILES="$HOME/Desktop/data/scripts/combine.py"
MOSSES_TOKEN="$HOME/mosesdecoder/scripts/tokenizer/tokenizer.perl"
MOSSES_TRUE_CASE_MOD="$HOME/mosesdecoder/scripts/recaser/train-truecaser.perl"
MOSSES_TRUE_CASE_BULD="$HOME/mosesdecoder/scripts/recaser/truecase.perl"
MOSSES_CLEAN="$HOME/mosesdecoder/scripts/training/clean-corpus-n.perl"
MOSSES_TRN="$HOME/mosesdecoder/scripts/training/train-model.perl"
MOSSES_MERT="$HOME/mosesdecoder/scripts/training/mert-moses.pl"
CORPUS="$HOME/$EXP_DIR/corpus"
DST="$HOME/$EXP_DIR/pre_process"
SPACE_NORM="$HOME/Desktop/data/scripts/amh_space_normalizor.py"
CHAR_NORM="$HOME/Desktop/data/scripts/amh_char_normalizor_v2.py"
LM="$HOME/$EXP_DIR/lm"
WORKING="$HOME/$EXP_DIR/working"


# cp "$SRC$LANG1.txt"  "$DST/"
# cp "$SRC$LANG2.txt"  "$DST/"

# cd $DST 
# python3  "$SELECTOR_SCRIPS" $LANG1 $LANG2


# "$MOSSES_TOKEN"  -l en < "$DST/train.$LANG1" > "$DST/train.$LANG1.tok.$LANG1"
# "$MOSSES_TRUE_CASE_MOD"  --model "$DST/truecase-model.$LANG1" --corpus "$DST/train.$LANG1.tok.$LANG1"
# "$MOSSES_TRUE_CASE_BULD"  --model "$DST/truecase-model.$LANG1" < "$DST/train.$LANG1.tok.$LANG1" > "$DST/train.true.$LANG1"


# "$MOSSES_TOKEN" -l en < "$DST/tune.$LANG1" > "$DST/tune.$LANG1.tok.$LANG1"
# "$MOSSES_TRUE_CASE_MOD"  --model "$DST/truecase-model2.$LANG1" --corpus "$DST/tune.$LANG1.tok.$LANG1"
# "$MOSSES_TRUE_CASE_BULD"  --model "$DST/truecase-model2.$LANG1" < "$DST/tune.$LANG1.tok.$LANG1" > "$DST/tune.true.$LANG1"


# "$MOSSES_TOKEN" -l en < "$DST/test.$LANG1" > "$DST/test.$LANG1.tok.$LANG1"
# "$MOSSES_TRUE_CASE_MOD"  --model "$DST/truecase-model3.$LANG1" --corpus "$DST/test.$LANG1.tok.$LANG1"
# "$MOSSES_TRUE_CASE_BULD"  --model "$DST/truecase-model3.$LANG1" < "$DST/test.$LANG1.tok.$LANG1" > "$DST/test.true.$LANG1"

# #Return to 
# cd "$HOME/Desktop/data/scripts/"

# if [ $LANG2="am" ]
# 	then
# 		python2 "$SPACE_NORM" "$DST/train."$LANG2
# 		python2 "$SPACE_NORM" "$DST/tune."$LANG2
# 		python2 "$SPACE_NORM" "$DST/test."$LANG2

# 		python2 "$CHAR_NORM" "$DST/train."$LANG2
# 		python2 "$CHAR_NORM" "$DST/tune."$LANG2
# 		python2 "$CHAR_NORM" "$DST/test."$LANG2

# 		mv "$DST/train.$LANG2" "$DST/train.true."$LANG2 
# 		mv "$DST/tune.$LANG2" "$DST/tune.true."$LANG2 
# 		mv "$DST/test.$LANG2" "$DST/test.true."$LANG2 

# elif [ $LANG2="tg" ]
# 	then
# 		python2 "$SPACE_NORM" "$DST/train."$LANG2
# 		python2 "$SPACE_NORM" "$DST/tune."$LANG2
# 		python2 "$SPACE_NORM" "$DST/test."$LANG2

# 		python2 "$CHAR_NORM" "$DST/train."$LANG2
# 		python2 "$CHAR_NORM" "$DST/tune."$LANG2
# 		python2 "$CHAR_NORM" "$DST/test."$LANG2

# 		mv "$DST/train.$LANG2" "$DST/train.true."$LANG2 
# 		mv "$DST/tune.$LANG2" "$DST/tune.true."$LANG2 
# 		mv "$DST/test.$LANG2" "$DST/test.true."$LANG2 
# elif [ $LANG2="ge" ]
# 	then
# 		python2 "$SPACE_NORM" "$DST/train."$LANG2
# 		python2 "$SPACE_NORM" "$DST/tune."$LANG2
# 		python2 "$SPACE_NORM" "$DST/test."$LANG2

# 		python2 "$CHAR_NORM" "$DST/train."$LANG2
# 		python2 "$CHAR_NORM" "$DST/tune."$LANG2
# 		python2 "$CHAR_NORM" "$DST/test."$LANG2

# 		mv "$DST/train.$LANG2" "$DST/train.true."$LANG2 
# 		mv "$DST/tune.$LANG2" "$DST/tune.true."$LANG2 
# 		mv "$DST/test.$LANG2" "$DST/test.true."$LANG2 
# else
# 	"$MOSSES_TOKEN"  -l en < "$DST/train.$LANG2" > "$DST/train.$LANG2.tok.$LANG2"
# 	"$MOSSES_TRUE_CASE_MOD"  --model "$DST/truecase-model4.$LANG2" --corpus "$DST/train.$LANG2.tok.$LANG2"
# 	"$MOSSES_TRUE_CASE_BULD"  --model "$DST/truecase-model4.$LANG2" < "$DST/train.$LANG2.tok.$LANG2" > "$DST/train.true.$LANG2"


# 	"$MOSSES_TOKEN" -l en < "$DST/tune.$LANG2" > "$DST/tune.$LANG2.tok.$LANG2"
# 	"$MOSSES_TRUE_CASE_MOD"  --model "$DST/truecase-model5.$LANG2" --corpus "$DST/tune.$LANG2.tok.$LANG2"
# 	"$MOSSES_TRUE_CASE_BULD"  --model "$DST/truecase-model5.$LANG2" < "$DST/tune.$LANG2.tok.$LANG2" > "$DST/tune.true.$LANG2"

# 	"$MOSSES_TOKEN" -l en < "$DST/test.$LANG2" > "$DST/test.$LANG2.tok.$LANG2"
# 	"$MOSSES_TRUE_CASE_MOD"  --model "$DST/truecase-model6.$LANG2" --corpus "$DST/test.$LANG2.tok.$LANG2"
# 	"$MOSSES_TRUE_CASE_BULD"  --model "$DST/truecase-model6.$LANG2" < "$DST/test.$LANG2.tok.$LANG2" > "$DST/test.true.$LANG2"
	
# fi

# "$MOSSES_CLEAN" "$DST/train.true" $LANG2 $LANG1 "$DST/train.clean" 1 80

# cp "$DST/train.clean."$LANG1 "$DST/train.clean."$LANG2 "$CORPUS"
# cp "$DST/tune.true."$LANG1 "$DST/tune.true."$LANG2 "$CORPUS"
# cp "$DST/test.true."$LANG1 "$DST/test.true."$LANG2 "$CORPUS"

# #language model creation
# cd $LM

# python2 "$COMBINE_FILES" "$DST/train.true."$LANG1  "$DST/tune.true."$LANG1 "$LM/combined_lm.$LANG1"
# python2 "$COMBINE_FILES" "$DST/train.true."$LANG2  "$DST/tune.true."$LANG2 "$LM/combined_lm.$LANG2"


# #add start and end of sent using IRSTLM

# #"$HOME/mosesdecoder/tools/irstlm-5.80.08/trunk/bin/add-start-end.sh" < "$LM/combined."$LANG1 >  "$LM/combined_lm."$LANG1 

# #Using SRILM to compute ngram lang model

# "$HOME/mosesdecoder/tools/srilm-1.7.2/bin/i686-m64/ngram-count" -text "$LM/combined_lm."$LANG1 -order 3 -lm "$LM/lm.$LANG2-$LANG1.arpa.$LANG1" -kndiscount1 -kndiscount2 -kndiscount3 -interpolate2 -interpolate3 -gt3min 1 -gt2min 1

# ####Binarize LM-------------------------------------------------------------------------------------

# #"$HOME/mosesdecoder/bin/build_binary" "$LM/lm.$LANG2-$LANG1.arpa.$LANG1" "$LM/lm.$LANG2-$LANG1.blm.$LANG1"

# ###################


##Translation Model-------------------------------------------------------------------------------------------

cd $WORKING

# "$MOSSES_TRN" \
# -root-dir "$WORKING/train/model" \
# -corpus "$CORPUS/train.clean" \
# -f $LANG2 -e $LANG1 \
# -lm 0:3:"$LM/lm.$LANG2-$LANG1.arpa.$LANG1" \
# -external-bin-dir "$HOME/mosesdecoder/tools"



# ####Tune------------------------------------------------------------------------------------------------------------

# "$MOSSES_MERT" "$CORPUS/tune.true.$LANG2" "$CORPUS/tune.true.$LANG1" \
# "$HOME/mosesdecoder/bin/moses" \
# "$WORKING/train/model/model/moses.ini" \
# --mertdir "$HOME/mosesdecoder/bin/" \
# --decoder-flags "-threads 4"


# ####Binaries----------------------------------------------------------------------------------------------------

# mkdir "$WORKING/binarised-model"

cd $WORKING

# "$HOME/mosesdecoder/bin/processPhraseTableMin" -in "$WORKING/train/model/model/phrase-table.gz" -nscores 4 -out "$WORKING/binarised-model/phrase-table"

# # # step final

# cp "$WORKING/mert-work/moses.ini" "$WORKING/binarised-model"

# sed -i -e "s/PhraseDictionaryMemory/PhraseDictionaryCompact/g" "$WORKING/binarised-model/moses.ini"
# sed -i  -e "s#path=$WORKING/train/model/model/phrase-table.gz#path=$WORKING/binarised-model/phrase-table.minphr#g" "$WORKING/binarised-model/moses.ini"
# sed -i  -e "s#path=$WORKING/train/model/model/reordering-table.wbe-msd-bidirectional-fe.gz#path=$WORKING/binarised-model/reordering-table#g" "$WORKING/binarised-model/moses.ini"



####test with file-------------------------------------------------------------------------------------------

# "$HOME/mosesdecoder/scripts/training/filter-model-given-input.pl" "$WORKING/filtered-test."$LANG2 "$WORKING/mert-work/moses.ini" "$CORPUS/test.true."$LANG2 -Binarizer "$HOME/mosesdecoder/bin/processPhraseTableMin"

# ###bleu----------------------------------------------------------------------------------------------------------

# "$HOME/mosesdecoder/bin/moses" -f "$WORKING/filtered-test."$LANG2"/moses.ini" < "$CORPUS/test.true."$LANG2 > "$CORPUS/test.translated."$LANG1

# ##run blue script------------------------------------------------------------------------------------------------
# "$HOME/mosesdecoder/scripts/generic/multi-bleu.perl" -lc "$CORPUS/test.true."$LANG1 < "$CORPUS/test.translated."$LANG1 > "$CORPUS/BLUElog."$LANG2"_"$LANG1

#continue to bidirectional
echo "writting BLUE for EXP-$LANG2-$LANG1 Done!! "
echo "================================================================================"
echo "Starting EXP-$LANG1-$LANG2"
cd "$HOME/Desktop/data/scripts/"

./srilim_based_exp_bi.sh

echo "writting BLUE for EXP-$LANG1-$LANG2 Done!! "
echo "Success !!! Two Experiment done"
