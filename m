Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D56A22748
	for <lists.virtualization@lfdr.de>; Sun, 19 May 2019 18:23:56 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 23899C58;
	Sun, 19 May 2019 16:17:36 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id DD6B4ACD
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 15:24:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 3AACC837
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 15:24:50 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4GFDm2o015070 for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 11:24:49 -0400
Received: from e06smtp05.uk.ibm.com (e06smtp05.uk.ibm.com [195.75.94.101])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2sh8hrx44s-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 16 May 2019 11:24:49 -0400
Received: from localhost
	by e06smtp05.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pmorel@linux.ibm.com>; Thu, 16 May 2019 16:24:45 +0100
Received: from b06cxnps4074.portsmouth.uk.ibm.com (9.149.109.196)
	by e06smtp05.uk.ibm.com (192.168.101.135) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 16 May 2019 16:24:42 +0100
Received: from d06av24.portsmouth.uk.ibm.com (d06av24.portsmouth.uk.ibm.com
	[9.149.105.60])
	by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4GFOfDv44236992
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 16 May 2019 15:24:41 GMT
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F304F42049;
	Thu, 16 May 2019 15:24:40 +0000 (GMT)
Received: from d06av24.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 2A6544203F;
	Thu, 16 May 2019 15:24:40 +0000 (GMT)
Received: from [9.152.222.58] (unknown [9.152.222.58])
	by d06av24.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu, 16 May 2019 15:24:40 +0000 (GMT)
Subject: Re: [PATCH 08/10] virtio/s390: add indirection to indicators access
To: Cornelia Huck <cohuck@redhat.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-9-pasic@linux.ibm.com>
	<716d47ca-016f-e8f4-6d78-7746a7d9f6ba@linux.ibm.com>
	<a4bf1976-8037-63bb-2cf6-c389edbd2e89@linux.ibm.com>
	<20190509202600.4fd6aebe.pasic@linux.ibm.com>
	<c1e03cf0-3773-de00-10ae-d092ffe7ccc5@linux.ibm.com>
	<20190510135421.5363f14a.pasic@linux.ibm.com>
	<89074bc5-78ee-a2e3-0546-791a465f83bd@linux.ibm.com>
	<20190513121502.34d3dc62.cohuck@redhat.com>
From: Pierre Morel <pmorel@linux.ibm.com>
Date: Thu, 16 May 2019 17:24:39 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190513121502.34d3dc62.cohuck@redhat.com>
Content-Language: en-US
X-TM-AS-GCONF: 00
x-cbid: 19051615-0020-0000-0000-0000033D631B
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051615-0021-0000-0000-000021902B7B
Message-Id: <2736e862-69e5-7923-b429-aee0dcdd2c5a@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-16_13:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905160097
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
X-Mailman-Approved-At: Sun, 19 May 2019 16:17:22 +0000
Cc: Vasily Gorbik <gor@linux.ibm.com>, linux-s390@vger.kernel.org,
	Thomas Huth <thuth@redhat.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>, kvm@vger.kernel.org,
	Sebastian Ott <sebott@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>, Farhan Ali <alifm@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	virtualization@lists.linux-foundation.org,
	Halil Pasic <pasic@linux.ibm.com>, Christoph Hellwig <hch@infradead.org>,
	Martin Schwidefsky <schwidefsky@de.ibm.com>,
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

