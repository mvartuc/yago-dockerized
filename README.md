# YAGO-Dockerized

Run the YAGO knowledge base with its web UI locally using Docker.

---

## 📥 Download the Dataset

Choose the dataset size that fits your needs:

- **Full Dataset** (~12GB zipped, ~110GB unzipped):  
  ```sh
  ./download_big_yago.sh
  ```
- **Tiny Dataset** (~200MB zipped, ~1.2GB unzipped):  
  ```sh
  ./download_tiny_yago.sh
  ```

Alternatively, you can place your own YAGO `.ttl` files inside the `data/` folder instead of using the provided scripts.

---

## 🚀 Running the Project

Ensure you are in the project root folder, then start the services using:

```sh
docker compose up
```

---

## 📤 Loading Data into Blazegraph

Once the services are running, load the dataset into Blazegraph:

```sh
cd ./data
./load-data.sh
```

⏳ **Note:**  
This process may take a long time, especially for the full dataset. A **fast SSD** is highly recommended.

---

## 🌐 Accessing the Interfaces

Once the dataset is loaded, you can access:

- **YAGO Web UI:** [http://localhost:8080](http://localhost:8080)
- **Blazegraph Dashboard:** [http://localhost:8889/](http://localhost:8889/)

---

## 🛠 Troubleshooting

If you encounter issues:
- Ensure Docker and Docker Compose are installed and running.
- Check logs using:
  ```sh
  docker compose logs -f
  ```
- Verify that the dataset has been correctly placed in the `data/` folder.
- Restart the services if necessary:
  ```sh
  docker compose down && docker compose up
  ```

---

## 📜 License

This project is licensed under the MIT License.

---

## 🤝 Contributing

Contributions are welcome! Feel free to submit pull requests or report issues.

---

## 📄 References

- [YAGO Knowledge Base](https://yago-knowledge.org/)
- [Blazegraph Documentation](https://blazegraph.com/)
