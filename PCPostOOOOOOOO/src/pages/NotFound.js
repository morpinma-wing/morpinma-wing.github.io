import Background from "../components/Background";
import "./NotFound.css";
import "../styles.css";
import React, { useEffect }  from 'react';

function NotFound() {
  useEffect(() => {
    document.title = "StreamClicker | Not Found";
  }, []);

  return (
    <Background>
      <div className="outerContainer">
        <h1 className="text notFound purple">We could not find the page you were looking for. :(</h1>
        <img className="notFoundImage" src="https://cdn-icons-png.flaticon.com/512/2731/2731811.png"/>
      </div>
    </Background>
  );
}

export default NotFound;
