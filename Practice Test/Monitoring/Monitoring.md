# Q1: ℹ️ We have deployed a few PODs running workloads. Inspect them.
Wait for the pods to be ready before proceeding to the next question.

## A1: OK

<br>

# Q2: ℹ️ Let us deploy metrics-server to monitor the PODs and Nodes. Pull the git repository for the deployment files.
Run: `git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git`
```bash
git clone https://github.com/kodekloudhub/kubernetes-metrics-server.git
```

## A2: OK

<br>

# Q3: Deploy the metrics-server by creating all the components downloaded.
Run the `kubectl create -f .` command from within the downloaded repository.

## A3: 

```bash
pwd
/root
```
```bash
cd kubernetes-metrics-server
```
```bash
kubectl create -f .
```

<br>

# Q4: ℹ️  It takes a few minutes for the metrics server to start gathering data.
Run the `kubectl top node` command and wait for a valid output.
```bash
kubectl top node
```
| NAME          | CPU(cores) | CPU% | MEMORY(bytes) | MEMORY% |
|---------------|------------|------|---------------|---------|
| controlplane  | 233m       | 0%   | 1089Mi        | 0%      |
| node01        | 41m        | 0%   | 301Mi         | 0%      |

## A4: OK

<br>

## Q5: Identify the node that consumes the most CPU(cores).
```bash
kubectl top node
```
| NAME          | CPU(cores) | CPU% | MEMORY(bytes) | MEMORY% |
|---------------|------------|------|---------------|---------|
| controlplane  | 211m       | 0%   | 922Mi         | 0%      |
| node01        | 38m        | 0%   | 303Mi         | 0%      |


## A5: controlplane

<br>

# Q6: Identify the node that consumes the most Memory(bytes).
```bash
kubectl top node
```
| NAME          | CPU(cores) | CPU% | MEMORY(bytes) | MEMORY% |
|---------------|------------|------|---------------|---------|
| controlplane  | 209m       | 0%   | 1104Mi        | 0%      |
| node01        | 40m        | 0%   | 301Mi         | 0%      |

## Q6: controlplane

<br>

# Q7: Identify the POD that consumes the most Memory(bytes) in default namespace.
```bash
kubectl top pod
```
| NAME     | CPU(cores) | MEMORY(bytes) |
|----------|------------|---------------|
| elephant | 14m        | 32Mi          |
| lion     | 1m         | 18Mi          |
| rabbit   | 94m        | 252Mi         |

## A7: rabbit

<br>

# Q8: Identify the POD that consumes the least CPU(cores) in default namespace.
```bash
kubectl top pod
```
| NAME     | CPU(cores) | MEMORY(bytes) |
|----------|------------|---------------|
| elephant | 14m        | 32Mi          |
| lion     | 1m         | 18Mi          |
| rabbit   | 105m       | 252Mi         |

## A8: lion

