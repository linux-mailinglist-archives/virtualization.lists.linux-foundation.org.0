Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id CCDC522740
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:22:26 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D9F709EE;
	Sun, 19 May 2019 16:17:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 17071D8F
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 15:36:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 56561831
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 15:36:14 +0000 (UTC)
Received: from pps.filterd (m0098420.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4AFVbFZ067566 for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 11:36:13 -0400
Received: from e06smtp01.uk.ibm.com (e06smtp01.uk.ibm.com [195.75.94.97])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2sdc1605qw-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 11:36:12 -0400
Received: from localhost
	by e06smtp01.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pmorel@linux.ibm.com>; Fri, 10 May 2019 16:36:11 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp01.uk.ibm.com (192.168.101.131) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Fri, 10 May 2019 16:36:08 +0100
Received: from d06av21.portsmouth.uk.ibm.com (d06av21.portsmouth.uk.ibm.com
	[9.149.105.232])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4AFa64H54198464
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 10 May 2019 15:36:06 GMT
Received: from d06av21.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BDC5D5207D;
	Fri, 10 May 2019 15:36:06 +0000 (GMT)
Received: from [9.145.187.238] (unknown [9.145.187.238])
	by d06av21.portsmouth.uk.ibm.com (Postfix) with ESMTP id 0A2BB52063;
	Fri, 10 May 2019 15:36:06 +0000 (GMT)
Subject: Re: [PATCH 08/10] virtio/s390: add indirection to indicators access
To: Halil Pasic <pasic@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-9-pasic@linux.ibm.com>
	<716d47ca-016f-e8f4-6d78-7746a7d9f6ba@linux.ibm.com>
	<a4bf1976-8037-63bb-2cf6-c389edbd2e89@linux.ibm.com>
	<20190509202600.4fd6aebe.pasic@linux.ibm.com>
	<c1e03cf0-3773-de00-10ae-d092ffe7ccc5@linux.ibm.com>
	<20190510135421.5363f14a.pasic@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Date: Fri, 10 May 2019 17:36:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190510135421.5363f14a.pasic@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051015-4275-0000-0000-00000333765B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051015-4276-0000-0000-00003842ED6D
Message-Id: <89074bc5-78ee-a2e3-0546-791a465f83bd@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905100106
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
	Farhan Ali <alifm@linux.ibm.com>,
	Viktor Mihajlovski <mihajlov@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>,
	<mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Reply-To: pmorel@linux.ibm.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gMTAvMDUvMjAxOSAxMzo1NCwgSGFsaWwgUGFzaWMgd3JvdGU6Cj4gT24gRnJpLCAxMCBNYXkg
MjAxOSAwOTo0MzowOCArMDIwMAo+IFBpZXJyZSBNb3JlbCA8cG1vcmVsQGxpbnV4LmlibS5jb20+
IHdyb3RlOgo+IAo+PiBPbiAwOS8wNS8yMDE5IDIwOjI2LCBIYWxpbCBQYXNpYyB3cm90ZToKPj4+
IE9uIFRodSwgOSBNYXkgMjAxOSAxNDowMTowMSArMDIwMAo+Pj4gUGllcnJlIE1vcmVsIDxwbW9y
ZWxAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4+Pgo+Pj4+IE9uIDA4LzA1LzIwMTkgMTY6MzEsIFBp
ZXJyZSBNb3JlbCB3cm90ZToKPj4+Pj4gT24gMjYvMDQvMjAxOSAyMDozMiwgSGFsaWwgUGFzaWMg
d3JvdGU6Cj4+Pj4+PiBUaGlzIHdpbGwgY29tZSBpbiBoYW5keSBzb29uIHdoZW4gd2UgcHVsbCBv
dXQgdGhlIGluZGljYXRvcnMgZnJvbQo+Pj4+Pj4gdmlydGlvX2Njd19kZXZpY2UgdG8gYSBtZW1v
cnkgYXJlYSB0aGF0IGlzIHNoYXJlZCB3aXRoIHRoZSBoeXBlcnZpc29yCj4+Pj4+PiAoaW4gcGFy
dGljdWxhciBmb3IgcHJvdGVjdGVkIHZpcnR1YWxpemF0aW9uIGd1ZXN0cykuCj4+Pj4+Pgo+Pj4+
Pj4gU2lnbmVkLW9mZi1ieTogSGFsaWwgUGFzaWMgPHBhc2ljQGxpbnV4LmlibS5jb20+Cj4+Pj4+
PiAtLS0KPj4+Pj4+ICAgwqAgZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMgfCA0MAo+
Pj4+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+Pj4+Pj4gICDC
oCAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4+Pj4+
Pgo+Pj4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4+
Pj4+PiBiL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4+Pj4+PiBpbmRleCBiYjdh
OTIzMTZmYzguLjFmM2U3ZDU2OTI0ZiAxMDA2NDQKPj4+Pj4+IC0tLSBhL2RyaXZlcnMvczM5MC92
aXJ0aW8vdmlydGlvX2Njdy5jCj4+Pj4+PiArKysgYi9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRp
b19jY3cuYwo+Pj4+Pj4gQEAgLTY4LDYgKzY4LDE2IEBAIHN0cnVjdCB2aXJ0aW9fY2N3X2Rldmlj
ZSB7Cj4+Pj4+PiAgIMKgwqDCoMKgwqAgdm9pZCAqYWlycV9pbmZvOwo+Pj4+Pj4gICDCoCB9Owo+
Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyAqaW5kaWNhdG9ycyhzdHJ1Y3Qgdmly
dGlvX2Njd19kZXZpY2UgKnZjZGV2KQo+Pj4+Pj4gK3sKPj4+Pj4+ICvCoMKgwqAgcmV0dXJuICZ2
Y2Rldi0+aW5kaWNhdG9yczsKPj4+Pj4+ICt9Cj4+Pj4+PiArCj4+Pj4+PiArc3RhdGljIGlubGlu
ZSB1bnNpZ25lZCBsb25nICppbmRpY2F0b3JzMihzdHJ1Y3QgdmlydGlvX2Njd19kZXZpY2UKPj4+
Pj4+ICp2Y2RldikKPj4+Pj4+ICt7Cj4+Pj4+PiArwqDCoMKgIHJldHVybiAmdmNkZXYtPmluZGlj
YXRvcnMyOwo+Pj4+Pj4gK30KPj4+Pj4+ICsKPj4+Pj4+ICAgwqAgc3RydWN0IHZxX2luZm9fYmxv
Y2tfbGVnYWN5IHsKPj4+Pj4+ICAgwqDCoMKgwqDCoCBfX3U2NCBxdWV1ZTsKPj4+Pj4+ICAgwqDC
oMKgwqDCoCBfX3UzMiBhbGlnbjsKPj4+Pj4+IEBAIC0zMzcsMTcgKzM0NywxNyBAQCBzdGF0aWMg
dm9pZCB2aXJ0aW9fY2N3X2Ryb3BfaW5kaWNhdG9yKHN0cnVjdAo+Pj4+Pj4gdmlydGlvX2Njd19k
ZXZpY2UgKnZjZGV2LAo+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgY2N3LT5jZGEgPSAoX191
MzIpKHVuc2lnbmVkIGxvbmcpIHRoaW5pbnRfYXJlYTsKPj4+Pj4+ICAgwqDCoMKgwqDCoCB9IGVs
c2Ugewo+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgLyogcGF5bG9hZCBpcyB0aGUgYWRkcmVz
cyBvZiB0aGUgaW5kaWNhdG9ycyAqLwo+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKgIGluZGljYXRvcnAg
PSBrbWFsbG9jKHNpemVvZigmdmNkZXYtPmluZGljYXRvcnMpLAo+Pj4+Pj4gK8KgwqDCoMKgwqDC
oMKgIGluZGljYXRvcnAgPSBrbWFsbG9jKHNpemVvZihpbmRpY2F0b3JzKHZjZGV2KSksCj4+Pj4+
PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9ETUEg
fCBHRlBfS0VSTkVMKTsKPj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghaW5kaWNhdG9y
cCkKPj4+Pj4+ICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4+Pj4gICDC
oMKgwqDCoMKgwqDCoMKgwqAgKmluZGljYXRvcnAgPSAwOwo+Pj4+Pj4gICDCoMKgwqDCoMKgwqDC
oMKgwqAgY2N3LT5jbWRfY29kZSA9IENDV19DTURfU0VUX0lORDsKPj4+Pj4+IC3CoMKgwqDCoMKg
wqDCoCBjY3ctPmNvdW50ID0gc2l6ZW9mKCZ2Y2Rldi0+aW5kaWNhdG9ycyk7Cj4+Pj4+PiArwqDC
oMKgwqDCoMKgwqAgY2N3LT5jb3VudCA9IHNpemVvZihpbmRpY2F0b3JzKHZjZGV2KSk7Cj4+Pj4+
Cj4+Pj4+IFRoaXMgbG9va3Mgc3RyYW5nZSB0byBtZS4gV2FzIGFscmVhZHkgd2VpcmQgYmVmb3Jl
Lgo+Pj4+PiBMdWNreSB3ZSBhcmUgaW5kaWNhdG9ycyBhcmUgbG9uZy4uLgo+Pj4+PiBtYXkgYmUg
anVzdCBzaXplb2YobG9uZykKPj4+Pgo+Pj4KPj4+IEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQg
d2hlcmUgYXJlIHlvdSBjb21pbmcgZnJvbS4uLgo+Pj4KPj4+IFdpdGggQ0NXX0NNRF9TRVRfSU5E
IHdlIHRlbGwgdGhlIGh5cGVydmlzb3IgdGhlIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MKPj4+IGF0
IHdoaWNoIHRoZSBzbyBjYWxsZWQgY2xhc3NpYyBpbmRpY2F0b3JzLiBUaGVyZSBpcyBhIGNvbW1l
bnQgdGhhdAo+Pj4gbWFrZXMgdGhpcyBvYnZpb3VzLiBUaGUgYXJndW1lbnQgb2YgdGhlIHNpemVv
ZiB3YXMgYW5kIHJlbWFpbmVkIGEKPj4+IHBvaW50ZXIgdHlwZS4gQUZBSVUgdGhpcyBpcyB3aGF0
IGJvdGhlcnMgeW91Lgo+Pj4+Cj4+Pj4gQUZBSUsgdGhlIHNpemUgb2YgdGhlIGluZGljYXRvcnMg
KEFJVi9BSVMpIGlzIG5vdCByZXN0cmljdGVkIGJ5IHRoZQo+Pj4+IGFyY2hpdGVjdHVyZS4KPj4+
Cj4+PiBUaGUgc2l6ZSBvZiB2Y2Rldi0+aW5kaWNhdG9ycyBpcyByZXN0cmljdGVkIG9yIGRlZmlu
ZWQgYnkgdGhlIHZpcnRpbwo+Pj4gc3BlY2lmaWNhdGlvbi4gUGxlYXNlIGhhdmUgYSBsb29rIGF0
ICc0LjMuMi42LjEgU2V0dGluZyBVcCBDbGFzc2ljIFF1ZXVlCj4+PiBJbmRpY2F0b3JzJyBoZXJl
Ogo+Pj4gaHR0cHM6Ly9kb2NzLm9hc2lzLW9wZW4ub3JnL3ZpcnRpby92aXJ0aW8vdjEuMS9jczAx
L3ZpcnRpby12MS4xLWNzMDEuaHRtbCN4MS0xNjMwMDAyCj4+Pgo+Pj4gU2luY2Ugd2l0aCBMaW51
eCBvbiBzMzkwIG9ubHkgNjQgYml0IGlzIHN1cHBvcnRlZCwgYm90aCB0aGUgc2l6ZXMgYXJlIGlu
Cj4+PiBsaW5lIHdpdGggdGhlIHNwZWNpZmljYXRpb24uIFVzaW5nIHU2NCB3b3VsZCBzZW1hbnRp
Y2FsbHkgbWF0Y2ggdGhlIHNwZWMKPj4+IGJldHRlciwgbW9kdWxvIHByZSB2aXJ0aW8gMS4wIHdo
aWNoIGFpbid0IHNwZWNpZmllZC4gSSBkaWQgbm90IHdhbnQgdG8KPj4+IGRvIGNoYW5nZXMgdGhh
dCBhcmUgbm90IG5lY2Vzc2FyeSBmb3Igd2hhdCBJJ20gdHJ5aW5nIHRvIGFjY29tcGxpc2guIElm
Cj4+PiB3ZSB3YW50IHdlIGNhbiBjaGFuZ2UgdGhlc2UgdG8gdTY0IHdpdGggYSBwYXRjaCBvbiB0
b3AuCj4+Cj4+IEkgbWVhbiB5b3UgYXJlIGNoYW5naW5nIHRoZXNlIGxpbmUgYWxyZWFkeSwgc28g
d2h5IG5vdCBkb2luZyBpdCByaWdodAo+PiB3aGlsZSBhdCBpdD8KPj4KPiAKPiBUaGlzIHBhdGNo
IGlzIGFib3V0IGFkZGluZyB0aGUgaW5kaXJlY3Rpb24gc28gd2UgY2FuIG1vdmUgdGhlIG1lbWJl
cgo+IHBhaW5sZXNzbHkuIE1peGluZyBpbiBkaWZmZXJlbnQgc3R1ZmYgd291bGQgYmUgYSBiYWQg
cHJhY3RpY2UuCj4gCj4gQlRXIEkganVzdCBleHBsYWluZWQgdGhhdCBpdCBhaW4ndCB3cm9uZywg
c28gSSByZWFsbHkgZG8gbm90IHVuZGVyc3RhbmQKPiB3aGF0IGRvIHlvdSBtZWFuIGJ5ICAnd2h5
IG5vdCBkb2luZyBpdCByaWdodCcuIENhbiB5b3UgcGxlYXNlIGV4cGxhaW4/Cj4gCgpJIGRpZCBu
b3Qgd2FudGVkIHRvIGRpc2N1c3MgYSBsb25nIHRpbWUgb24gdGhpcyBhbmQgZ2F2ZSBteSBSLUIs
IHNvIAptZWFuaW5nIHRoYXQgSSBhbSBPSyB3aXRoIHRoaXMgcGF0Y2guCgpCdXQgaWYgeW91IGFz
aywgeWVzIEkgY2FuLCBpdCBzZWVtcyBxdWl0ZSBvYnZpb3VzLgpXaGVuIHlvdSBidWlsZCBhIEND
VyB5b3UgZ2l2ZSB0aGUgcG9pbnRlciB0byBDQ1ctPmNkYSBhbmQgeW91IGdpdmUgdGhlIApzaXpl
IG9mIHRoZSB0cmFuc2ZlciBpbiBDQ1ctPmNvdW50LgoKSGVyZSB0aGUgY291bnQgaXMgaW5pdGlh
bGl6ZWQgd2l0aCB0aGUgc2l6ZW9mIG9mIHRoZSBwb2ludGVyIHVzZWQgdG8gCmluaXRpYWxpemUg
Q0NXLT5jZGEgd2l0aC4KTHVraWx5IHdlIHdvcmsgb24gYSA2NCBiaXRzIG1hY2hpbmUgd2l0aCA2
NCBiaXRzIHBvaW50ZXJzIGFuZCB0aGUgc2l6ZSAKb2YgdGhlIHBvaW50ZWQgb2JqZWN0IGlzIDY0
IGJpdHMgd2lkZSBzby4uLiB0aGUgcmVzdWx0aW5nIGNvdW50IGlzIHJpZ2h0LgpCdXQgaXQgaXMg
bm90IHRoZSBjb3JyZWN0IHdheSB0byBkbyBpdC4KVGhhdCBpcyBhbGwuIE5vdCBhIGJpZyBjb25j
ZXJuLCB5b3UgZG8gbm90IG5lZWQgdG8gY2hhbmdlIGl0LCBhcyB5b3UgCnNhaWQgaXQgY2FuIGJl
IGRvbmUgaW4gYW5vdGhlciBwYXRjaC4KCj4gRGlkIHlvdSBhZ3JlZSB3aXRoIHRoZSByZXN0IG9m
IG15IGNvbW1lbnQ/IEkgbWVhbiB0aGVyZSB3YXMgbW9yZSB0byBpdC4KPiAKCkkgdW5kZXJzdG9v
ZCBmcm9tIHlvdXIgY29tbWVudHMgdGhhdCB0aGUgaW5kaWNhdG9ycyBpbiBMaW51eCBhcmUgNjRi
aXRzIAp3aWRlIHNvIGFsbCBPSy4KClJlZ2FyZHMKUGllcnJlCgoKCgoKCi0tIApQaWVycmUgTW9y
ZWwKTGludXgvS1ZNL1FFTVUgaW4gQsO2YmxpbmdlbiAtIEdlcm1hbnkKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcg
bGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xp
c3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
