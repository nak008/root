FROM python:3.9
ENV PYTHONNUNBUFFERED 1

COPY requirements.txt ./
COPY .vscode ./
RUN python -m pip install --upgrade pip
RUN pip3 uninstall fitz
RUN pip3 uninstall PyMuPDF
RUN pip3 uninstall frontend
RUN pip3 cache purge
# ここまで既存パッケージの削除
# ここから再インストール
RUN pip3 install -r requirements.txt

WORKDIR /src
COPY /src /src

COPY kaggle.json /root/.kaggle/
RUN chmod 600 /root/.kaggle/kaggle.json