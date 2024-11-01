# Q1: ℹ️ We have deployed a POD hosting an application. Inspect it. Wait for it to start.
```bash
kubectl get pods
```
| NAME      | READY | STATUS  | RESTARTS | AGE |
|-----------|-------|---------|----------|-----|
| webapp-1  | 1/1   | Running | 0        | 74s |

## A1: OK

<br>

# Q2: A user - `USER5` - has expressed concerns accessing the application. Identify the cause of the issue.
Inspect the logs of the POD
```bash
kubectl get pods
```
| NAME      | READY | STATUS  | RESTARTS | AGE |
|-----------|-------|---------|----------|-----|
| webapp-1  | 1/1   | Running | 0        | 74s |
```bash
kubectl logs webapp-1
```
```
[2024-10-29 00:23:14,019] INFO in event-simulator: USER4 logged out
[2024-10-29 00:23:15,019] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:23:16,021] INFO in event-simulator: USER2 logged out
[2024-10-29 00:23:17,022] INFO in event-simulator: USER4 is viewing page2
[2024-10-29 00:23:18,023] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:23:19,025] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:23:19,025] INFO in event-simulator: USER3 logged out
[2024-10-29 00:23:20,026] INFO in event-simulator: USER1 logged in
[2024-10-29 00:23:21,027] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:23:22,029] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:23:22,029] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:23:23,030] INFO in event-simulator: USER4 is viewing page2
[2024-10-29 00:23:24,031] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:23:24,031] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:23:25,033] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:23:26,034] INFO in event-simulator: USER2 logged in
[2024-10-29 00:23:27,035] INFO in event-simulator: USER1 logged out
[2024-10-29 00:23:28,035] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:23:29,036] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:23:29,036] INFO in event-simulator: USER1 logged out
[2024-10-29 00:23:30,037] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:23:30,038] INFO in event-simulator: USER2 is viewing page1
[2024-10-29 00:23:31,039] INFO in event-simulator: USER4 logged out
[2024-10-29 00:23:32,040] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:23:33,041] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:23:34,042] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:23:34,042] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:23:35,043] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:23:36,044] INFO in event-simulator: USER4 logged in
[2024-10-29 00:23:37,045] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:23:38,047] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:23:38,047] INFO in event-simulator: USER4 logged in
[2024-10-29 00:23:39,048] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:23:39,048] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:23:40,049] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:23:41,051] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:23:42,051] INFO in event-simulator: USER3 logged in
[2024-10-29 00:23:43,052] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:23:44,053] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:23:44,053] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:23:45,055] INFO in event-simulator: USER2 logged out
[2024-10-29 00:23:46,055] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:23:46,056] INFO in event-simulator: USER3 logged out
[2024-10-29 00:23:47,056] INFO in event-simulator: USER3 logged in
[2024-10-29 00:23:48,058] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:23:49,059] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:23:49,059] INFO in event-simulator: USER1 logged out
[2024-10-29 00:23:50,060] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:23:51,061] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:23:52,063] INFO in event-simulator: USER3 logged out
[2024-10-29 00:23:53,063] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:23:54,065] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:23:54,065] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:23:54,065] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:23:55,066] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:23:56,067] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:23:57,067] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:23:58,069] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:23:59,070] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:23:59,070] INFO in event-simulator: USER2 logged out
[2024-10-29 00:24:00,071] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:24:01,073] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:24:02,073] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:24:02,073] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:24:03,074] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:24:04,075] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:24:04,076] INFO in event-simulator: USER1 logged in
[2024-10-29 00:24:05,077] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:24:06,077] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:24:07,078] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:24:08,079] INFO in event-simulator: USER1 logged in
[2024-10-29 00:24:09,081] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:24:09,081] INFO in event-simulator: USER3 is viewing page3
[2024-10-29 00:24:10,082] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:24:10,083] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:24:11,084] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:24:12,084] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:24:13,085] INFO in event-simulator: USER3 logged in
[2024-10-29 00:24:14,086] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:24:14,087] INFO in event-simulator: USER4 logged in
[2024-10-29 00:24:15,087] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:24:16,088] INFO in event-simulator: USER2 logged in
[2024-10-29 00:24:17,089] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:24:18,090] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:24:18,091] INFO in event-simulator: USER3 logged out
[2024-10-29 00:24:19,092] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:24:19,092] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:24:20,093] INFO in event-simulator: USER1 logged in
[2024-10-29 00:24:21,094] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:24:22,095] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:24:23,096] INFO in event-simulator: USER2 is viewing page1
[2024-10-29 00:24:24,097] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:24:24,098] INFO in event-simulator: USER2 is viewing page1
[2024-10-29 00:24:25,098] INFO in event-simulator: USER3 is viewing page3
[2024-10-29 00:24:26,099] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:24:26,099] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:24:27,099] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:24:28,101] INFO in event-simulator: USER2 logged out
[2024-10-29 00:24:29,102] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:24:29,102] INFO in event-simulator: USER1 logged out
[2024-10-29 00:24:30,103] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:24:31,105] INFO in event-simulator: USER1 logged out
[2024-10-29 00:24:32,106] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:24:33,107] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:24:34,108] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:24:34,109] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:24:34,109] INFO in event-simulator: USER3 is viewing page3
[2024-10-29 00:24:35,109] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:24:36,110] INFO in event-simulator: USER2 is viewing page1
[2024-10-29 00:24:37,111] INFO in event-simulator: USER2 is viewing page2
[2024-10-29 00:24:38,112] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:24:39,114] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:24:39,114] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:24:40,115] INFO in event-simulator: USER2 logged in
[2024-10-29 00:24:41,116] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:24:42,116] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:24:42,116] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:24:43,118] INFO in event-simulator: USER4 is viewing page2
[2024-10-29 00:24:44,118] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:24:44,119] INFO in event-simulator: USER2 logged out
[2024-10-29 00:24:45,119] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:24:46,121] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:24:47,121] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:24:48,123] INFO in event-simulator: USER4 logged out
[2024-10-29 00:24:49,124] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:24:49,124] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:24:50,125] WARNING in event-simulator: USER7 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:24:50,125] INFO in event-simulator: USER2 logged in
[2024-10-29 00:24:51,127] INFO in event-simulator: USER1 logged in
```
## A2: Account Locked due to Many Failed Attempts

