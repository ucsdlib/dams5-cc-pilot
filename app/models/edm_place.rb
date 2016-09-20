class EdmPlace < ActiveTriples::Resource
  include StoredInline

  configure type: ::RDF::Vocab::EDM.Place

  property :latitude, predicate: RDF::URI('http://www.w3.org/2003/01/geo/wgs84_pos#lat')
  property :longitude, predicate: RDF::URI('http://www.w3.org/2003/01/geo/wgs84_pos#long')
  property :altitude, predicate: RDF::URI('http://www.w3.org/2003/01/geo/wgs84_pos#alt')
  property :label, predicate: ::RDF::Vocab::SKOS.prefLabel
  property :alternate_label, predicate: ::RDF::Vocab::SKOS.altLabel
  property :note, predicate: ::RDF::Vocab::SKOS.note

end
