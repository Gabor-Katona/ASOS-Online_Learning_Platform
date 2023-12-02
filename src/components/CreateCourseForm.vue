<template>
  <FormKit
      type="form"
      v-model="formValues"
      @submit="saveFormkitForm"
      :actions="false"
      incomplete-message="Formulár nie je korektne vyplnený!"
  >
    <base-card v-if="edit !== true">
      <p>
        Tu je možné navrhnúť kurz s požadovaným obsahom.
      </p><br>
      <p>1.Krok: zadajte titul kurzu</p>
      <p>2.Krok: vyplňte obsah kurzu</p>
      <p>3.Krok: odoslať formulár</p><br>
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
            :name="field.name"
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
            :name="field.name"
            :label="field.label"
            help="Zadajte link obrázka"
            validation="required|length:0,200"
            :validation-messages="{
                length: 'Max dĺžka linku je 2000 znakov!',
                required: 'Nezadali ste link obrázka!',
              }"
        />
      </base-card>

    <base-card >
      <p>Vyberte typ obsahu:</p>
      <select v-model="inputType" class="custom-select" style="width:200px;">
        <option value="textarea">Sekcia</option>
        <option value="image">Obrázok</option>
      </select>
      <br><br>
      <base-button @click="addNewField">Pridať ďalší obsah</base-button>

      <base-button v-if="inputFields.length > 0" @click="removeLastField">Odstrániť obsah</base-button>
    </base-card>


    <base-button v-if="edit" @click="close">Zatvoriť</base-button>
    <base-button>{{ edit ? "Uložiť zmeny" : "Navrhnúť kurz" }}</base-button>

  </FormKit>
</template>

<script>

export default {
  props: ["content", "edit"],
  emits: ["save-course", "edit-course", "close"],
  data() {
    return {
      inputFields: [{label: '1 Text', name:'text1', inputType: 'textarea'}],
      inputType: 'textarea', // Default input type
      formValues: {},
    };
  },
  methods: {
    saveFormkitForm() {

      let data = new FormData();
      for (let [key, value] of Object.entries(this.formValues)) {
        data.append(key, value);
      }

      if (this.edit) {
        data.append("action", "editCourse");
        this.$emit("edit-course", data);
      } else {
        data.append("username", this.$store.getters.userId);
        data.append("action", "createCourse");
        this.$emit("save-course", data);
      }
    },
    addNewField() {
      if(this.inputType === 'textarea') {
        this.inputFields.push({
          label: `${this.inputFields.length + 1} Text`,
          name: `text${this.inputFields.length + 1}`,
          inputType: this.inputType
        });
      } else {
        this.inputFields.push({
          label: `${this.inputFields.length + 1} Obrázok`,
          name: `image${this.inputFields.length + 1}`,
          inputType: this.inputType
        });
      }
    },
    removeLastField(e) {
      e.preventDefault();
      this.inputFields.pop();
    },
    loadDetailsForEdit(){
      this.inputFields = []
      for (let i = 0; i < this.content.length; i++) {
        /*console.log(this.content[i]['type'])
        console.log(this.content[i]['text'])*/
        if (this.content[i]['type'] === 'text') {
          this.inputFields.push({
            label: `${this.inputFields.length + 1} Text`,
            name: `text${this.inputFields.length + 1}`,
            inputType: "textarea"
          });
          this.formValues[`text${this.inputFields.length}`] = this.content[i]['text']
        } else {
          this.inputFields.push({
            label: `${this.inputFields.length + 1} Obrázok`,
            name: `image${this.inputFields.length + 1}`,
            inputType: "image"
          });
          this.formValues[`image${this.inputFields.length}`] = this.content[i]['text']
        }

      }
    },
    close(e){
      e.preventDefault();
      this.$emit("close");
    }
  },
  mounted() {
    if (this.content) {
      this.loadDetailsForEdit();
    }
  },
};
</script>

<style scoped>

.custom-select {
  position: relative;
  font-family: Arial;
  background-color: #e3e3e3;
}

select option {
  text-align: center;
}


</style>

