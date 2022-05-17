<template>
  <div style="width: 100%;">
    <h1>Body</h1>
    <button type="button" @click="getPicture" style="display: block; margin: auto;">Get Picture</button>
    <img alt='dog' :src="img" style="max-width: 100%; max-height: 300px;">
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      img: '../../public/noimage.png',
    }
  },
  methods: {
    getPicture() {
      axios.get('https://dog.ceo/api/breeds/image/random')
      .then(res => {
        this.img = res.data.message
      }).catch(err => {
        console.error(err)
      })
    }
  }
}
</script>
