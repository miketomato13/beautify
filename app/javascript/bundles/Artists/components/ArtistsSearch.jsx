import React, { Component } from 'react'
import axios from 'axios'
import Search from './Search'
import Table from './Table'
import Pagination from './Pagination'


class ArtistsSearch extends Component {
  state = {
    artist: this.props.artist,
    names: '',
    id: '',
    artists: [],
    location: '',
    name: '',
    query: '',
    page: 1,
    totalPages: 1,
  }

  fetchArtist = (query, pageValue) => {
    let url = `/artists.json?` + ( query ? `location=${query.toLowerCase()}` : "") + "&" + (query ? `name=${query}` : "")+ "&" + ( pageValue ? `page=${pageValue}` : "")

      axios.get(url)
      .then(response => {
        const { artists, names, page, totalPages } = response.data
        this.setState({query, artists, names, page, totalPages });
      })
  }

  handleSearch = event => {
    event.preventDefault()
    const query = event.target.query.value
    const { page } = this.state
    this.setState({ query })
    this.fetchArtist( query, page )
  }

  changePage = page => {
    const { query } = this.state
    this.fetchArtist( query, page )
  }


  render(){
    const { query, artists, names, page, totalPages } = this.state;
    const lookup = [artists, names]
    return(
      <div>
        <Search
          query={query}
          handleSearch={this.handleSearch}
          invalid={ !!query }
        />
         {this.state.query &&
        <Table artists={lookup[artists.length ? 0 : 1]} />}
         {this.state.query &&
        <Pagination
          page={page}
          totalPages={totalPages}
          changePage={this.changePage}
        />}
      </div>
    )
  }

  componentDidMount(){
    const { artist, id, page } = this.state
    this.fetchArtist('' , page)
  }
}

export default ArtistsSearch
