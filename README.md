# Cloud-TPU-Setup

Run following command on your TPU VM.

```bash
export TOKEN=<YOUR_GITHUB_TOKEN>
export TPU_NAME=<TPU_NAME>
sh -c "$(curl -fsSL -H "Authorization: token $TOKEN" https://raw.githubusercontent.com/yuneg11/Cloud-TPU-Setup/master/setup.sh)"
```
