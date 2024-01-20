<template>
    <Panel :header="question"  class="questionComponent" toggleable collapsed>
        <p>
            {{ answer }}
        </p>
    </Panel>
</template>

<script setup>
import Panel from 'primevue/panel';
defineProps({
  question: String,
  answer: String
});

</script>

<style lang="css">
.p-panel-header, .p-panel-content, .p-panel-toggler{
    background-color: #005A70;
    color: white;
    border-color: #005A70;
}
.p-panel-title{
    font-size: 26px;
}
.questionComponent {
    background-color: #005A70;
    color: white;
    border-radius: 7px;
    padding: 40px;
    text-align: justify;
    width: 800px;
}

@media (max-width: 900px) {
    .questionComponent {
        width: 500px;
    }
}
@media (max-width: 600px) {
    .questionComponent {
        width: 300px;
    }
}

</style>