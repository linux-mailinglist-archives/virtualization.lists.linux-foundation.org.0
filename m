Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id C4A6C2273E
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:21:59 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2A6A2B4B;
	Sun, 19 May 2019 16:17:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id C6ED29D
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 07:43:18 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 55CBC1FB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 07:43:18 +0000 (UTC)
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4A7fn4h144896 for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 03:43:17 -0400
Received: from e06smtp03.uk.ibm.com (e06smtp03.uk.ibm.com [195.75.94.99])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sd41cam7h-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 03:43:17 -0400
Received: from localhost
	by e06smtp03.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pmorel@linux.ibm.com>; Fri, 10 May 2019 08:43:14 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp03.uk.ibm.com (192.168.101.133) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Fri, 10 May 2019 08:43:12 +0100
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
	[9.149.105.59])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4A7hAWu53870668
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 10 May 2019 07:43:10 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 56B8AA4051;
	Fri, 10 May 2019 07:43:10 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2E97EA404D;
	Fri, 10 May 2019 07:43:09 +0000 (GMT)
Received: from [9.145.187.238] (unknown [9.145.187.238])
	by d06av23.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 10 May 2019 07:43:09 +0000 (GMT)
Subject: Re: [PATCH 08/10] virtio/s390: add indirection to indicators access
To: Halil Pasic <pasic@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-9-pasic@linux.ibm.com>
	<716d47ca-016f-e8f4-6d78-7746a7d9f6ba@linux.ibm.com>
	<a4bf1976-8037-63bb-2cf6-c389edbd2e89@linux.ibm.com>
	<20190509202600.4fd6aebe.pasic@linux.ibm.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Date: Fri, 10 May 2019 09:43:08 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509202600.4fd6aebe.pasic@linux.ibm.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051007-0012-0000-0000-0000031A3975
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051007-0013-0000-0000-00002152C30D
Message-Id: <c1e03cf0-3773-de00-10ae-d092ffe7ccc5@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905100054
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

