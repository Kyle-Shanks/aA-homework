import React from 'react';
import ReactDOM from 'react-dom';
import configureStore from './store/store';

import Root from './components/root';

// const addLoggingToDispatch = (store) => {
//   const disp = store.dispatch;
//   return (action) => {
//     console.log(store.getState())
//     console.log(action)
//     disp(action);
//     console.log(store.getState())
//   };
// };

// const addLoggingToDispatch = store => next => action => {
//   console.log(store.getState());
//   console.log(action);
//
//   let result = next(action);
//   console.log(store.getState());
//
//   return result;
// };
//
// const applyMiddlewares = (store, middlewares) => {
//   let dispatch = store.dispatch;
//   middlewares.forEach(mw => dispatch = mw(store)(dispatch));
//   return Object.assign({}, store, { dispatch });
// };

document.addEventListener('DOMContentLoaded', () => {
  const preloadedState = localStorage.state ?
    JSON.parse(localStorage.state) : {};
  let store = configureStore(preloadedState);

  // store = applyMiddlewares(store, [addLoggingToDispatch]);

  // store.dispatch = addLoggingToDispatch(store);

  const root = document.getElementById('content');
  ReactDOM.render(<Root store={store} />, root);
});
