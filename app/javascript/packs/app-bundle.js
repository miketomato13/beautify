import ReactOnRails from 'react-on-rails';
import Listings from '../bundles/Listings/components/Listings';
import ArtistsSearch from '../bundles/Artists/components/ArtistsSearch';
import ListingCarousel from '../bundles/Carousel/Carousel';
import 'babel-polyfill'

// This is how react_on_rails can see the Tasks in the browser.
ReactOnRails.register({
  Listings,
  ListingCarousel,
  ArtistsSearch,
});
