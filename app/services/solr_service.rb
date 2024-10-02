class SolrService
    def self.search(query)
      rsolr = RSolr.connect url: 'http://localhost:8983/solr/books'
      response = rsolr.get 'select', params: { q: query }
      response['response']['docs']
    end
  end
  