import React from "react";
import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import { Navbar } from "./components/navbar";
import "./App.css";
import { Shop } from "./pages/Shop/Shop.jsx";
//import { Contact } from "./pages/contact";
import { Cart } from "./pages/Cart/Cart.jsx";
import { ShopContextProvider } from "./context/shop-context.jsx";

function App(){
   return (
   <div className="App">
    <ShopContextProvider>
   <Router>
     <Navbar />
     <Routes>
     <Route path="/" element={<Shop />} />

      <Route path="/cart" element={<Cart />} />
     </Routes>
   </Router>
   </ShopContextProvider>
   </div> 
   ) 
}
export default App;