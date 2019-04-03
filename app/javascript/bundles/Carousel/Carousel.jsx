import React, { Component } from 'react';
import axios from 'axios'
import Carousel from 'nuka-carousel';


class ListingCarousel extends Component {
  state = { listings: this.props.listing_images || [], slideIndex: 0 }
  componentDidMount() {
    setTimeout(() => {
      window.dispatchEvent(new Event('resize'));
    }, 0);
  }

  render() {
    const { listings } = this.state
    return (
      <div id="carousel">
        {!!listings.length &&
          <Carousel

            slideIndex={this.state.slideIndex}
            afterSlide={slideIndex => this.setState({ slideIndex })}
          >
            {listings.map(listing => <img key= "image" src={listing} alt='foo' />)}

          </Carousel>
        }
      </div>
    )
  }
}

export default ListingCarousel;
