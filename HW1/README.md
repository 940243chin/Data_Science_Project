# Data Science Homework 1: R Basics & Function Implementation

## 專案描述 (Project Description)
這是一個 R 語言的入門作業。主要任務是撰寫一個名為 `summary` 的函式，該函式能夠讀取指定的 CSV 原始資料，計算其中「體重 (weight)」與「身高 (height)」的最大值，並將結果格式化後輸出至新的 CSV 檔案。

## 功能說明 (Features)
* **自動讀取與處理**：支援相對路徑讀取 CSV 檔案。
* **檔名自動擷取**：自動解析輸入路徑，擷取檔案名稱作為輸出內容。
* **數值計算**：
  * 找出 `weight` 欄位的最大值。
  * 找出 `height` 欄位的最大值。
  * 自動過濾缺失值 (`NA`) 確保程式不中斷。
* **四捨五入**：所有數值均處理至小數點後兩位。
* **標準化輸出**：產出的 CSV 格式符合 Gradescope 自動評分系統要求（不含列編號）。

## 程式碼結構 (Code Logic)
程式碼主要分為五個步驟：
1. **讀取資料**：使用 `read.csv()` 載入數據。
2. **字串處理**：利用 `basename()` 與 `gsub()` 提取乾淨的檔案名稱（去除路徑與副檔名）。
3. **統計運算**：使用 `max(..., na.rm = TRUE)` 取得最大值，並配合 `round()` 進行格式化。
4. **資料框封裝**：將處理好的數據包裝進 `data.frame`，確保欄位標籤為 `set`, `weight`, `height`。
5. **檔案寫出**：使用 `write.csv(..., row.names = FALSE)` 儲存結果。

## 如何執行 (How to Run)
在 R 環境中載入 `hw1.R` 後，呼叫以下函式：

```R
summary("path/to/input.csv", "path/to/output.csv")