Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C8C19CEF
	for <lists.virtualization@lfdr.de>; Fri, 10 May 2019 13:54:44 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 685E2B8A;
	Fri, 10 May 2019 11:54:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6AC39265
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 11:54:32 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
	[148.163.158.5])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id CBBC81FB
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 11:54:31 +0000 (UTC)
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x4ABqCCM070324 for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 07:54:30 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0b-001b2d01.pphosted.com with ESMTP id 2sd8df11m2-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Fri, 10 May 2019 07:54:30 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Fri, 10 May 2019 12:54:28 +0100
Received: from b06cxnps4075.portsmouth.uk.ibm.com (9.149.109.197)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Fri, 10 May 2019 12:54:25 +0100
Received: from d06av22.portsmouth.uk.ibm.com (d06av22.portsmouth.uk.ibm.com
	[9.149.105.58])
	by b06cxnps4075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x4ABsNHE60293356
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Fri, 10 May 2019 11:54:23 GMT
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 885C54C04A;
	Fri, 10 May 2019 11:54:23 +0000 (GMT)
Received: from d06av22.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id ADD064C04E;
	Fri, 10 May 2019 11:54:22 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.163.252])
	by d06av22.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Fri, 10 May 2019 11:54:22 +0000 (GMT)
Date: Fri, 10 May 2019 13:54:21 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH 08/10] virtio/s390: add indirection to indicators access
In-Reply-To: <c1e03cf0-3773-de00-10ae-d092ffe7ccc5@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-9-pasic@linux.ibm.com>
	<716d47ca-016f-e8f4-6d78-7746a7d9f6ba@linux.ibm.com>
	<a4bf1976-8037-63bb-2cf6-c389edbd2e89@linux.ibm.com>
	<20190509202600.4fd6aebe.pasic@linux.ibm.com>
	<c1e03cf0-3773-de00-10ae-d092ffe7ccc5@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19051011-0028-0000-0000-0000036C5064
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19051011-0029-0000-0000-0000242BD606
Message-Id: <20190510135421.5363f14a.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905100085
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_LOW
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gRnJpLCAxMCBNYXkgMjAxOSAwOTo0MzowOCArMDIwMApQaWVycmUgTW9yZWwgPHBtb3JlbEBs
aW51eC5pYm0uY29tPiB3cm90ZToKCj4gT24gMDkvMDUvMjAxOSAyMDoyNiwgSGFsaWwgUGFzaWMg
d3JvdGU6Cj4gPiBPbiBUaHUsIDkgTWF5IDIwMTkgMTQ6MDE6MDEgKzAyMDAKPiA+IFBpZXJyZSBN
b3JlbCA8cG1vcmVsQGxpbnV4LmlibS5jb20+IHdyb3RlOgo+ID4gCj4gPj4gT24gMDgvMDUvMjAx
OSAxNjozMSwgUGllcnJlIE1vcmVsIHdyb3RlOgo+ID4+PiBPbiAyNi8wNC8yMDE5IDIwOjMyLCBI
YWxpbCBQYXNpYyB3cm90ZToKPiA+Pj4+IFRoaXMgd2lsbCBjb21lIGluIGhhbmR5IHNvb24gd2hl
biB3ZSBwdWxsIG91dCB0aGUgaW5kaWNhdG9ycyBmcm9tCj4gPj4+PiB2aXJ0aW9fY2N3X2Rldmlj
ZSB0byBhIG1lbW9yeSBhcmVhIHRoYXQgaXMgc2hhcmVkIHdpdGggdGhlIGh5cGVydmlzb3IKPiA+
Pj4+IChpbiBwYXJ0aWN1bGFyIGZvciBwcm90ZWN0ZWQgdmlydHVhbGl6YXRpb24gZ3Vlc3RzKS4K
PiA+Pj4+Cj4gPj4+PiBTaWduZWQtb2ZmLWJ5OiBIYWxpbCBQYXNpYyA8cGFzaWNAbGludXguaWJt
LmNvbT4KPiA+Pj4+IC0tLQo+ID4+Pj4gIMKgIGRyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Nj
dy5jIHwgNDAKPiA+Pj4+ICsrKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tLS0K
PiA+Pj4+ICDCoCAxIGZpbGUgY2hhbmdlZCwgMjUgaW5zZXJ0aW9ucygrKSwgMTUgZGVsZXRpb25z
KC0pCj4gPj4+Pgo+ID4+Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlv
X2Njdy5jCj4gPj4+PiBiL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4gPj4+PiBp
bmRleCBiYjdhOTIzMTZmYzguLjFmM2U3ZDU2OTI0ZiAxMDA2NDQKPiA+Pj4+IC0tLSBhL2RyaXZl
cnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5jCj4gPj4+PiArKysgYi9kcml2ZXJzL3MzOTAvdmly
dGlvL3ZpcnRpb19jY3cuYwo+ID4+Pj4gQEAgLTY4LDYgKzY4LDE2IEBAIHN0cnVjdCB2aXJ0aW9f
Y2N3X2RldmljZSB7Cj4gPj4+PiAgwqDCoMKgwqDCoCB2b2lkICphaXJxX2luZm87Cj4gPj4+PiAg
wqAgfTsKPiA+Pj4+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxvbmcgKmluZGljYXRvcnMoc3Ry
dWN0IHZpcnRpb19jY3dfZGV2aWNlICp2Y2RldikKPiA+Pj4+ICt7Cj4gPj4+PiArwqDCoMKgIHJl
dHVybiAmdmNkZXYtPmluZGljYXRvcnM7Cj4gPj4+PiArfQo+ID4+Pj4gKwo+ID4+Pj4gK3N0YXRp
YyBpbmxpbmUgdW5zaWduZWQgbG9uZyAqaW5kaWNhdG9yczIoc3RydWN0IHZpcnRpb19jY3dfZGV2
aWNlCj4gPj4+PiAqdmNkZXYpCj4gPj4+PiArewo+ID4+Pj4gK8KgwqDCoCByZXR1cm4gJnZjZGV2
LT5pbmRpY2F0b3JzMjsKPiA+Pj4+ICt9Cj4gPj4+PiArCj4gPj4+PiAgwqAgc3RydWN0IHZxX2lu
Zm9fYmxvY2tfbGVnYWN5IHsKPiA+Pj4+ICDCoMKgwqDCoMKgIF9fdTY0IHF1ZXVlOwo+ID4+Pj4g
IMKgwqDCoMKgwqAgX191MzIgYWxpZ247Cj4gPj4+PiBAQCAtMzM3LDE3ICszNDcsMTcgQEAgc3Rh
dGljIHZvaWQgdmlydGlvX2Njd19kcm9wX2luZGljYXRvcihzdHJ1Y3QKPiA+Pj4+IHZpcnRpb19j
Y3dfZGV2aWNlICp2Y2RldiwKPiA+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgY2N3LT5jZGEgPSAo
X191MzIpKHVuc2lnbmVkIGxvbmcpIHRoaW5pbnRfYXJlYTsKPiA+Pj4+ICDCoMKgwqDCoMKgIH0g
ZWxzZSB7Cj4gPj4+PiAgwqDCoMKgwqDCoMKgwqDCoMKgIC8qIHBheWxvYWQgaXMgdGhlIGFkZHJl
c3Mgb2YgdGhlIGluZGljYXRvcnMgKi8KPiA+Pj4+IC3CoMKgwqDCoMKgwqDCoCBpbmRpY2F0b3Jw
ID0ga21hbGxvYyhzaXplb2YoJnZjZGV2LT5pbmRpY2F0b3JzKSwKPiA+Pj4+ICvCoMKgwqDCoMKg
wqDCoCBpbmRpY2F0b3JwID0ga21hbGxvYyhzaXplb2YoaW5kaWNhdG9ycyh2Y2RldikpLAo+ID4+
Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9ETUEg
fCBHRlBfS0VSTkVMKTsKPiA+Pj4+ICDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFpbmRpY2F0b3Jw
KQo+ID4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPiA+Pj4+ICDCoMKg
wqDCoMKgwqDCoMKgwqAgKmluZGljYXRvcnAgPSAwOwo+ID4+Pj4gIMKgwqDCoMKgwqDCoMKgwqDC
oCBjY3ctPmNtZF9jb2RlID0gQ0NXX0NNRF9TRVRfSU5EOwo+ID4+Pj4gLcKgwqDCoMKgwqDCoMKg
IGNjdy0+Y291bnQgPSBzaXplb2YoJnZjZGV2LT5pbmRpY2F0b3JzKTsKPiA+Pj4+ICvCoMKgwqDC
oMKgwqDCoCBjY3ctPmNvdW50ID0gc2l6ZW9mKGluZGljYXRvcnModmNkZXYpKTsKPiA+Pj4KPiA+
Pj4gVGhpcyBsb29rcyBzdHJhbmdlIHRvIG1lLiBXYXMgYWxyZWFkeSB3ZWlyZCBiZWZvcmUuCj4g
Pj4+IEx1Y2t5IHdlIGFyZSBpbmRpY2F0b3JzIGFyZSBsb25nLi4uCj4gPj4+IG1heSBiZSBqdXN0
IHNpemVvZihsb25nKQo+ID4+Cj4gPiAKPiA+IEknbSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hl
cmUgYXJlIHlvdSBjb21pbmcgZnJvbS4uLgo+ID4gCj4gPiBXaXRoIENDV19DTURfU0VUX0lORCB3
ZSB0ZWxsIHRoZSBoeXBlcnZpc29yIHRoZSBndWVzdCBwaHlzaWNhbCBhZGRyZXNzCj4gPiBhdCB3
aGljaCB0aGUgc28gY2FsbGVkIGNsYXNzaWMgaW5kaWNhdG9ycy4gVGhlcmUgaXMgYSBjb21tZW50
IHRoYXQKPiA+IG1ha2VzIHRoaXMgb2J2aW91cy4gVGhlIGFyZ3VtZW50IG9mIHRoZSBzaXplb2Yg
d2FzIGFuZCByZW1haW5lZCBhCj4gPiBwb2ludGVyIHR5cGUuIEFGQUlVIHRoaXMgaXMgd2hhdCBi
b3RoZXJzIHlvdS4KPiA+Pgo+ID4+IEFGQUlLIHRoZSBzaXplIG9mIHRoZSBpbmRpY2F0b3JzIChB
SVYvQUlTKSBpcyBub3QgcmVzdHJpY3RlZCBieSB0aGUKPiA+PiBhcmNoaXRlY3R1cmUuCj4gPiAK
PiA+IFRoZSBzaXplIG9mIHZjZGV2LT5pbmRpY2F0b3JzIGlzIHJlc3RyaWN0ZWQgb3IgZGVmaW5l
ZCBieSB0aGUgdmlydGlvCj4gPiBzcGVjaWZpY2F0aW9uLiBQbGVhc2UgaGF2ZSBhIGxvb2sgYXQg
JzQuMy4yLjYuMSBTZXR0aW5nIFVwIENsYXNzaWMgUXVldWUKPiA+IEluZGljYXRvcnMnIGhlcmU6
Cj4gPiBodHRwczovL2RvY3Mub2FzaXMtb3Blbi5vcmcvdmlydGlvL3ZpcnRpby92MS4xL2NzMDEv
dmlydGlvLXYxLjEtY3MwMS5odG1sI3gxLTE2MzAwMDIKPiA+IAo+ID4gU2luY2Ugd2l0aCBMaW51
eCBvbiBzMzkwIG9ubHkgNjQgYml0IGlzIHN1cHBvcnRlZCwgYm90aCB0aGUgc2l6ZXMgYXJlIGlu
Cj4gPiBsaW5lIHdpdGggdGhlIHNwZWNpZmljYXRpb24uIFVzaW5nIHU2NCB3b3VsZCBzZW1hbnRp
Y2FsbHkgbWF0Y2ggdGhlIHNwZWMKPiA+IGJldHRlciwgbW9kdWxvIHByZSB2aXJ0aW8gMS4wIHdo
aWNoIGFpbid0IHNwZWNpZmllZC4gSSBkaWQgbm90IHdhbnQgdG8KPiA+IGRvIGNoYW5nZXMgdGhh
dCBhcmUgbm90IG5lY2Vzc2FyeSBmb3Igd2hhdCBJJ20gdHJ5aW5nIHRvIGFjY29tcGxpc2guIElm
Cj4gPiB3ZSB3YW50IHdlIGNhbiBjaGFuZ2UgdGhlc2UgdG8gdTY0IHdpdGggYSBwYXRjaCBvbiB0
b3AuCj4gCj4gSSBtZWFuIHlvdSBhcmUgY2hhbmdpbmcgdGhlc2UgbGluZSBhbHJlYWR5LCBzbyB3
aHkgbm90IGRvaW5nIGl0IHJpZ2h0IAo+IHdoaWxlIGF0IGl0Pwo+IAoKVGhpcyBwYXRjaCBpcyBh
Ym91dCBhZGRpbmcgdGhlIGluZGlyZWN0aW9uIHNvIHdlIGNhbiBtb3ZlIHRoZSBtZW1iZXIKcGFp
bmxlc3NseS4gTWl4aW5nIGluIGRpZmZlcmVudCBzdHVmZiB3b3VsZCBiZSBhIGJhZCBwcmFjdGlj
ZS4KCkJUVyBJIGp1c3QgZXhwbGFpbmVkIHRoYXQgaXQgYWluJ3Qgd3JvbmcsIHNvIEkgcmVhbGx5
IGRvIG5vdCB1bmRlcnN0YW5kCndoYXQgZG8geW91IG1lYW4gYnkgICd3aHkgbm90IGRvaW5nIGl0
IHJpZ2h0Jy4gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbj8KCkRpZCB5b3UgYWdyZWUgd2l0aCB0aGUg
cmVzdCBvZiBteSBjb21tZW50PyBJIG1lYW4gdGhlcmUgd2FzIG1vcmUgdG8gaXQuCgpSZWdhcmRz
LApIYWxpbAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
VmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZv
dW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL3ZpcnR1YWxpemF0aW9u
