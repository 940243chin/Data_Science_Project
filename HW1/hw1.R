# ChatGPT, respond to “summary 函式裡面如何抓取「檔名」或「最大值」的範例代碼”, on March 14, 2026.
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
#summary("input3.csv", "output3_test.csv")

