import HeaderBar from "./HeaderBar";
import "./Background.css";
import React  from 'react';

export default function Background(props) {
    return (
        <div className="background">
            <HeaderBar/>
            {props.children}
        </div>
    )
}