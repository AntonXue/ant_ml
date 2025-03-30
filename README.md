# 🐜 First Time Install: ant-ml

Welcome! This guide will walk you through setting up `ant-ml` on your Mac for the first time.

---

## 1. 💾 Download the Code

### ✅ Using Git (preferred)
If you already have Git installed (or want to install it), this is the cleanest way to download the code.

#### How to check if Git is installed:
Open the **Terminal** (you can find it in Spotlight Search by typing `Terminal`) and run:
```bash
git --version
```

If you see something like `git version 2.30.1`, then you're good to go!

If not, you can install Git using Homebrew:
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install git
```

#### Clone the repository:
Now, run this command in your terminal to download the code:
```bash
git clone https://github.com/AntonXue/ant_ml.git
cd ant_ml
```

---

### 🐌 Without Git (less preferred)
If you don’t want to install Git, you can still download the code manually.

1. Visit: [https://github.com/AntonXue/ant_ml](https://github.com/AntonXue/ant_ml)
2. Click the green **"Code"** button near the top right.
3. Select **"Download ZIP"**.
4. Once downloaded, double-click the ZIP file to extract it.
5. Open **Terminal**, and `cd` into the extracted folder. For example:
   ```bash
   cd ~/Downloads/ant_ml-main
   ```

---

## 2. 📦 Install Miniconda (conda)

We use `conda` to manage Python environments.

### How to check if you already have conda installed:
```bash
conda --version
```

If you get something like `conda 23.7.2`, you're good!

Otherwise, follow these steps:

1. Go to [https://docs.conda.io/en/latest/miniconda.html](https://docs.conda.io/en/latest/miniconda.html)
2. Download the **macOS** installer for your system (likely "64-bit (bash installer)").
3. Open Terminal, and run:
   ```bash
   bash ~/Downloads/Miniconda3-latest-MacOSX-x86_64.sh
   ```
4. Follow the prompts to install. (You can mostly just press Enter.)

Once installed, either restart your terminal or run:
```bash
source ~/.zshrc  # or ~/.bash_profile, depending on your shell
```

---

## 3. 🔧 Set up `ant-ml`

Navigate to the `ant_ml` folder in Terminal (if you're not already there), and run:
```bash
./setup.sh
```

> 🔐 **Permission Denied?**
If you see an error like:
```
zsh: ./setup.sh: Permission denied
```
Just run:
```bash
chmod +x ./setup.sh
```
and try again.


---

# 🚀 Using `ant-ml`

1. Put your ant images into the `input_images/` folder.
2. Open `runme.sh` in a text editor (like VS Code or even TextEdit) to adjust any settings if needed.
3. Run the pipeline:
   ```bash
   ./runme.sh
   ```
> 🔐 **Permission Denied?**
If you see an error like:
```
zsh: ./setup.sh: Permission denied
```
Just run:
```bash
chmod +x ./runme.sh
```
and try again.

## When you're done using ant-ml

If you are not going to run other Python programs, you don't have to do anything special!
If you do run a lot of Python programs, it's important to note that our scripts activate the conda enviroment named ant-ml.
A conda environment contains lots of Python-related software libraries.
To get back to your base (ant free!) conda environment, you can run
```bash
conda deactivate ant-ml
```
---




---

Let us know if you run into issues, and happy ant-tracking! 🐜
