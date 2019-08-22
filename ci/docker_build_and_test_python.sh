#!/usr/bin/env bash
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.

set -e

/arrow/ci/docker_build_cpp.sh
/arrow/ci/docker_build_python.sh
pytest -v --pyargs pyarrow

tar c -f /usr/local/lib/libarrow.tar \
    /usr/local/lib/libarrow.so \
    /usr/local/lib/libarrow.so.14 \
    /usr/local/lib/libarrow.so.14.1.0 \
    /usr/local/lib/libarrow_python.so \
    /usr/local/lib/libarrow_python.so.14 \
    /usr/local/lib/libarrow_python.so.14.1.0 \
    /usr/local/lib/libparquet.so \
    /usr/local/lib/libparquet.so.14 \
    /usr/local/lib/libparquet.so.14.1.0 \
    /usr/local/lib/libplasma.so \
    /usr/local/lib/libplasma.so.14 \
    /usr/local/lib/libplasma.so.14.1.0 \
    /usr/local/lib/cmake/arrow \
    /usr/local/lib/pkgconfig/arrow-compute.pc \
    /usr/local/lib/pkgconfig/arrow-dataset.pc \
    /usr/local/lib/pkgconfig/arrow-python.pc \
    /usr/local/lib/pkgconfig/arrow.pc \
    /usr/local/lib/pkgconfig/parquet.pc \
    /usr/local/lib/pkgconfig/plasma.pc \
    /usr/local/include/arrow \
    /usr/local/include/parquet \
    /usr/local/include/plasma
