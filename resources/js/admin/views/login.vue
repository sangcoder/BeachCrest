<template>
  <div id="login">
    <label for="email">Email</label>
    <input type="email" id="email" v-model="email">
    <label for="pass">Password</label>
    <input type="text" id="pass" v-model="password">
    <button @click="Login">Đăng Nhập</button>
  </div>
</template>

<script src="./login.js">
</script>