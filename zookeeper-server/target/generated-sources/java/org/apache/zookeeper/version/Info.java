/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package org.apache.zookeeper.version;

public interface Info {
    int MAJOR=3;
    int MINOR=10;
    int MICRO=0;
    String QUALIFIER="SNAPSHOT".isEmpty() ? null : "SNAPSHOT";
    int REVISION=-1; //@deprecated, please use REVISION_HASH
    String REVISION_HASH="7b89b78c810a1f81a318a2dd671631cab592b199-dirty";
    String BUILD_DATE="2025-08-13 01:18 UTC";
}
