import firebase from 'firebase'
import 'firebase/firestore'
// Your web app's Firebase configuration
const firebaseConfig = {
  apiKey: "AIzaSyAy7jRaig3hMXmxxh8seyK8Ga2EuFjVLvk",
  authDomain: "awesome-todo-3bb70.firebaseapp.com",
  databaseURL: "https://awesome-todo-3bb70.firebaseio.com",
  projectId: "awesome-todo-3bb70",
  storageBucket: "awesome-todo-3bb70.appspot.com",
  messagingSenderId: "902541456497",
  appId: "1:902541456497:web:38e70cc3c0d494c1"
};
// Initialize Firebase
const firebaseApp = firebase.initializeApp(firebaseConfig);

const firestore = firebaseApp.firestore()

export default firestore
