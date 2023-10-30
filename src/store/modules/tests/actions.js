export default{
    async newTest(context, payload){
        const res = await fetch("http://localhost/ASOS-Online_Learning_Platform/src/api/Actions.php", {
          method: 'POST',
          body: payload,
        });
        const responseData = await res.json();
        console.log('response: ', responseData);
    },
};