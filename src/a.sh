#!/bin/bash
set -Ceu
#-----------------------------------------------------------------------------
# Bashの配列。
# 作成日時: 2019-04-06T18:05:58+0900
#-----------------------------------------------------------------------------
Run() {
	Reference
	DestructiveOperation
}
Reference() {
	#ARRAY=(A B C)
	local -r ARRAY=(A B C)
	#declare -r ARRAY=(A B C)

	#for item in ${ARRAY[@]}; do echo "$item"; done;
	echo "Count: ${#ARRAY[@]}"
	echo "Items: ${ARRAY[@]}"
	for ((i=0; i<${#ARRAY[@]}; i++)); do echo "${ARRAY[$i]}"; done;
}
DestructiveOperation() {
	local ARRAY=(A B C D E)
	echo "Items: ${ARRAY[@]}"

	# 指定位置の要素を削除する
	unset ARRAY[2]
	echo "Items: ${ARRAY[@]}"
	# 先頭の要素を削除する
	ARRAY=("${ARRAY[@]:1}")
	echo "Items: ${ARRAY[@]}"
	# 末尾の要素を削除する
	declare -i num=${#ARRAY[@]}-1
	ARRAY=("${ARRAY[@]:0:$num}")
	echo "Items: ${ARRAY[@]}"
	
	# 先頭に追加
	ARRAY=(9 "${ARRAY[@]}")
	echo "Items: ${ARRAY[@]}"
	# 末尾に追加
	ARRAY=("${ARRAY[@]}" Y) 
	echo "Items: ${ARRAY[@]}"
	ARRAY+=( Z )  
	echo "Items: ${ARRAY[@]}"

	# 指定位置に代入
	ARRAY[0]=7
	echo "Items: ${ARRAY[@]}"

	# 全削除
	unset ARRAY
	echo "Items: ${ARRAY[@]}"
}
Run
