FROM python:3.9
ENV PYTHONNUNBUFFERED 1

COPY requirements.txt .
RUN python -m pip install --upgrade pip
RUN pip3 uninstall fitz
RUN pip3 uninstall PyMuPDF
RUN pip3 uninstall frontend
RUN pip3 cache purge
# ここまで既存パッケージの削除
# ここから再インストール
RUN pip3 install fitz
# 以下は、必ず必要なはず
RUN pip3 install PyMuPDF
RUN pip3 install frontend
RUN pip3 install genanki
RUN pip3 install pdfrw
RUN pip3 install -r requirements.txt
RUN pip install dash
RUN pip install jupyterlab

WORKDIR /src
COPY /src /src

COPY kaggle.json /root/.kaggle/
RUN chmod 600 /root/.kaggle/kaggle.json
