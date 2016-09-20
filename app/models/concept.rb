# Concept is a class of skos:Concept
# See:  http://www.w3.org/2004/02/skos/core#
class Concept < ActiveFedora::Base
   extend ActiveTriples::Configurable

  configure type: ::RDF::Vocab::SKOS.Concept

  property :label, predicate: ::RDF::Vocab::SKOS.prefLabel
  property :alternate_label, predicate: ::RDF::Vocab::SKOS.altLabel

end
