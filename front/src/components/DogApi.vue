<template>
  <div style="width: 100%;">
    <b-button variant="outline-success" @click="getPicture" style="display: block; margin: 10px auto;">Get Picture</b-button>
    <img alt='dog' :src="img" style="max-width: 100%; max-height: 300px;">
  </div>
</template>

<script>
import axios from 'axios'

export default {
  data() {
    return {
      img: '/noimage.png',
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
