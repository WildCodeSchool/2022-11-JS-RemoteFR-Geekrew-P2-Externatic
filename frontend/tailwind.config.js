/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./index.html", "./src/**/*.{js,ts,jsx,tsx}"],
  theme: {
    extend: {
      screens: {
        sm: "480px",
        md: "768px",
        lg: "976px",
        xl: "1440px",
      },
      colors: {
        blue: "#1fb6ff",
        purple: "#7e5bef",
        pink: "#ff49db",
        orange: "#ff7849",
        yellow: "#ffc82c",
        main: "#C92061",
        "main-dark": "#841341",
        "main-light": "#F1C5D6",
        black: "#272727",
        grey1: "#666666",
        grey2: "#999999",
        grey3: "#CCCCCC",
        green: "#54A05C",
        red: "#FF3838",
      },
      fontFamily: {
        jost: ["Jost", "sans-serif"],
      },
      extend: {
        spacing: {
          128: "32rem",
          144: "36rem",
        },
        borderRadius: {
          "4xl": "2rem",
        },
      },
      backgroundImage: {},
    },
  },
  plugins: [],
};
