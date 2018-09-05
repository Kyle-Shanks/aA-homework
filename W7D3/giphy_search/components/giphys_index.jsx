import React from 'react';

import GiphysIndexItem from './giphys_index_item';

const GiphysIndex = ({ giphys }) => {
  return (
    <div className="giphy-container">
      {
        giphys.map(giphy => <GiphysIndexItem giphy={giphy}/>)
      }
    </div>
  );
};

export default GiphysIndex;
