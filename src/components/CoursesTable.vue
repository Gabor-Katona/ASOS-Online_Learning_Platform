<template>
  <v-table theme="dark" fixed-header height="200px" density="compact">
    <thead>
    <tr>
      <th>Titul</th>
      <th>Vytvoril používateľ</th>
      <th>Možnosti</th>
    </tr>
    </thead>
    <tbody>
    <tr v-for="course in courses" :key="course.id">
      <td data-label="Username">{{ course.title }}</td>
      <td data-label="Role">{{ course.username }}</td>
      <td>
        <base-button class="delete" @click="showCourse(course.id)"
        >Zobraziť</base-button
        >
        <base-button class="delete" @click="deleteCourse(course.id)"
        >Vymazať</base-button
        >
      </td>
    </tr>
    </tbody>
  </v-table>
</template>

<script>
export default {
  props: ["courses"],
  emits:['delete-course', 'show-course'],
  methods: {
    deleteCourse(id) {
      this.$emit("delete-course", id);
    },
    showCourse(id) {
      this.$emit("show-course", id);
    },
  },
};
</script>