<br>

# Q3: ℹ️ We have deployed a new POD - webapp-2 - hosting an application. Inspect it. Wait for it to start.
```bash
kubectl get pods
```
| NAME      | READY | STATUS  | RESTARTS | AGE |
|-----------|-------|---------|----------|-----|
| webapp-1  | 1/1   | Running | 0        | 74s |
| webapp-2  | 1/1   | Running | 0        | 46s |
## A3: OK

<br>

# Q4: A user is reporting issues while trying to purchase an item. Identify the user and the cause of the issue.
Inspect the logs of the webapp in the POD
```bash
kubectl logs webapp-2 -c simple-webapp
```
```
[2024-10-29 00:25:50,838] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:25:51,839] INFO in event-simulator: USER2 is viewing page1
[2024-10-29 00:25:52,841] INFO in event-simulator: USER2 is viewing page2
[2024-10-29 00:25:53,842] INFO in event-simulator: USER2 logged in
[2024-10-29 00:25:54,843] INFO in event-simulator: USER2 logged in
[2024-10-29 00:25:55,844] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:25:55,844] INFO in event-simulator: USER4 logged in
[2024-10-29 00:25:56,845] INFO in event-simulator: USER2 logged out
[2024-10-29 00:25:57,847] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:25:58,848] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:25:58,848] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:25:59,849] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:26:00,851] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:26:00,851] INFO in event-simulator: USER3 logged out
[2024-10-29 00:26:01,851] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:26:02,852] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:26:03,854] INFO in event-simulator: USER2 logged out
[2024-10-29 00:26:04,855] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:26:05,856] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:26:05,856] INFO in event-simulator: USER1 logged out
[2024-10-29 00:26:06,857] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:26:06,857] INFO in event-simulator: USER1 logged in
[2024-10-29 00:26:07,858] INFO in event-simulator: USER3 is viewing page3
[2024-10-29 00:26:08,859] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:26:09,859] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:26:10,861] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:26:10,861] INFO in event-simulator: USER2 logged in
[2024-10-29 00:26:11,862] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:26:12,863] INFO in event-simulator: USER4 logged in
[2024-10-29 00:26:13,865] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:26:14,865] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:26:14,866] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:26:15,866] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:26:15,866] INFO in event-simulator: USER2 logged out
[2024-10-29 00:26:16,867] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:26:17,869] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:26:18,869] INFO in event-simulator: USER2 is viewing page1
[2024-10-29 00:26:19,871] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:26:20,871] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:26:20,872] INFO in event-simulator: USER1 logged in
[2024-10-29 00:26:21,873] INFO in event-simulator: USER3 logged out
[2024-10-29 00:26:22,874] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:26:22,874] INFO in event-simulator: USER3 logged in
[2024-10-29 00:26:23,876] INFO in event-simulator: USER1 logged in
[2024-10-29 00:26:24,877] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:26:25,877] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:26:25,877] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:26:26,879] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:26:27,880] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:26:28,881] INFO in event-simulator: USER2 is viewing page2
[2024-10-29 00:26:29,883] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:26:30,883] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:26:30,884] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:26:30,884] INFO in event-simulator: USER1 logged out
[2024-10-29 00:26:31,885] INFO in event-simulator: USER3 is viewing page3
[2024-10-29 00:26:32,886] INFO in event-simulator: USER3 logged in
[2024-10-29 00:26:33,888] INFO in event-simulator: USER4 logged in
[2024-10-29 00:26:34,889] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:26:35,890] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:26:35,890] INFO in event-simulator: USER3 is viewing page3
[2024-10-29 00:26:36,891] INFO in event-simulator: USER2 logged in
[2024-10-29 00:26:37,893] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:26:38,894] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:26:38,894] INFO in event-simulator: USER1 logged out
[2024-10-29 00:26:39,895] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:26:40,897] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:26:40,897] INFO in event-simulator: USER4 is viewing page2
[2024-10-29 00:26:41,898] INFO in event-simulator: USER2 is viewing page1
[2024-10-29 00:26:42,899] INFO in event-simulator: USER1 logged out
[2024-10-29 00:26:43,899] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:26:44,901] INFO in event-simulator: USER4 logged in
[2024-10-29 00:26:45,902] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:26:45,902] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:26:46,903] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:26:46,903] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:26:47,903] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:26:48,905] INFO in event-simulator: USER4 logged in
[2024-10-29 00:26:49,906] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:26:50,907] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:26:50,907] INFO in event-simulator: USER3 is viewing page3
[2024-10-29 00:26:51,909] INFO in event-simulator: USER1 logged in
[2024-10-29 00:26:52,909] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:26:53,911] INFO in event-simulator: USER4 is viewing page2
[2024-10-29 00:26:54,912] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:26:54,912] INFO in event-simulator: USER4 logged in
[2024-10-29 00:26:55,913] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:26:55,913] INFO in event-simulator: USER3 logged out
[2024-10-29 00:26:56,914] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:26:57,915] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:26:58,916] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:26:59,917] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:27:00,918] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:27:00,918] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:27:01,919] INFO in event-simulator: USER1 logged in
[2024-10-29 00:27:02,921] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:27:02,921] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:27:03,922] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:27:04,923] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:27:05,925] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:27:05,925] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:27:06,926] INFO in event-simulator: USER3 logged in
[2024-10-29 00:27:07,927] INFO in event-simulator: USER2 is viewing page1
[2024-10-29 00:27:08,929] INFO in event-simulator: USER4 is viewing page2
[2024-10-29 00:27:09,930] INFO in event-simulator: USER2 logged out
[2024-10-29 00:27:10,931] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:27:10,931] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:27:10,932] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:27:11,933] INFO in event-simulator: USER3 is viewing page3
[2024-10-29 00:27:12,934] INFO in event-simulator: USER4 is viewing page2
[2024-10-29 00:27:13,935] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:27:14,935] INFO in event-simulator: USER4 logged in
[2024-10-29 00:27:15,936] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:27:15,936] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:27:16,937] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:27:17,939] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:27:18,939] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:27:18,940] INFO in event-simulator: USER4 logged in
[2024-10-29 00:27:19,941] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:27:20,942] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:27:20,942] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:27:21,943] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:27:22,944] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:27:23,945] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:27:24,947] INFO in event-simulator: USER3 logged out
[2024-10-29 00:27:25,948] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:27:25,948] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:27:26,949] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:27:26,949] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:27:27,951] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:27:28,952] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:27:29,953] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:27:30,954] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:27:30,955] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:27:31,956] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:27:32,957] INFO in event-simulator: USER4 logged out
[2024-10-29 00:27:33,958] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:27:34,959] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:27:34,959] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:27:35,961] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:27:35,961] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:27:36,962] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:27:37,963] INFO in event-simulator: USER1 logged in
[2024-10-29 00:27:38,965] INFO in event-simulator: USER2 is viewing page1
[2024-10-29 00:27:39,965] INFO in event-simulator: USER2 is viewing page2
[2024-10-29 00:27:40,967] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:27:40,967] INFO in event-simulator: USER3 is viewing page3
[2024-10-29 00:27:41,968] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:27:42,969] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:27:42,969] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:27:43,970] INFO in event-simulator: USER1 logged out
[2024-10-29 00:27:44,971] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:27:45,971] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:27:45,972] INFO in event-simulator: USER3 logged in
[2024-10-29 00:27:46,972] INFO in event-simulator: USER1 logged in
[2024-10-29 00:27:47,973] INFO in event-simulator: USER4 logged in
[2024-10-29 00:27:48,974] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:27:49,975] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:27:50,977] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:27:50,977] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:27:50,977] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:27:51,978] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:27:52,980] INFO in event-simulator: USER2 is viewing page2
[2024-10-29 00:27:53,981] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:27:54,982] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:27:55,984] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:27:55,984] INFO in event-simulator: USER4 logged out
[2024-10-29 00:27:56,985] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:27:57,985] INFO in event-simulator: USER4 is viewing page2
[2024-10-29 00:27:58,987] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:27:58,987] INFO in event-simulator: USER2 is viewing page2
[2024-10-29 00:27:59,988] INFO in event-simulator: USER2 is viewing page3
[2024-10-29 00:28:00,989] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:28:00,989] INFO in event-simulator: USER4 is viewing page3
[2024-10-29 00:28:01,990] INFO in event-simulator: USER1 is viewing page3
[2024-10-29 00:28:02,992] INFO in event-simulator: USER4 logged out
[2024-10-29 00:28:03,993] INFO in event-simulator: USER3 logged out
[2024-10-29 00:28:04,994] INFO in event-simulator: USER4 logged in
[2024-10-29 00:28:05,995] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:28:05,996] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:28:06,996] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:28:06,996] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:28:07,997] INFO in event-simulator: USER3 is viewing page3
[2024-10-29 00:28:08,998] INFO in event-simulator: USER1 logged in
[2024-10-29 00:28:09,999] INFO in event-simulator: USER2 logged in
[2024-10-29 00:28:11,001] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:28:11,001] INFO in event-simulator: USER3 logged in
[2024-10-29 00:28:12,001] INFO in event-simulator: USER2 logged in
[2024-10-29 00:28:13,003] INFO in event-simulator: USER2 logged out
[2024-10-29 00:28:14,003] INFO in event-simulator: USER1 is viewing page2
[2024-10-29 00:28:15,005] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:28:15,005] INFO in event-simulator: USER4 logged out
[2024-10-29 00:28:16,005] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:28:16,005] INFO in event-simulator: USER1 logged in
[2024-10-29 00:28:17,006] INFO in event-simulator: USER2 logged in
[2024-10-29 00:28:18,013] INFO in event-simulator: USER3 logged out
[2024-10-29 00:28:19,014] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:28:20,015] INFO in event-simulator: USER2 is viewing page2
[2024-10-29 00:28:21,016] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:28:21,016] INFO in event-simulator: USER4 is viewing page2
[2024-10-29 00:28:22,017] INFO in event-simulator: USER4 logged out
[2024-10-29 00:28:23,018] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:28:23,018] INFO in event-simulator: USER3 logged in
[2024-10-29 00:28:24,019] INFO in event-simulator: USER3 is viewing page3
[2024-10-29 00:28:25,021] INFO in event-simulator: USER4 is viewing page1
[2024-10-29 00:28:26,021] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:28:26,021] INFO in event-simulator: USER3 is viewing page3
[2024-10-29 00:28:27,023] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:28:28,024] INFO in event-simulator: USER3 is viewing page2
[2024-10-29 00:28:29,025] INFO in event-simulator: USER3 logged out
[2024-10-29 00:28:30,027] INFO in event-simulator: USER1 logged out
[2024-10-29 00:28:31,028] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:28:31,028] WARNING in event-simulator: USER30 Order failed as the item is OUT OF STOCK.
[2024-10-29 00:28:31,028] INFO in event-simulator: USER3 logged in
[2024-10-29 00:28:32,028] INFO in event-simulator: USER1 logged in
[2024-10-29 00:28:33,030] INFO in event-simulator: USER1 logged in
[2024-10-29 00:28:34,031] INFO in event-simulator: USER2 is viewing page1
[2024-10-29 00:28:35,032] INFO in event-simulator: USER1 is viewing page1
[2024-10-29 00:28:36,034] WARNING in event-simulator: USER5 Failed to Login as the account is locked due to MANY FAILED ATTEMPTS.
[2024-10-29 00:28:36,034] INFO in event-simulator: USER3 is viewing page1
[2024-10-29 00:28:37,034] INFO in event-simulator: USER3 logged in
```
## A4: USER30 - Item Out of Stock



