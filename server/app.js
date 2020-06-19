const express = require("express");
const db = require("./db_helper");
const cors = require("cors");

const app = express();

app.use(cors());
app.set("view engine", "ejs");
app.use(express.json());
app.use(express.urlencoded({ extended: false }));
app.all("/*", function (req, res, next) {
    res.header("Access-Control-Allow-Origin", req.headers.origin);
    res.header("Access-Control-Allow-Credentials", true);
    res.header("Access-Control-Allow-Methods", "GET,PUT,POST,DELETE,OPTIONS");
    res.header(
        "Access-Control-Allow-Headers",
        "Content-Type,Accept,X-Access-Token,X-Key,Authorization,X-Requested-With,Origin,Access-Control-Allow-Origin,Access-Control-Allow-Credentials"
    );
    if (req.method === "OPTIONS") {
        res.status(200).end();
    } else {
        next();
    }
});

app.post("/sendPPM", async function (req, res) {
    console.log(req.body.ppm);

    let conn = await db.getConnection();
    let query = `INSERT INTO data VALUES ('${req.body.ppm}',NULL)`;
    await db.executeQuery(conn, query);
    conn.release();
});

app.get("/", function (req, res) {
    res.render("index");
});

app.get("/api/getData", async function (req, res) {
    let conn = await db.getConnection();
    let query = `SELECT ppm,time FROM data ORDER BY time DESC LIMIT 1`;
    let result = await db.executeQuery(conn, query);
    conn.release();
    res.send(result[0]);
});

app.post("/api/changeMode", async function (req, res) {
    let state = req.body.state;

    let conn = await db.getConnection();
    let query = `INSERT INTO mode VALUES('${state}',null)`;
    let result = await db.executeQuery(conn, query);
    conn.release();

    res.status(200).send("Success");
});

app.get("/api/getState", async function (req, res) {
    let conn = await db.getConnection();
    let query = `SELECT * FROM mode ORDER BY time DESC LIMIT 1`;
    let result = await db.executeQuery(conn, query);
    conn.release();

    let mode1;
    if (result.length == 0) {
        mode1 = 1;
    } else {
        mode1 = result[0].state;
    }
    console.log(mode1);
    res.send(mode1 + "");
});

app.listen(3000);
