<template>
  <FormKit
      type="form"
      v-model="formValues"
      @submit="saveFormkitForm"
      :actions="false"
      incomplete-message="Formulár nie je korektne vyplnený!"
  >
    <base-card>
      <p>
        Tu sa dá vytvoriť test s 10 otázkami a odpoveďami typu A,B,C - pre
        jednotlivé témy.
      </p><br>
      <p>1.Krok: zadajte titul kurzu</p>
      <p>3.Krok: vyplňte obsah kurzu</p>
      <p>4.Krok: odoslať formulár</p><br>
      <FormKit
          type="text"
          name="title"
          label="Titul"
          help="Titul pre nový kurz"
          validation="required"
          :validation-messages="{
          required: 'Nezadali ste titul!',
        }"
      />
    </base-card>

      <base-card v-for="(field, index) in inputFields" :key="index">
        <FormKit
            v-if="field.inputType === 'textarea'"
            type="textarea"
            name="s1"
            :label="field.label"
            help="Zadajte text sekcie"
            validation="required|length:0,2000"
            :validation-messages="{
                length: 'Max dĺžka sekcie je 2000 znakov!',
                required: 'Nezadali ste text k sekcii!',
              }"
        />
        <FormKit
            v-if="field.inputType === 'image'"
            type="text"
            name="s1"
            :label="field.label"
            help="Zadajte link obrázka"
            validation="required|length:0,200"
            :validation-messages="{
                length: 'Max dĺžka linku je 2000 znakov!',
                required: 'Nezadali ste link obrázka!',
              }"
        />
      </base-card>

    <base-card>
      <p>Vyberte typ obsahu:</p>
      <select v-model="inputType">
        <option value="image">Obrázok</option>
        <option value="textarea">Sekcia</option>
      </select>
      <br><br>
      <base-button @click="addNewField">Pridať ďalší obsah</base-button>

      <base-button v-if="inputFields.length > 0" @click="removeLastField">Odstrániť obsah</base-button>
    </base-card>


    <base-button>{{ edit ? "Uložiť zmeny" : "Vytvoriť kurz" }}</base-button>

  </FormKit>
</template>

<script>

export default {
  props: ["test", "edit"],
  emits: ["save-test", "edit-test"],
  data() {
    return {
      inputFields: [{label: 'Obsah 1', inputType: 'textarea'}],
      inputType: 'image', // Default input type
    };
  },
  methods: {
    addNewField() {
      this.inputFields.push({
        label: `Obsah ${this.inputFields.length + 1}`,
        inputType: this.inputType
      });
    },
    removeLastField() {
      this.inputFields.pop();
    },
  },
};
</script>

<style scoped>

</style>

