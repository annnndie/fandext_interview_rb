# README

* Ruby version: 3.1.2

- procedue 主要作用為處理流程和程式邏輯，有助於controller 程式碼的整理，users_controller#create 及相關部份

- [x] 說明 user#create 流程裡面做了什麼事 ？成功會得到什麼結果？失敗會得到什麼結果？
user#create 進行了建立 user 的流程，並且將流程及邏輯包在 CreateUserProcedure 內。
CreateUserProcedure: 
  1. 透過 verify_email_domain 驗證 domain 是否合法，不合法即 assign Error message 及 raise Error。
  2. 透過 save_user_with_email 建立 user 帳號，如果成功就回傳 user 物件；失敗就回傳 false，並且 assign Error message 及 raise Error。
  3. 透過 send_welcome_mail 寄送歡迎信給註冊成功的 user
  4. 透過 login_user 登入帳號

結束 CreateUserProcedure 回到 user#create，並確認整個流程中有沒有失敗：
  1. 成功：redirect 回 users index page 及 flash 回傳 success 訊息
  2. 失敗：render :new template 及 flash 回傳 warning 訊息

- [x] 利用 Action Mailer 完成 procedue 裡面 `send_welcome_mail`，寄一封信給 user

- test/controllers/users_controller_test.rb
  - [x] 完成一個 create user succeeded 的測試
  - [x] 完成一個 create user failed 的測試

