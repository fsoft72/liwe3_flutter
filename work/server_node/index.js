const express = require( "express" );
const axios = require( "axios" );

const admin = require( "firebase-admin" );
const serviceAccount = require( "./firebase-admin-sdk.json" );

const cors = require( "cors" );

const app = express();
app.use( cors() );
app.use( express.json() );
app.use( express.static( __dirname ) );

// Initialize Firebase Admin SDK
admin.initializeApp( {
  credential: admin.credential.cert( serviceAccount )
} );


// Define route to send notification
app.post( '/send-notification', async ( req, res ) => {
  const { title, body } = req.body;
  try {
    const message = {
      notification: {
        title,
        body
      },
      topic: 'all', // Replace with your desired topic
    };

    const response = await admin.messaging().send( message );
    res.json( { success: true, messageId: response } );
  } catch ( error ) {
    console.error( 'Error sending message:', error );
    res.status( 500 ).json( { success: false, error: error.message } );
  }
} );

const PORT = 3000;
app.listen( PORT, () => {
  console.log( `Server running on http://localhost:${ PORT }` );
} );
