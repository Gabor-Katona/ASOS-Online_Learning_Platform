import { url } from '../../../js/url.js';
export default{
    async createNewCourse(context, payload){
        const res = await fetch(url, {
            method: 'POST',
            body: payload,
        });
        const responseData = await res.json();
        console.log(responseData);

        if (!res.ok) {
            throw new Error("Stala sa nejaká chyba, skúste znova!");
        }
        /*if(responseData === 'Title exists for this course'){
            throw new Error("Tento titul už existuje pre tento kurz!");
        }
        if(payload.get('action') === 'editTest'){
            context.commit('updateTest', payload);
        }*/
    },
    async fetchCourses(context, payload){
        const res = await fetch(url, {
            method: 'POST',
            body: payload,
        });
        if (!res.ok) {
            throw new Error("Stala sa nejaká chyba pri inicializácií, skúste znova!");
        }
        const responseData = await res.json();
        context.commit('setCourses', responseData);
    },
    async fetchCompleteCourse(context, payload){
        const res = await fetch(url, {
            method: 'POST',
            body: payload,
        });
        if (!res.ok) {
            throw new Error("Stala sa nejaká chyba, skúste znova!");
        }
        const responseData = await res.json();
        console.log(responseData)
        context.commit('setCourseContent', responseData);
    },
    async deleteCourse(context, payload){
        await fetch(url, {
            method: 'POST',
            body: payload,
        });
        context.commit('deleteCourse', payload.get('id'));
    },

};