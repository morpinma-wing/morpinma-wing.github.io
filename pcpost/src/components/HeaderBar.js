import "./HeaderBar.css";
import { Link } from "react-router-dom";
import React  from 'react';

export default function HeaderBar() {
    return (
        <div className="header">
            <h1 className="sub-child">
                PCPost
            </h1>
            <div className="header sub-child nav-bar">
                <Link to="/PCPost" className="sub-child">
                    <div>
                        <h1 className="">
                            MainWorld
                        </h1>
                    </div>
                </Link>
                <Link to="/PCPost/NewPost" className="sub-child">
                    <div>
                        <h1 className="">
                            NewPost
                        </h1>
                    </div>
                </Link>
                <Link to="/PCPost/SignIn" className="sub-child">
                    <div>
                        <h1 className="">
                            SignIn/Out
                        </h1>
                    </div>
                </Link>
            </div>
        </div>
    );
}