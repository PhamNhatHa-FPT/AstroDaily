import React, { useEffect, useState } from "react";
import {
  GoogleAuthProvider,
  signInWithPopup,
  onAuthStateChanged,
  signOut,
} from "firebase/auth";
import { GoogleButton } from "react-google-button";
import { auth } from "./firebaseConfig";

function App() {
  const [user, setUser] = useState(1);
  const googleSignIn = () => {
    const provider = new GoogleAuthProvider();
    signInWithPopup(auth, provider);
  };
  useEffect(() => {
    const unsubscribe = onAuthStateChanged(auth, (currentUser) => {
      setUser(currentUser);
    });
    return () => {
      unsubscribe();
    };
  }, []);

  const handleSignOut = () => {
    signOut(auth);
  };
  return (
    <div className="App">
      <header className="App-header">
        {user ? (
          <>
            <p>Welcome, {user?.displayName}</p>
            <button onClick={handleSignOut} className="border py-2 px-5 mt-10">
              Logout
            </button>
          </>
        ) : (
          <GoogleButton onClick={googleSignIn} />
        )}
      </header>
    </div>
  );
}

export default App;
