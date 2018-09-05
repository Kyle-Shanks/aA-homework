import React from 'react';

const GiphysIndexItem = ({ giphy }) => {
  return (
    <img src={giphy.images.original.url} />
  );
};

export default GiphysIndexItem;
