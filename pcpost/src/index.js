import * as React from "react";
import * as ReactDOM from "react-dom/client";
import {
  createBrowserRouter,
  RouterProvider,
} from "react-router-dom";

import MainWorld from './pages/MainWorld.js'
import SignIn from './pages/SignIn.js'
import NewPost from './pages/NewPost'
import NotFound from './pages/NotFound.js'


const router = createBrowserRouter([
  {
    path: "/PCPost",
    element: <MainWorld />,
    errorElement: <NotFound />
  },
  {
    path: "/PCPost/SignIn",
    element: <SignIn />,
    errorElement: <NotFound />
  },
  {
    path: "/PCPost/NewPost",
    element: <NewPost />,
    errorElement: <NotFound />
  }
]);

ReactDOM.createRoot(document.getElementById("root")).render(
  <RouterProvider router={router} />
);