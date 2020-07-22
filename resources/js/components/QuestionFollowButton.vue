<template>
    <button
            class="btn"
            v-bind:class="{'btn-success': followed}"
            v-text="text"
            v-on:click="follow"
    ></button>
</template>

<script>
    export default {
        props: ['question', 'user'],
        mounted() {
            this.$http.post('/api/question/follower', {'question':this.question,'user':this.user})
                .then(function(res){
                    this.followed = res.data.followed;
                });
        },
        data() {
            return {
                followed: false
            }
        },
        computed: {
            text() {
                return this.followed ? '已关注' : '关注该问题'
            }
        },
        methods: {
            follow() {
                this.$http.post('/api/question/follow', {'question':this.question,'user':this.user})
                    .then(function(res){
                        this.followed = res.data.followed;
                    });
            }
        }
    }
</script>

<style scoped>

</style>
