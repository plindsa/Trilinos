// Copyright 2002 - 2008, 2010, 2011 National Technology Engineering
// Solutions of Sandia, LLC (NTESS). Under the terms of Contract
// DE-NA0003525 with NTESS, the U.S. Government retains certain rights
// in this software.
//
// Redistribution and use in source and binary forms, with or without
// modification, are permitted provided that the following conditions are
// met:
// 
//     * Redistributions of source code must retain the above copyright
//       notice, this list of conditions and the following disclaimer.
// 
//     * Redistributions in binary form must reproduce the above
//       copyright notice, this list of conditions and the following
//       disclaimer in the documentation and/or other materials provided
//       with the distribution.
// 
//     * Neither the name of NTESS nor the names of its contributors
//       may be used to endorse or promote products derived from this
//       software without specific prior written permission.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
// A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
// OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
// SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
// LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
// DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
// THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
// (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
// OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
// 

#include <gtest/gtest.h>                // for AssertHelper, EXPECT_EQ, etc
#include <stk_mesh/base/BulkData.hpp>   // for BulkData
#include <stk_mesh/base/MeshBuilder.hpp>
#include <stk_mesh/base/CoordinateSystems.hpp>  // for Cartesian, etc
#include <stk_mesh/base/FEMHelpers.hpp>  // for declare_element
#include <stk_mesh/base/Field.hpp>      // for Field
#include <stk_mesh/base/MetaData.hpp>   // for MetaData, put_field, etc
#include "stk_mesh/base/Entity.hpp"     // for Entity
#include "stk_mesh/base/FieldBase.hpp"  // for field_scalars_per_entity, etc
#include "stk_mesh/base/Types.hpp"      // for EntityId
#include "stk_topology/topology.hpp"    // for topology, etc
#include "stk_io/IossBridge.hpp"
namespace stk { namespace mesh { class Part; } }

namespace {

//BEGINUseAdvancedFields
TEST(stkMeshHowTo, useAdvancedFields)
{
  const unsigned spatialDimension = 3;
  stk::mesh::MeshBuilder builder(MPI_COMM_WORLD);
  builder.set_spatial_dimension(spatialDimension);
  builder.set_entity_rank_names(stk::mesh::entity_rank_names());
  std::shared_ptr<stk::mesh::BulkData> bulkPtr = builder.create();
  bulkPtr->mesh_meta_data().use_simple_fields();
  stk::mesh::MetaData& metaData = bulkPtr->mesh_meta_data();

  typedef stk::mesh::Field<double> DoubleField;
  DoubleField& tensorField = metaData.declare_field<double>(stk::topology::ELEM_RANK, "tensor");
  DoubleField& variableSizeField = metaData.declare_field<double>(stk::topology::ELEM_RANK, "variableSizeField");

  stk::mesh::Part &tetPart = metaData.declare_part_with_topology("tetElementPart", stk::topology::TET_4);
  stk::mesh::Part &hexPart = metaData.declare_part_with_topology("hexElementPart", stk::topology::HEX_8);

  double initialTensorValue[] = {1, 2, 3, 4, 5, 6, 7, 8, 9};
  stk::mesh::put_field_on_mesh(tensorField, metaData.universal_part(), 9, initialTensorValue);
  stk::io::set_field_output_type(tensorField, "Full_Tensor_36");

  double initialVectorValue[] = {1, 2, 3, 4, 5, 6, 7, 8};
  const unsigned nodesPerTet = 4;
  stk::mesh::put_field_on_mesh(variableSizeField, tetPart, nodesPerTet, initialVectorValue);
  const unsigned nodesPerHex = 8;
  stk::mesh::put_field_on_mesh(variableSizeField, hexPart, nodesPerHex, initialVectorValue);

  metaData.commit();
  stk::mesh::BulkData& mesh = *bulkPtr;
  mesh.modification_begin();
  stk::mesh::EntityId tetId = 1;
  stk::mesh::EntityIdVector tetNodes {1, 2, 3, 4};
  stk::mesh::Entity tetElem=stk::mesh::declare_element(mesh, tetPart, tetId, tetNodes);
  stk::mesh::EntityId hexId = 2;
  stk::mesh::EntityIdVector hexNodes {5, 6, 7, 8, 9, 10, 11, 12};
  stk::mesh::Entity hexElem=stk::mesh::declare_element(mesh, hexPart, hexId, hexNodes);
  mesh.modification_end();

  const unsigned tensor_scalars_per_hex = stk::mesh::field_scalars_per_entity(tensorField, hexElem);
  const unsigned tensor_scalars_per_tet = stk::mesh::field_scalars_per_entity(tensorField, tetElem);

  EXPECT_EQ(tensor_scalars_per_hex, tensor_scalars_per_tet);
  const unsigned tensor_enum_size = stk::mesh::FullTensor36::Size;
  EXPECT_EQ(tensor_scalars_per_hex, tensor_enum_size);

  double* tensorData = stk::mesh::field_data(tensorField, hexElem);
  for(unsigned i=0; i<tensor_scalars_per_hex; i++)
  {
    EXPECT_EQ(initialTensorValue[i], tensorData[i]);
  }

  const unsigned scalars_per_tet = stk::mesh::field_scalars_per_entity(variableSizeField, tetElem);
  EXPECT_EQ(nodesPerTet, scalars_per_tet);

  const unsigned scalars_per_hex = stk::mesh::field_scalars_per_entity(variableSizeField, hexElem);
  EXPECT_EQ(nodesPerHex, scalars_per_hex);

  double* vectorHexData = stk::mesh::field_data(variableSizeField, hexElem);
  for(unsigned i=0; i<scalars_per_hex; i++)
  {
    EXPECT_EQ(initialVectorValue[i], vectorHexData[i]);
  }

  double* vectorTetData = stk::mesh::field_data(variableSizeField, tetElem);
  for(unsigned i=0; i<scalars_per_tet; i++)
  {
    EXPECT_EQ(initialVectorValue[i], vectorTetData[i]);
  }
}
//ENDUseAdvancedFields

}
