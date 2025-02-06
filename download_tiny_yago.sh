#!/bin/bash
wget https://yago-knowledge.org/data/yago4.5/yago-4.5.0.2-tiny.zip -O ./data/yago.zip
unzip ./data/yago.zip -d ./data
rm ./data/yago.zip
