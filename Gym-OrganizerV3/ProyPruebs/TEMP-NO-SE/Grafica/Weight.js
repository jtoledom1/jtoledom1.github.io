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
      // más meses
    ],
    datasets: [
      {
        label: "Monthly Weight",
        data: [70, 72, 75, 73 /* más datos */],
        backgroundColor: "white",
        borderColor: "#3DA06E",
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
        text: "Your Weight",
        padding: {
          bottom: 16,
        },
        font: {
          size: 16,
          weight: "normal",
        },
      },
      tooltip: {
        backgroundColor: "#FDCA49",
        bodyColor: "#0E0A03",
        yAlign: "bottom",
        cornerRadius: 4,
        titleColor: "#0E0A03",
        usePointStyle: true,
        callbacks: {
          label: function(context) {
              if (context.parsed.y !== null) {
                return context.parsed.y + " kg";
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
          text: "Weight [kg]",
        },
      },
    },
  },
});
