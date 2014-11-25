# Copyright (c) 2014 The MITRE Corporation
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without modification, 
# are permitted provided that the following conditions are met:
# 
#     * Redistributions of source code must retain the above copyright notice, this 
#       list of conditions and the following disclaimer.
#     * Redistributions in binary form must reproduce the above copyright notice, 
#       this list of conditions and the following disclaimer in the documentation 
#       and/or other materials provided with the distribution.
#     * Neither the name of HL7 nor the names of its contributors may be used to 
#       endorse or promote products derived from this software without specific 
#       prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED 
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. 
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, 
# INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT 
# NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR 
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, 
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) 
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE 
# POSSIBILITY OF SUCH DAMAGE.
###*
@namespacing scoping into the FHIR namespace
###
require './core'
require './element'
require './resource'

###* 
 Embedded class
@class OtherElementComponent
@exports  OtherElementComponent as OtherElementComponent
###
class OtherElementComponent extends Element
  constructor: (@json) ->
    super(@json)
  ###*
  A reference to a specific concept that holds a coded value. This can be an element in a FHIR resource, or a specific reference to a data element in a different specification (e.g. v2) or a general reference to a kind of data field, or a reference to a value set with an appropriately narrow definition.
  @returns {Array} an array of {@link String} objects
  ###
  element:-> @json['element']
  
  ###*
  Code System (if necessary).
  @returns {Array} an array of {@link String} objects
  ###
  codeSystem:-> @json['codeSystem']
  
  ###*
  Value of the referenced element.
  @returns {Array} an array of {@link String} objects
  ###
  code:-> @json['code']
  

###* 
 Embedded class
@class ConceptMapElementMapComponent
@exports  ConceptMapElementMapComponent as ConceptMapElementMapComponent
###
class ConceptMapElementMapComponent extends Element
  constructor: (@json) ->
    super(@json)
  ###*
  System of the target (if necessary).
  @returns {Array} an array of {@link String} objects
  ###
  codeSystem:-> @json['codeSystem']
  
  ###*
  Code that identifies the target element.
  @returns {Array} an array of {@link String} objects
  ###
  code:-> @json['code']
  
  ###*
  equal | equivalent | wider | subsumes | narrower | specialises | inexact | unmatched | disjoint.
  @returns {Array} an array of {@link String} objects
  ###
  equivalence:-> @json['equivalence']
  
  ###*
  Description of status/issues in mapping.
  @returns {Array} an array of {@link String} objects
  ###
  comments:-> @json['comments']
  
  ###*
  A set of additional outcomes from this mapping to other elements. To properly execute this mapping, the specified element must be mapped to some data element or source that is in context. The mapping may still be useful without a place for the additional data elements, but the equivalence cannot be relied on.
  @returns {Array} an array of {@link OtherElementComponent} objects
  ###
  product: ->
    if @json['product']
      for item in @json['product']
        new OtherElementComponent(item)
  

###* 
 Embedded class
@class ConceptMapElementComponent
@exports  ConceptMapElementComponent as ConceptMapElementComponent
###
class ConceptMapElementComponent extends Element
  constructor: (@json) ->
    super(@json)
  ###*
  Code System (if value set crosses code systems).
  @returns {Array} an array of {@link String} objects
  ###
  codeSystem:-> @json['codeSystem']
  
  ###*
  Identifies element being mapped.
  @returns {Array} an array of {@link String} objects
  ###
  code:-> @json['code']
  
  ###*
  A set of additional dependencies for this mapping to hold. This mapping is only applicable if the specified element can be resolved, and it has the specified value.
  @returns {Array} an array of {@link OtherElementComponent} objects
  ###
  dependsOn: ->
    if @json['dependsOn']
      for item in @json['dependsOn']
        new OtherElementComponent(item)
  
  ###*
  A concept from the target value set that this concept maps to.
  @returns {Array} an array of {@link ConceptMapElementMapComponent} objects
  ###
  map: ->
    if @json['map']
      for item in @json['map']
        new ConceptMapElementMapComponent(item)
  
###*
A statement of relationships from one set of concepts to one or more other concepts - either code systems or data elements, or classes in class models.
@class ConceptMap
@exports ConceptMap as ConceptMap
###
class ConceptMap extends  Resource
  constructor: (@json) ->
    super(@json)
  ###*
  The identifier that is used to identify this concept map when it is referenced in a specification, model, design or an instance (should be globally unique OID, UUID, or URI).
  @returns {Array} an array of {@link String} objects
  ###
  identifier:-> @json['identifier']
  
  ###*
  The identifier that is used to identify this version of the concept map when it is referenced in a specification, model, design or instance. This is an arbitrary value managed by the profile author manually and the value should be a timestamp.
  @returns {Array} an array of {@link String} objects
  ###
  version:-> @json['version']
  
  ###*
  A free text natural language name describing the concept map.
  @returns {Array} an array of {@link String} objects
  ###
  name:-> @json['name']
  
  ###*
  The name of the individual or organization that published the concept map.
  @returns {Array} an array of {@link String} objects
  ###
  publisher:-> @json['publisher']
  
  ###*
  Contacts of the publisher to assist a user in finding and communicating with the publisher.
  @returns {Array} an array of {@link ContactPoint} objects
  ###
  telecom: ->
    if @json['telecom']
      for item in @json['telecom']
        new ContactPoint(item)
  
  ###*
  A free text natural language description of the use of the concept map - reason for definition, conditions of use, etc.
  @returns {Array} an array of {@link String} objects
  ###
  description:-> @json['description']
  
  ###*
  A copyright statement relating to the concept map and/or its contents.
  @returns {Array} an array of {@link String} objects
  ###
  copyright:-> @json['copyright']
  
  ###*
  The status of the concept map.
  @returns {Array} an array of {@link String} objects
  ###
  status:-> @json['status']
  
  ###*
  This ConceptMap was authored for testing purposes (or education/evaluation/marketing), and is not intended to be used for genuine usage.
  @returns {Array} an array of {@link boolean} objects
  ###
  experimental:-> @json['experimental']
  
  ###*
  The date that the concept map status was last changed.
  @returns {Date}
  ###
  date: -> if @json['date'] then new Date(@json['date'])
  
  ###*
  The source value set that specifies the concepts that are being mapped.
  @returns {Array} an array of {@link String} objects
  ###
  sourceUri:-> @json['sourceUri']
  ###*
  The source value set that specifies the concepts that are being mapped.
  @returns {Reference}
  ###
  sourceReference: -> if @json['sourceReference'] then new Reference(@json['sourceReference'])
  
  ###*
  The target value set provides context to the mappings. Note that the mapping is made between concepts, not between value sets, but the value set provides important context about how the concept mapping choices are made.
  @returns {Array} an array of {@link String} objects
  ###
  targetUri:-> @json['targetUri']
  ###*
  The target value set provides context to the mappings. Note that the mapping is made between concepts, not between value sets, but the value set provides important context about how the concept mapping choices are made.
  @returns {Reference}
  ###
  targetReference: -> if @json['targetReference'] then new Reference(@json['targetReference'])
  
  ###*
  Mappings for a concept from the source set.
  @returns {Array} an array of {@link ConceptMapElementComponent} objects
  ###
  element: ->
    if @json['element']
      for item in @json['element']
        new ConceptMapElementComponent(item)
  



module.exports.ConceptMap = ConceptMap
