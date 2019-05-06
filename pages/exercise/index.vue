<template>
  	<div class="home_container">
        <itemcontainer father-component="home"></itemcontainer>
    </div>
</template>

<script>
import itemcontainer from './components/index'

export default {
	name: 'home',
  	components: {
  		itemcontainer
  	},
    created(){
        
    }
}
</script>
