import { defineConfig } from "vite";
import react from "@vitejs/plugin-react";

// https://vitejs.dev/config/
export default defineConfig({
  base: "/chessviz2/",
  plugins: [
    react({
      include: ["**/*.res.mjs"],
    }),
  ],
});
