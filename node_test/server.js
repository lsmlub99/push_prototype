const express = require('express');
const bodyParser = require('body-parser');
const admin = require('firebase-admin');
const path = require('path');

const app = express();
const port = 3000;

// Firebase Admin 초기화
const serviceAccount = require(path.join(__dirname, 'your firebase FCM json file'));

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

app.use(bodyParser.json());

// FCM 메시지 전송 엔드포인트
app.post('/send', (req, res) => {
  const { token, message } = req.body;

  const payload = {
    notification: JSON.parse(message),
    token: token
  };

  // 5초 후에 FCM 메시지 전송
  setTimeout(() => {
    admin.messaging().send(payload)
      .then((response) => {
        console.log('Successfully sent message:', response);
      })
      .catch((error) => {
        console.log('Error sending message:', error);
      });
  }, 5000); // 5초 지연

  res.status(200).send('Delay timer started for 5 seconds');
});

app.listen(port, () => {
  console.log(`Server is running on http://localhost:${port}`);
});
