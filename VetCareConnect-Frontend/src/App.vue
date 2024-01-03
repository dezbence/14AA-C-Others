<template>
  <RouterView />
</template>

<script setup>
import { RouterView } from 'vue-router'
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@200;400;700&family=Roboto:wght@100;300;400;500;700&display=swap');

#app {
  font-family: 'Montserrat', sans-serif;
}

body {
  margin: 0;
  padding: 0;
  overflow-x: hidden;
  scroll-behavior: smooth;
  position: relative;
  min-height: 100vh;
}

h1, h2, h3, h4, h5, h6, a, button {
  font-family: 'Roboto', sans-serif;
}
</style>
