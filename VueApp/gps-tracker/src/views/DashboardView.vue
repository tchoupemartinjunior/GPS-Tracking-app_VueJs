<template>
<div id="app"><DataChart/></div>

</template>

<script>
import DataChart from "@/components/DataChart.vue"

export default {
  name: 'App',
  components: {
    DataChart
  },
   data() {
    return {
      chartData: {
        Books: 24,
        Magazine: 30,
        Newspapers: 10
      }
    };
  }
}
</script>