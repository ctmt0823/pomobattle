<!DOCTYPE html>
<html lang="ja">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Study Duel - ポモドーロタイマー</title>
  <style>
    body {
      font-family: sans-serif;
      background-color: #f0f4f8;
      display: flex;
      flex-direction: column;
      align-items: center;
      justify-content: center;
      height: 100vh;
      margin: 0;
    }

    h1 {
      margin-bottom: 10px;
      font-size: 1.8rem;
    }

    #timer {
      font-size: 3rem;
      margin: 20px;
    }

    button {
      padding: 10px 20px;
      font-size: 1.2rem;
      margin: 5px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
    }

    #startBtn { background-color: #007bff; color: white; }
    #resetBtn { background-color: #6c757d; color: white; }

    #modeLabel {
      font-size: 1rem;
      color: #333;
    }

    #count {
      margin-top: 20px;
      font-size: 1.1rem;
    }
  </style>
</head>
<body>
  <h1>Study Duel - ポモドーロ</h1>
  <div id="modeLabel">集中タイム</div>
  <div id="timer">25:00</div>
  <div>
    <button id="startBtn">スタート</button>
    <button id="resetBtn">リセット</button>
  </div>
  <div id="count">集中回数: 0</div>

  <script>
    let timer;
    let isRunning = false;
    let mode = 'focus'; // 'focus' or 'break'
    let timeLeft = 25 * 60; // seconds
    let count = 0;

    const timerEl = document.getElementById('timer');
    const startBtn = document.getElementById('startBtn');
    const resetBtn = document.getElementById('resetBtn');
    const modeLabel = document.getElementById('modeLabel');
    const countEl = document.getElementById('count');

    function updateDisplay() {
      const minutes = Math.floor(timeLeft / 60).toString().padStart(2, '0');
      const seconds = (timeLeft % 60).toString().padStart(2, '0');
      timerEl.textContent = `${minutes}:${seconds}`;
    }

    function switchMode() {
      if (mode === 'focus') {
        mode = 'break';
        timeLeft = 5 * 60;
        modeLabel.textContent = '休憩タイム';
      } else {
        mode = 'focus';
        timeLeft = 25 * 60;
        count++;
        countEl.textContent = `集中回数: ${count}`;
        modeLabel.textContent = '集中タイム';
      }
      updateDisplay();
    }

    function startTimer() {
      if (isRunning) return;
      isRunning = true;
      timer = setInterval(() => {
        timeLeft--;
        updateDisplay();
        if (timeLeft <= 0) {
          clearInterval(timer);
          isRunning = false;
          alert(mode === 'focus' ? 'おつかれさま！休憩しよう！' : 'そろそろ再開しよう！');
          switchMode();
        }
      }, 1000);
    }

    function resetTimer() {
      clearInterval(timer);
      isRunning = false;
      mode = 'focus';
      timeLeft = 25 * 60;
      count = 0;
      countEl.textContent = `集中回数: 0`;
      modeLabel.textContent = '集中タイム';
      updateDisplay();
    }

    startBtn.addEventListener('click', startTimer);
    resetBtn.addEventListener('click', resetTimer);
    updateDisplay();
  </script>
</body>
</html>
