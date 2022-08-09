# Cloud-TPU-Setup

Run following command on your TPU VM.

```bash
sh -c "$(curl -fsSL -H "Authorization: token $TOKEN" https://raw.githubusercontent.com/yuneg11/Cloud-TPU-Setup/master/setup.sh)"
echo 'export TPU_NAME="TPU"' >> ~/.zshrc
```
