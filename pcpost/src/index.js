import * as React from "react";
import * as ReactDOM from "react-dom";
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";

import MainWorld from './pages/MainWorld.js'
import SignIn from './pages/SignIn.js'
import NotFound from './pages/NotFound.js'


const router = createBrowserRouter([
  {
    path: "/PCPost",
    element: <MainWorld />,
    errorElement: <NotFound />,
    children: [
      {
        path: "signin",
        element: <SignIn />,
        errorElement: <NotFound />
      },
    ],
  },
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <RouterProvider router={router} />
);