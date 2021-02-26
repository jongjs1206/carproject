// 꺾은선 그래프 코드

Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
Chart.defaults.global.defaultFontColor = '#292b2c';

var ctx = document.getElementById("myAreaChart");
var myLineChart = new Chart(ctx, {
  type: 'line',
  // 샘플 데이터 삽입(라벨, 표시 범위, 실제 값 등)
  data: {
    labels: ["1월 1일", "1월 2일", "1월 3일", "1월 4일", "1월 5일", "1월 6일", "1월 7일", "1월 8일", "1월 9일", "1월 10일", "1월 11일", "1월 12일", "1월 13일",
    "1월 14일", "1월 15일", "1월 16일", "1월 17일", "1월 18일", "1월 19일", "1월 20일", "1월 21일", "1월 22일", "1월 23일", "1월 24일", "1월 25일", "1월 26일", "1월 27일", "1월 28일", "1월 29일", "1월 30일", "1월 31일"],
    datasets: [{
      label: "라벨",
      lineTension: 0.3,
      backgroundColor: "rgba(2,117,216,0.2)",
      borderColor: "rgba(2,117,216,1)",
      pointRadius: 5,
      pointBackgroundColor: "rgba(2,117,216,1)",
      pointBorderColor: "rgba(255,255,255,0.8)",
      pointHoverRadius: 5,
      pointHoverBackgroundColor: "rgba(2,117,216,1)",
      pointHitRadius: 50,
      pointBorderWidth: 2,
      data: [20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 
        20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000, 20000],
    }],
  },
  options: {
    scales: {
      xAxes: [{
        time: {
          unit: 'date'
        },
        gridLines: {
          display: false
        },
        ticks: {
          maxTicksLimit: 6
        }
      }],
      yAxes: [{
        ticks: {
          min: 0,
          max: 40000,
          maxTicksLimit: 5
        },
        gridLines: {
          color: "rgba(0, 0, 0, .125)",
        }
      }],
    },
    legend: {
      display: false
    }
  }
});
 