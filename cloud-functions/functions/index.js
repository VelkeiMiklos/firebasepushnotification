let functions = require('firebase-functions');

let admin = require('firebase-admin')//admin jogok
admin.initializeApp(functions.config().firebase)

exports.announceProduct = functions.database
  .ref('products/{productId}')//melyik childről beszélünk,
  //tehát amikor új product kerül a tableba
  .onCreate(event =>{
    let product = event.data.val()
    sendNotification(product)//itt initializálunk egy productot
  })

  function sendNotification(product){
    let title = product.title
    let cost = product.cost

//beállítani a notificationt
    let payload = {
      notification:{
        title: "New Product Available",
        body:title + 'for $' + cost,
        sound: 'default'
      }
    }
    console.log(payload);
// csak akkor küldje ha fel vagyunk iratkozva
    let topic = "newProducts"
    admin.messaging().sendToTopic(topic,payload)//küldeni

  }
