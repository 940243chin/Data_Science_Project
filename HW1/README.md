[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/_9P3RhIz)
# hw1. Familiar with R basics & submit homework on GitHub

#### Name: 辛柏慶
#### ID: 114753220

## Description
* **自動讀取與處理**：支援相對路徑讀取 CSV 檔案。
* **檔名自動擷取**：自動解析輸入路徑，擷取檔案名稱作為輸出內容。
* **數值計算**：
  * 找出 `weight` 欄位的最大值。
  * 找出 `height` 欄位的最大值。
  * 自動過濾缺失值 (`NA`) 確保程式不中斷。
* **四捨五入**：所有數值均處理至小數點後兩位。
* **標準化輸出**：產出的 CSV 格式符合 Gradescope 自動評分系統要求（不含列編號）。

### Code for reference
```R
summary <- function(input_path, output_path){
  # 1. 讀取資料
  # 使用 read.csv 讀取輸入路徑的資料
  data <- read.csv(input_path)
  
  # 2. 取得輸入檔案的名稱
  #gsub(要被換掉的目標, 換成什麼, 原始資料)，中間的""什麼都沒打代表刪除
  #basename(input_path): 這個函數可以幫你把 C:/Users/Desktop/input1.csv 縮短成 input1.csv。這在處理不固定路徑時非常有用。
  file_name <- gsub(".csv","",basename(input_path))
  
  # 3. 計算最大值並四捨五入到小數點後兩位
  #data:物件名稱前面把整個csv檔存入data變數，＄用來進入或指向某個物件，用它來從資料框（data frame）中抽出特定的**「一整欄」，weight代表我要存取的具體欄位標籤
  #data$weight具體意思請到 data 這個資料表裡面，把名為 weight 的那一欄資料全部拿出來。
  #na,rm是NA remove的縮寫，TRUE代表請做移除動作，na.rm 移除沒有填的數值，如我input中有資料沒填如果沒用na.rm那輸出就會是NA，用於跳過缺失值，繼續分析
  max_weight <- round(max(data$weight, na.rm = TRUE), 2)
  max_height <- round(max(data$height, na.rm = TRUE), 2)
  
  
  # 4. 建立輸出的資料框 (Data Frame)
  # 欄位名稱必須完全符合範例：set, weight, height
  result <- data.frame(
    set = file_name,
    weight = max_weight,
    height = max_height
  )
  
  # 5. 寫出 CSV 檔案
  #write再R中用來存檔，result要存的物件，output_path:代表檔案要存到哪裡跟叫什麼名字，row.name:把預設的列標號刪掉
  write.csv(result, output_path, row.names = FALSE)
  
}

# 本地測試用
#summary("input1.csv", "output1.csv")
#summary("input2.csv", "output2.csv")
#summary("input3.csv", "output3.csv")
```

### cmd
```R
summary("input1.csv", "output1.csv")
```

### Read an input file

The input data will include other numeric & category columns besides weight and height.

#### examples: `input1.csv`
| persons | weight | height | gender |
| --- | --- | --- | --- |
| person1 | 92.24459 | 182.0007 | F |
| person2 | 79.88506 | 199.0311 | F |
| person3 | 65.59031 | 180.8477 | F |
| … | … | … | … |
| person25 | 80.16016 | 196.6961 | M |
| person26 | 87.0112 | 174.8087 | F |

### Output a summary file

Please follow the same format as the output1.csv, i.e., round the number to two digits.

#### examples: `output1.csv`
| set | weight | height |
| --- | --- | --- |
| input1 | 99.76 | 199.03 |


## Reference
Gemini, https://gemini.google.com/share/ae7d1494be46 , on March 13, 2026.
