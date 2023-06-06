# ArtBase_Gallery_Database_Management
artDB is a comprehensive art gallery management system designed to efficiently organize, retrieve, and analyze fictional art-related data. 
It incorporates an intelligently designed Entity-Relationship Diagram (ERD), relational schema, and tables for optimal data organization. 
The system offers a user-friendly interface and provides SQL and Neo4j queries to seamlessly retrieve and analyze the fictional art data. 
artDB enables users to practice managing artwork details, classifying artworks into art groups, overseeing gallery information, and tracking inventory using simulated data.
Please note that the data used within the system is entirely fictional and is intended solely for the purpose of practicing database creation and querying skills. 
Below is the entity relational diagram that was formed. 

### Entity Relationsip Diagram

The art gallery management system comprises four main entities: Artist, Artwork, Artgroup, and Customer. 
The Artist entity represents the creators of the artwork and contains information such as their ID, name, biography, and contact details. 
The Artwork entity represents individual pieces of art within the gallery and includes attributes like artwork ID, title, medium, dimensions, price, and creation date. 
The Artgroup entity represents the groups or categories to which artworks can be classified, with attributes such as group ID, group name, and description. 
Finally, the Customer entity represents individuals or entities interested in purchasing artwork, containing attributes like customer ID, name, contact information, 
purchase history, and preferences. Together, these entities provide a foundation for efficient organization and management of artists, artworks, art groups, 
and customers within the art gallery management system. The ERD is shown below. 

![image](https://github.com/noshiobec/ArtBase_Gallery_Database_Management/assets/96450822/740006d3-7e24-450d-837a-4f2c7fd0859d)



### The Relational Schema

In order to convert the entity relational diagram to relational schema, the following steps were taken as shown below:

#### Step 1: Convert the regular entities to relations to depict all simple attributes.
Artist (artist_name, birthplace, age, art_style)
Artwork (title, art_type, price, year_created, artist_name)
Customer (customer_id, phone_no, cname, amount_spent, country, city)
Artgroup (group_id, gname)

#### Step 2: Make a relation for each weak entity that has all of its simple attributes. Also, include foreign key properties of the relation, and the primary key attribute(s) of the owner entity.
	No weak entity is present.
  
#### Step 3: For binary one-to-one relationship, add the primary key of one relation as a foreign key in another.
	No one-to-one relationship is present.
  
#### Step 4: Transform one-to-many relationships from the N-side relation to the 1-side relation to create a foreign key reference.
	Artwork (title, art_type, price, year_created, artist_name*)
  
#### Step 5: Create a new relation for each many-to-many relationship. Add the primary keys of the relations that represent the participating entities as foreign keys and select the combination of these keys as the relation's primary key.
Cus_Likes_Group (group_id*, customer_id*)
Cus_Likes_Artist (artist_name*, customer_id*)
Classify (title*, group_id*)

#### Step 6: Create a new relation for each multivalued attribute that has a corresponding attribute and the relation's primary key, which identifies the entity or relationship that the multivalued attribute applies to.
	No multivalued attribute is present.
  
#### Step 7: Create a new relation to represent the relationship and foreign keys referencing the linked entities to convert n-ary relationships.
	No n-are relationship is present.
  
#### Step 8: For each subclass and superclass, a relation should be created. Put foreign keys in the subclass-corresponding relations.
	No subclass and superclass are present.


From the above steps, we have the following relational schemas:

•	Artist (artist_name, birthplace, age, art_style)

•	Artwork (title, art_type, price, year_created, artist_name*)

•	Customer (customer_id, phone_no, cname, amount_spent, country, city)

•	Artgroup (group_id, gname)

•	Cus_Likes_Group (group_id*, customer_id*)

•	Cus_Likes_Artist (artist_name*, customer_id*)

•	Classify (title*, group_id*)

Below is the diagrammatic representation of the relational schema


 ![image](https://github.com/noshiobec/ArtBase_Gallery_Database_Management/assets/96450822/7e3b6d63-ae3f-4fbc-a655-aabc12779d76)

### !Locate the Oracle SQL code snippets within the code session of this repository.





