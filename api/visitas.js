const fs = require('fs');
const path = require('path');

const filePath = path.join(__dirname, 'contador.txt');

function readVisits() {
    try {
        return parseInt(fs.readFileSync(filePath, 'utf8'), 10) || 0;
    } catch {
        return 0;
    }
}

function writeVisits(count) {
    fs.writeFileSync(filePath, String(count));
}

module.exports = (req, res) => {
    let visitas = readVisits() + 1;
    writeVisits(visitas);
    res.setHeader('Content-Type', 'application/json');
    res.status(200).end(JSON.stringify({ visitas }));
};
