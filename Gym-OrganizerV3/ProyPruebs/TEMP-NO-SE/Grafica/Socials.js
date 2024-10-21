const ctx = document.getElementById("chart");

Chart.defaults.color = "#FFF";
Chart.defaults.font.family = "Poppins";

new Chart(ctx, {
  type: "line",
  data: {
    labels: [
      "Jan",
      "Feb",
      "Mar",
      "Apr",
      "May",
      "Jun",
      "Jul",
      "Aug",
      "Sep",
      "Oct",
      "Nov",
      "Dec"
      // más meses
    ],
    datasets: [
      {
        label: "Monthly Length",
        data: [25, 26, 26.5, 27,28.5,29,30,31,32,34,35,35 /* más datos */],
        backgroundColor: "white",
        borderColor: "#fff",
        borderRadius: 6,
        cubicInterpolationMode: 'monotone',
        fill: false,
        borderSkipped: false,
      },
    ],
  },
  options: {
    interaction: {
      intersect: false,
      mode: 'index'
    },
    elements: {
      point:{
          radius: 0
      }
    },
    responsive: true,
    maintainAspectRatio: false,
    plugins: {
      legend: {
        display: false,
      },
      title: {
        display: true,
        text: "Your Length",
        padding: {
          bottom: 16,
        },
        font: {
          size: 16,
          weight: "normal",
        },
      },
      tooltip: {
        backgroundColor: "#ce7e00",
        bodyColor: "#fff",
        yAlign: "bottom",
        cornerRadius: 4,
        titleColor: "#0E0A03",
        usePointStyle: true,
        callbacks: {
          label: function(context) {
              if (context.parsed.y !== null) {
                return context.parsed.y + " cm";
              }
              return null;
          }
        }
      },
    },
    scales: {
      x: {
        border: {
          dash: [2, 4],
        },
        title: {
          text: "2023",
        },
      },
      y: {
        grid: {
          color: "#27292D",
        },
        border: {
          dash: [2, 4],
        },
    
        title: {
          display: true,
          text: "Length [cm]",
        },
      },
    },
  },
});
