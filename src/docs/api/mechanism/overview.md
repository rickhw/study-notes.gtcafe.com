

1. Async Commuication
1. API Token
1. Standard Message
    - Normal Message
    - Error Message
1. Idemponent
1. Pagnation
1. Filter
1. Large File Transfer
1. API Key and Token
1. Bulk and Batch: https://tyk.io/blog/api-design-guidance-bulk-and-batch-import/



---
# Bulk & Batch

```json

POST /api/resources

[
    { "name": 1 },
    { "name": 2 },
    { "name": 3 },
]
```

response

```json
HTTP/1.1 207 Multi-Status
Content-Type: application/json

[
    { "id": "12", "status": 201, errors: [] },
    { "id": "13", "status": 201, errors: [] },
    { "id": "14", "status": 201, errors: [] },
    { "id": "15", "status": 400, errors: [ ... ] }
]
```

---
# Batch

POST /api/resources

[
    { "data": 1 },
    { "data": 2 },
    { "data": 3 },
]


HTTP/1.1 202 Accepted
Content-Type: application/json
State-Location: /

{
    "taskId": 123,
    "state": "creating"
}


---
設計有兩種同步和非同步：Bulk、Batch


## Bulk

是同步設計，也就是一次請求，包含多個資源的資料在 Payload，然後完成處理完之後回傳結果。回傳結果設計分成全部成功 (Success or Fail)、部分成功 (Partial Success) 兩種設計。

部分成功會使用 `HTTP/1.1 207 Multi-Status`, 然後描述每個資源的處理狀態, 範例如下：

```json
HTTP/1.1 207 Multi-Status
Content-Type: application/json

[
    { "id": "12", "status": 201, errors: [] },
    { "id": "13", "status": 201, errors: [] },
    { "id": "14", "status": 201, errors: [] },
    { "id": "15", "status": 400, errors: [ ... ] }
]
```

放在 payload，適合有限制的筆數 和 payload 不大的請求 ；


## Batch

另一種是非同步設計，也就是 Batch mode, 適合單一資料比較大的，像是檔案。

Batch mode 常見的應用像是一些網站可以 drop mulitple files ，這種就會用 batch mode 設計。
多資源 RESTful API 設計的點，在於後面處理過程狀態的確立。

依照資源屬性，要規劃是否需要 rollback 之類的。

另外執行面，後者 (Async) 常常會需要額外的 workflow 處理，因為通常他們處理的時間長短不一 ... 所以狀態處理也會複雜點。
我現在工作專門在弄 API design, architecture, management 三個區塊～ 
 bulk and batch API 的設計我找時間來整理一下, 放在 blog 給你參考~