T24gMTMvMDUvMjAxOSAxMjoxNSwgQ29ybmVsaWEgSHVjayB3cm90ZToKPiBPbiBGcmksIDEwIE1h
eSAyMDE5IDE3OjM2OjA1ICswMjAwCj4gUGllcnJlIE1vcmVsIDxwbW9yZWxAbGludXguaWJtLmNv
bT4gd3JvdGU6Cj4gCj4+IE9uIDEwLzA1LzIwMTkgMTM6NTQsIEhhbGlsIFBhc2ljIHdyb3RlOgo+
Pj4gT24gRnJpLCAxMCBNYXkgMjAxOSAwOTo0MzowOCArMDIwMAo+Pj4gUGllcnJlIE1vcmVsIDxw
bW9yZWxAbGludXguaWJtLmNvbT4gd3JvdGU6Cj4+PiAgICAKPj4+PiBPbiAwOS8wNS8yMDE5IDIw
OjI2LCBIYWxpbCBQYXNpYyB3cm90ZToKPj4+Pj4gT24gVGh1LCA5IE1heSAyMDE5IDE0OjAxOjAx
ICswMjAwCj4+Pj4+IFBpZXJyZSBNb3JlbCA8cG1vcmVsQGxpbnV4LmlibS5jb20+IHdyb3RlOgo+
Pj4+PiAgIAo+Pj4+Pj4gT24gMDgvMDUvMjAxOSAxNjozMSwgUGllcnJlIE1vcmVsIHdyb3RlOgo+
Pj4+Pj4+IE9uIDI2LzA0LzIwMTkgMjA6MzIsIEhhbGlsIFBhc2ljIHdyb3RlOgo+Pj4+Pj4+PiBU
aGlzIHdpbGwgY29tZSBpbiBoYW5keSBzb29uIHdoZW4gd2UgcHVsbCBvdXQgdGhlIGluZGljYXRv
cnMgZnJvbQo+Pj4+Pj4+PiB2aXJ0aW9fY2N3X2RldmljZSB0byBhIG1lbW9yeSBhcmVhIHRoYXQg
aXMgc2hhcmVkIHdpdGggdGhlIGh5cGVydmlzb3IKPj4+Pj4+Pj4gKGluIHBhcnRpY3VsYXIgZm9y
IHByb3RlY3RlZCB2aXJ0dWFsaXphdGlvbiBndWVzdHMpLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBTaWdu
ZWQtb2ZmLWJ5OiBIYWxpbCBQYXNpYyA8cGFzaWNAbGludXguaWJtLmNvbT4KPj4+Pj4+Pj4gLS0t
Cj4+Pj4+Pj4+ICAgIMKgIGRyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jIHwgNDAKPj4+
Pj4+Pj4gKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tLQo+Pj4+Pj4+PiAg
ICDCoCAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25zKC0pCj4+
Pj4+Pj4+Cj4+Pj4+Pj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19j
Y3cuYwo+Pj4+Pj4+PiBiL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4+Pj4+Pj4+
IGluZGV4IGJiN2E5MjMxNmZjOC4uMWYzZTdkNTY5MjRmIDEwMDY0NAo+Pj4+Pj4+PiAtLS0gYS9k
cml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cuYwo+Pj4+Pj4+PiArKysgYi9kcml2ZXJzL3Mz
OTAvdmlydGlvL3ZpcnRpb19jY3cuYwo+Pj4+Pj4+PiBAQCAtNjgsNiArNjgsMTYgQEAgc3RydWN0
IHZpcnRpb19jY3dfZGV2aWNlIHsKPj4+Pj4+Pj4gICAgwqDCoMKgwqDCoCB2b2lkICphaXJxX2lu
Zm87Cj4+Pj4+Pj4+ICAgIMKgIH07Cj4+Pj4+Pj4+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxv
bmcgKmluZGljYXRvcnMoc3RydWN0IHZpcnRpb19jY3dfZGV2aWNlICp2Y2RldikKPj4+Pj4+Pj4g
K3sKPj4+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gJnZjZGV2LT5pbmRpY2F0b3JzOwo+Pj4+Pj4+PiAr
fQo+Pj4+Pj4+PiArCj4+Pj4+Pj4+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgKmluZGlj
YXRvcnMyKHN0cnVjdCB2aXJ0aW9fY2N3X2RldmljZQo+Pj4+Pj4+PiAqdmNkZXYpCj4+Pj4+Pj4+
ICt7Cj4+Pj4+Pj4+ICvCoMKgwqAgcmV0dXJuICZ2Y2Rldi0+aW5kaWNhdG9yczI7Cj4+Pj4+Pj4+
ICt9Cj4+Pj4+Pj4+ICsKPj4+Pj4+Pj4gICAgwqAgc3RydWN0IHZxX2luZm9fYmxvY2tfbGVnYWN5
IHsKPj4+Pj4+Pj4gICAgwqDCoMKgwqDCoCBfX3U2NCBxdWV1ZTsKPj4+Pj4+Pj4gICAgwqDCoMKg
wqDCoCBfX3UzMiBhbGlnbjsKPj4+Pj4+Pj4gQEAgLTMzNywxNyArMzQ3LDE3IEBAIHN0YXRpYyB2
b2lkIHZpcnRpb19jY3dfZHJvcF9pbmRpY2F0b3Ioc3RydWN0Cj4+Pj4+Pj4+IHZpcnRpb19jY3df
ZGV2aWNlICp2Y2RldiwKPj4+Pj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgIGNjdy0+Y2RhID0g
KF9fdTMyKSh1bnNpZ25lZCBsb25nKSB0aGluaW50X2FyZWE7Cj4+Pj4+Pj4+ICAgIMKgwqDCoMKg
wqAgfSBlbHNlIHsKPj4+Pj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIHBheWxvYWQgaXMg
dGhlIGFkZHJlc3Mgb2YgdGhlIGluZGljYXRvcnMgKi8KPj4+Pj4+Pj4gLcKgwqDCoMKgwqDCoMKg
IGluZGljYXRvcnAgPSBrbWFsbG9jKHNpemVvZigmdmNkZXYtPmluZGljYXRvcnMpLAo+Pj4+Pj4+
PiArwqDCoMKgwqDCoMKgwqAgaW5kaWNhdG9ycCA9IGttYWxsb2Moc2l6ZW9mKGluZGljYXRvcnMo
dmNkZXYpKSwKPj4+Pj4+Pj4gICAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqAgR0ZQX0RNQSB8IEdGUF9LRVJORUwpOwo+Pj4+Pj4+PiAgICDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKCFpbmRpY2F0b3JwKQo+Pj4+Pj4+PiAgICDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXR1cm47Cj4+Pj4+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgwqDCoCAqaW5kaWNhdG9ycCA9
IDA7Cj4+Pj4+Pj4+ICAgIMKgwqDCoMKgwqDCoMKgwqDCoCBjY3ctPmNtZF9jb2RlID0gQ0NXX0NN
RF9TRVRfSU5EOwo+Pj4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgY2N3LT5jb3VudCA9IHNpemVvZigm
dmNkZXYtPmluZGljYXRvcnMpOwo+Pj4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgY2N3LT5jb3VudCA9
IHNpemVvZihpbmRpY2F0b3JzKHZjZGV2KSk7Cj4+Pj4+Pj4KPj4+Pj4+PiBUaGlzIGxvb2tzIHN0
cmFuZ2UgdG8gbWUuIFdhcyBhbHJlYWR5IHdlaXJkIGJlZm9yZS4KPj4+Pj4+PiBMdWNreSB3ZSBh
cmUgaW5kaWNhdG9ycyBhcmUgbG9uZy4uLgo+Pj4+Pj4+IG1heSBiZSBqdXN0IHNpemVvZihsb25n
KQo+Pj4+Pj4gICAKPj4+Pj4KPj4+Pj4gSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGVyZSBh
cmUgeW91IGNvbWluZyBmcm9tLi4uCj4+Pj4+Cj4+Pj4+IFdpdGggQ0NXX0NNRF9TRVRfSU5EIHdl
IHRlbGwgdGhlIGh5cGVydmlzb3IgdGhlIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MKPj4+Pj4gYXQg
d2hpY2ggdGhlIHNvIGNhbGxlZCBjbGFzc2ljIGluZGljYXRvcnMuIFRoZXJlIGlzIGEgY29tbWVu
dCB0aGF0Cj4+Pj4+IG1ha2VzIHRoaXMgb2J2aW91cy4gVGhlIGFyZ3VtZW50IG9mIHRoZSBzaXpl
b2Ygd2FzIGFuZCByZW1haW5lZCBhCj4+Pj4+IHBvaW50ZXIgdHlwZS4gQUZBSVUgdGhpcyBpcyB3
aGF0IGJvdGhlcnMgeW91Lgo+Pj4+Pj4KPj4+Pj4+IEFGQUlLIHRoZSBzaXplIG9mIHRoZSBpbmRp
Y2F0b3JzIChBSVYvQUlTKSBpcyBub3QgcmVzdHJpY3RlZCBieSB0aGUKPj4+Pj4+IGFyY2hpdGVj
dHVyZS4KPj4+Pj4KPj4+Pj4gVGhlIHNpemUgb2YgdmNkZXYtPmluZGljYXRvcnMgaXMgcmVzdHJp
Y3RlZCBvciBkZWZpbmVkIGJ5IHRoZSB2aXJ0aW8KPj4+Pj4gc3BlY2lmaWNhdGlvbi4gUGxlYXNl
IGhhdmUgYSBsb29rIGF0ICc0LjMuMi42LjEgU2V0dGluZyBVcCBDbGFzc2ljIFF1ZXVlCj4+Pj4+
IEluZGljYXRvcnMnIGhlcmU6Cj4+Pj4+IGh0dHBzOi8vZG9jcy5vYXNpcy1vcGVuLm9yZy92aXJ0
aW8vdmlydGlvL3YxLjEvY3MwMS92aXJ0aW8tdjEuMS1jczAxLmh0bWwjeDEtMTYzMDAwMgo+Pj4+
Pgo+Pj4+PiBTaW5jZSB3aXRoIExpbnV4IG9uIHMzOTAgb25seSA2NCBiaXQgaXMgc3VwcG9ydGVk
LCBib3RoIHRoZSBzaXplcyBhcmUgaW4KPj4+Pj4gbGluZSB3aXRoIHRoZSBzcGVjaWZpY2F0aW9u
LiBVc2luZyB1NjQgd291bGQgc2VtYW50aWNhbGx5IG1hdGNoIHRoZSBzcGVjCj4+Pj4+IGJldHRl
ciwgbW9kdWxvIHByZSB2aXJ0aW8gMS4wIHdoaWNoIGFpbid0IHNwZWNpZmllZC4gSSBkaWQgbm90
IHdhbnQgdG8KPj4+Pj4gZG8gY2hhbmdlcyB0aGF0IGFyZSBub3QgbmVjZXNzYXJ5IGZvciB3aGF0
IEknbSB0cnlpbmcgdG8gYWNjb21wbGlzaC4gSWYKPj4+Pj4gd2Ugd2FudCB3ZSBjYW4gY2hhbmdl
IHRoZXNlIHRvIHU2NCB3aXRoIGEgcGF0Y2ggb24gdG9wLgo+Pj4+Cj4+Pj4gSSBtZWFuIHlvdSBh
cmUgY2hhbmdpbmcgdGhlc2UgbGluZSBhbHJlYWR5LCBzbyB3aHkgbm90IGRvaW5nIGl0IHJpZ2h0
Cj4+Pj4gd2hpbGUgYXQgaXQ/Cj4+Pj4gICAKPj4+Cj4+PiBUaGlzIHBhdGNoIGlzIGFib3V0IGFk
ZGluZyB0aGUgaW5kaXJlY3Rpb24gc28gd2UgY2FuIG1vdmUgdGhlIG1lbWJlcgo+Pj4gcGFpbmxl
c3NseS4gTWl4aW5nIGluIGRpZmZlcmVudCBzdHVmZiB3b3VsZCBiZSBhIGJhZCBwcmFjdGljZS4K
Pj4+Cj4+PiBCVFcgSSBqdXN0IGV4cGxhaW5lZCB0aGF0IGl0IGFpbid0IHdyb25nLCBzbyBJIHJl
YWxseSBkbyBub3QgdW5kZXJzdGFuZAo+Pj4gd2hhdCBkbyB5b3UgbWVhbiBieSAgJ3doeSBub3Qg
ZG9pbmcgaXQgcmlnaHQnLiBDYW4geW91IHBsZWFzZSBleHBsYWluPwo+Pj4gICAgCj4+Cj4+IEkg
ZGlkIG5vdCB3YW50ZWQgdG8gZGlzY3VzcyBhIGxvbmcgdGltZSBvbiB0aGlzIGFuZCBnYXZlIG15
IFItQiwgc28KPj4gbWVhbmluZyB0aGF0IEkgYW0gT0sgd2l0aCB0aGlzIHBhdGNoLgo+Pgo+PiBC
dXQgaWYgeW91IGFzaywgeWVzIEkgY2FuLCBpdCBzZWVtcyBxdWl0ZSBvYnZpb3VzLgo+PiBXaGVu
IHlvdSBidWlsZCBhIENDVyB5b3UgZ2l2ZSB0aGUgcG9pbnRlciB0byBDQ1ctPmNkYSBhbmQgeW91
IGdpdmUgdGhlCj4+IHNpemUgb2YgdGhlIHRyYW5zZmVyIGluIENDVy0+Y291bnQuCj4+Cj4+IEhl
cmUgdGhlIGNvdW50IGlzIGluaXRpYWxpemVkIHdpdGggdGhlIHNpemVvZiBvZiB0aGUgcG9pbnRl
ciB1c2VkIHRvCj4+IGluaXRpYWxpemUgQ0NXLT5jZGEgd2l0aC4KPiAKPiBCdXQgdGhlIGNkYSBw
b2ludHMgdG8gdGhlIHBvaW50ZXIgYWRkcmVzcywgc28gdGhlIHNpemUgb2YgdGhlIHBvaW50ZXIK
PiBpcyBhY3R1YWxseSB0aGUgY29ycmVjdCB2YWx1ZSBoZXJlLCBpc24ndCBpdD8KCk9oLiBZZXMs
IGl0IGlzIGNvcnJlY3QuCldoYXQgSSBkbyBub3QgbGlrZSBhcmUgdGhlIG1peGluZyBvZiAodW5z
aWduZWQgbG9uZyksICh1bnNpZ25lZCBsb25nICopIAphbmQgJgppZiB3ZSBoYWQKY2RhID0gX3Uz
MiAodW5zaWduZWQgbG9uZykgaW5kaWNhdG9ycApjb3VudCA9IHNpemVvZigqaW5kaWNhdG9ycCkK
Ckkgd291bGQgaGF2ZSBiZWVuIGNvbXBsZXRlbHkgaGFwcHkuCgpJdCB3YXMganVzdCBhIG5vbiBp
bXBvcnRhbnQgdGhpbmcgYW5kIEkgd291bGRuJ3QgaGF2ZSBnaXZlbiBhIFItQiBpZiB0aGUgCmZ1
bmN0aW9uYWxpdHkgd2FzIG5vdCBjb3JyZWN0LgoKCj4gCj4+IEx1a2lseSB3ZSB3b3JrIG9uIGEg
NjQgYml0cyBtYWNoaW5lIHdpdGggNjQgYml0cyBwb2ludGVycyBhbmQgdGhlIHNpemUKPj4gb2Yg
dGhlIHBvaW50ZWQgb2JqZWN0IGlzIDY0IGJpdHMgd2lkZSBzby4uLiB0aGUgcmVzdWx0aW5nIGNv
dW50IGlzIHJpZ2h0Lgo+PiBCdXQgaXQgaXMgbm90IHRoZSBjb3JyZWN0IHdheSB0byBkbyBpdC4K
PiAKPiBJIHRoaW5rIGl0IGlzLCBidXQgdGhpcyBpbnRlcmZhY2UgcmVhbGx5IGlzIGNvbmZ1c2lu
Zy4KClllcywgaXQgaXMgd2hhdCBJIHRob3VnaHQgd2UgY291bGQgZG8gYmV0dGVyLgoKPiAKPj4g
VGhhdCBpcyBhbGwuIE5vdCBhIGJpZyBjb25jZXJuLCB5b3UgZG8gbm90IG5lZWQgdG8gY2hhbmdl
IGl0LCBhcyB5b3UKPj4gc2FpZCBpdCBjYW4gYmUgZG9uZSBpbiBhbm90aGVyIHBhdGNoLgo+Pgo+
Pj4gRGlkIHlvdSBhZ3JlZSB3aXRoIHRoZSByZXN0IG9mIG15IGNvbW1lbnQ/IEkgbWVhbiB0aGVy
ZSB3YXMgbW9yZSB0byBpdC4KPj4+ICAgIAo+Pgo+PiBJIHVuZGVyc3Rvb2QgZnJvbSB5b3VyIGNv
bW1lbnRzIHRoYXQgdGhlIGluZGljYXRvcnMgaW4gTGludXggYXJlIDY0Yml0cwo+PiB3aWRlIHNv
IGFsbCBPSy4KPj4KPj4gUmVnYXJkcwo+PiBQaWVycmUKPj4KPj4KPj4KPj4KPj4KPj4KPiAKCgot
LSAKUGllcnJlIE1vcmVsCkxpbnV4L0tWTS9RRU1VIGluIELDtmJsaW5nZW4gLSBHZXJtYW55Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXph
dGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5v
cmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmly
dHVhbGl6YXRpb24=
