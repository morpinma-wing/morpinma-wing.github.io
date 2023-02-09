import "./HeaderBar.css";
import { Link } from "react-router-dom";
import React  from 'react';

export default function HeaderBar() {
    return (
        <div className="header">
            <h1 className="">
                PCPost
            </h1>
            <div className="">
                <Link to="/PCPost" className="">
                    <div>
                        <h1 className="">
                            MainWorld
                        </h1>
                    </div>
                </Link>
                <Link to="/PCPost/NewPost" className="">
                    <div>
                        <h1 className="">
                            NewPost
                        </h1>
                    </div>
                </Link>
                <Link to="/SignIn" className="">
                    <div>
                        <h1 className="">
                            SignIn
                        </h1>
                    </div>
                </Link>
            </div>
        </div>
    );
}