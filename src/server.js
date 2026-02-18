import express, { json } from "express";
const app = express();

app.use(json());

app.get("/", (_req, res) => {
  res.send("Hello, World! This is a basic Express app deployed on Vercel.");
});

app.get("/api/hello", (_, res) => {
  res.json({ message: "Hello from the API!" });
});

// touch

export default app; // Export for Vercel serverless function
