import React from 'react';
import logo from './logo.svg';
import './App.css';

function App() {
  /* When we edit a file locally, it does not get reflected in the container. So we need to fix if we are going to
  create a development environment with a Docker container. */
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Edit <code>src/App.js</code> and save to. Hi there.
        </p>
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