T24gMDkvMDUvMjAxOSAyMDoyNiwgSGFsaWwgUGFzaWMgd3JvdGU6Cj4gT24gVGh1LCA5IE1heSAy
MDE5IDE0OjAxOjAxICswMjAwCj4gUGllcnJlIE1vcmVsIDxwbW9yZWxAbGludXguaWJtLmNvbT4g
d3JvdGU6Cj4gCj4+IE9uIDA4LzA1LzIwMTkgMTY6MzEsIFBpZXJyZSBNb3JlbCB3cm90ZToKPj4+
IE9uIDI2LzA0LzIwMTkgMjA6MzIsIEhhbGlsIFBhc2ljIHdyb3RlOgo+Pj4+IFRoaXMgd2lsbCBj
b21lIGluIGhhbmR5IHNvb24gd2hlbiB3ZSBwdWxsIG91dCB0aGUgaW5kaWNhdG9ycyBmcm9tCj4+
Pj4gdmlydGlvX2Njd19kZXZpY2UgdG8gYSBtZW1vcnkgYXJlYSB0aGF0IGlzIHNoYXJlZCB3aXRo
IHRoZSBoeXBlcnZpc29yCj4+Pj4gKGluIHBhcnRpY3VsYXIgZm9yIHByb3RlY3RlZCB2aXJ0dWFs
aXphdGlvbiBndWVzdHMpLgo+Pj4+Cj4+Pj4gU2lnbmVkLW9mZi1ieTogSGFsaWwgUGFzaWMgPHBh
c2ljQGxpbnV4LmlibS5jb20+Cj4+Pj4gLS0tCj4+Pj4gIMKgIGRyaXZlcnMvczM5MC92aXJ0aW8v
dmlydGlvX2Njdy5jIHwgNDAKPj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0t
LS0tLS0tCj4+Pj4gIMKgIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCspLCAxNSBkZWxl
dGlvbnMoLSkKPj4+Pgo+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRp
b19jY3cuYwo+Pj4+IGIvZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMKPj4+PiBpbmRl
eCBiYjdhOTIzMTZmYzguLjFmM2U3ZDU2OTI0ZiAxMDA2NDQKPj4+PiAtLS0gYS9kcml2ZXJzL3Mz
OTAvdmlydGlvL3ZpcnRpb19jY3cuYwo+Pj4+ICsrKyBiL2RyaXZlcnMvczM5MC92aXJ0aW8vdmly
dGlvX2Njdy5jCj4+Pj4gQEAgLTY4LDYgKzY4LDE2IEBAIHN0cnVjdCB2aXJ0aW9fY2N3X2Rldmlj
ZSB7Cj4+Pj4gIMKgwqDCoMKgwqAgdm9pZCAqYWlycV9pbmZvOwo+Pj4+ICDCoCB9Owo+Pj4+ICtz
dGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgKmluZGljYXRvcnMoc3RydWN0IHZpcnRpb19jY3df
ZGV2aWNlICp2Y2RldikKPj4+PiArewo+Pj4+ICvCoMKgwqAgcmV0dXJuICZ2Y2Rldi0+aW5kaWNh
dG9yczsKPj4+PiArfQo+Pj4+ICsKPj4+PiArc3RhdGljIGlubGluZSB1bnNpZ25lZCBsb25nICpp
bmRpY2F0b3JzMihzdHJ1Y3QgdmlydGlvX2Njd19kZXZpY2UKPj4+PiAqdmNkZXYpCj4+Pj4gK3sK
Pj4+PiArwqDCoMKgIHJldHVybiAmdmNkZXYtPmluZGljYXRvcnMyOwo+Pj4+ICt9Cj4+Pj4gKwo+
Pj4+ICDCoCBzdHJ1Y3QgdnFfaW5mb19ibG9ja19sZWdhY3kgewo+Pj4+ICDCoMKgwqDCoMKgIF9f
dTY0IHF1ZXVlOwo+Pj4+ICDCoMKgwqDCoMKgIF9fdTMyIGFsaWduOwo+Pj4+IEBAIC0zMzcsMTcg
KzM0NywxNyBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fY2N3X2Ryb3BfaW5kaWNhdG9yKHN0cnVjdAo+
Pj4+IHZpcnRpb19jY3dfZGV2aWNlICp2Y2RldiwKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGNj
dy0+Y2RhID0gKF9fdTMyKSh1bnNpZ25lZCBsb25nKSB0aGluaW50X2FyZWE7Cj4+Pj4gIMKgwqDC
oMKgwqAgfSBlbHNlIHsKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIHBheWxvYWQgaXMgdGhl
IGFkZHJlc3Mgb2YgdGhlIGluZGljYXRvcnMgKi8KPj4+PiAtwqDCoMKgwqDCoMKgwqAgaW5kaWNh
dG9ycCA9IGttYWxsb2Moc2l6ZW9mKCZ2Y2Rldi0+aW5kaWNhdG9ycyksCj4+Pj4gK8KgwqDCoMKg
wqDCoMKgIGluZGljYXRvcnAgPSBrbWFsbG9jKHNpemVvZihpbmRpY2F0b3JzKHZjZGV2KSksCj4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9ETUEg
fCBHRlBfS0VSTkVMKTsKPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIGlmICghaW5kaWNhdG9ycCkK
Pj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuOwo+Pj4+ICDCoMKgwqDCoMKg
wqDCoMKgwqAgKmluZGljYXRvcnAgPSAwOwo+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgY2N3LT5j
bWRfY29kZSA9IENDV19DTURfU0VUX0lORDsKPj4+PiAtwqDCoMKgwqDCoMKgwqAgY2N3LT5jb3Vu
dCA9IHNpemVvZigmdmNkZXYtPmluZGljYXRvcnMpOwo+Pj4+ICvCoMKgwqDCoMKgwqDCoCBjY3ct
PmNvdW50ID0gc2l6ZW9mKGluZGljYXRvcnModmNkZXYpKTsKPj4+Cj4+PiBUaGlzIGxvb2tzIHN0
cmFuZ2UgdG8gbWUuIFdhcyBhbHJlYWR5IHdlaXJkIGJlZm9yZS4KPj4+IEx1Y2t5IHdlIGFyZSBp
bmRpY2F0b3JzIGFyZSBsb25nLi4uCj4+PiBtYXkgYmUganVzdCBzaXplb2YobG9uZykKPj4KPiAK
PiBJJ20gbm90IHN1cmUgSSB1bmRlcnN0YW5kIHdoZXJlIGFyZSB5b3UgY29taW5nIGZyb20uLi4K
PiAKPiBXaXRoIENDV19DTURfU0VUX0lORCB3ZSB0ZWxsIHRoZSBoeXBlcnZpc29yIHRoZSBndWVz
dCBwaHlzaWNhbCBhZGRyZXNzCj4gYXQgd2hpY2ggdGhlIHNvIGNhbGxlZCBjbGFzc2ljIGluZGlj
YXRvcnMuIFRoZXJlIGlzIGEgY29tbWVudCB0aGF0Cj4gbWFrZXMgdGhpcyBvYnZpb3VzLiBUaGUg
YXJndW1lbnQgb2YgdGhlIHNpemVvZiB3YXMgYW5kIHJlbWFpbmVkIGEKPiBwb2ludGVyIHR5cGUu
IEFGQUlVIHRoaXMgaXMgd2hhdCBib3RoZXJzIHlvdS4KPj4KPj4gQUZBSUsgdGhlIHNpemUgb2Yg
dGhlIGluZGljYXRvcnMgKEFJVi9BSVMpIGlzIG5vdCByZXN0cmljdGVkIGJ5IHRoZQo+PiBhcmNo
aXRlY3R1cmUuCj4gCj4gVGhlIHNpemUgb2YgdmNkZXYtPmluZGljYXRvcnMgaXMgcmVzdHJpY3Rl
ZCBvciBkZWZpbmVkIGJ5IHRoZSB2aXJ0aW8KPiBzcGVjaWZpY2F0aW9uLiBQbGVhc2UgaGF2ZSBh
IGxvb2sgYXQgJzQuMy4yLjYuMSBTZXR0aW5nIFVwIENsYXNzaWMgUXVldWUKPiBJbmRpY2F0b3Jz
JyBoZXJlOgo+IGh0dHBzOi8vZG9jcy5vYXNpcy1vcGVuLm9yZy92aXJ0aW8vdmlydGlvL3YxLjEv
Y3MwMS92aXJ0aW8tdjEuMS1jczAxLmh0bWwjeDEtMTYzMDAwMgo+IAo+IFNpbmNlIHdpdGggTGlu
dXggb24gczM5MCBvbmx5IDY0IGJpdCBpcyBzdXBwb3J0ZWQsIGJvdGggdGhlIHNpemVzIGFyZSBp
bgo+IGxpbmUgd2l0aCB0aGUgc3BlY2lmaWNhdGlvbi4gVXNpbmcgdTY0IHdvdWxkIHNlbWFudGlj
YWxseSBtYXRjaCB0aGUgc3BlYwo+IGJldHRlciwgbW9kdWxvIHByZSB2aXJ0aW8gMS4wIHdoaWNo
IGFpbid0IHNwZWNpZmllZC4gSSBkaWQgbm90IHdhbnQgdG8KPiBkbyBjaGFuZ2VzIHRoYXQgYXJl
IG5vdCBuZWNlc3NhcnkgZm9yIHdoYXQgSSdtIHRyeWluZyB0byBhY2NvbXBsaXNoLiBJZgo+IHdl
IHdhbnQgd2UgY2FuIGNoYW5nZSB0aGVzZSB0byB1NjQgd2l0aCBhIHBhdGNoIG9uIHRvcC4KCkkg
bWVhbiB5b3UgYXJlIGNoYW5naW5nIHRoZXNlIGxpbmUgYWxyZWFkeSwgc28gd2h5IG5vdCBkb2lu
ZyBpdCByaWdodCAKd2hpbGUgYXQgaXQ/CgpQaWVycmUKCi0tIApQaWVycmUgTW9yZWwKTGludXgv
S1ZNL1FFTVUgaW4gQsO2YmxpbmdlbiAtIEdlcm1hbnkKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
