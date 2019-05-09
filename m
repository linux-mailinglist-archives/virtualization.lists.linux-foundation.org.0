Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 3252F1902C
	for <lists.virtualization@lfdr.de>; Thu,  9 May 2019 20:26:19 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 7743DE7D;
	Thu,  9 May 2019 18:26:14 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id B11B9E67
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 18:26:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com
	[148.163.156.1])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id DB727834
	for <virtualization@lists.linux-foundation.org>;
	Thu,  9 May 2019 18:26:10 +0000 (UTC)
Received: from pps.filterd (m0098409.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id
	x49ILaFc121360 for <virtualization@lists.linux-foundation.org>;
	Thu, 9 May 2019 14:26:10 -0400
Received: from e06smtp07.uk.ibm.com (e06smtp07.uk.ibm.com [195.75.94.103])
	by mx0a-001b2d01.pphosted.com with ESMTP id 2scqnw4f3x-1
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
	for <virtualization@lists.linux-foundation.org>;
	Thu, 09 May 2019 14:26:10 -0400
Received: from localhost
	by e06smtp07.uk.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use
	Only! Violators will be prosecuted
	for <virtualization@lists.linux-foundation.org> from
	<pasic@linux.ibm.com>; Thu, 9 May 2019 19:26:07 +0100
Received: from b06cxnps3075.portsmouth.uk.ibm.com (9.149.109.195)
	by e06smtp07.uk.ibm.com (192.168.101.137) with IBM ESMTP SMTP Gateway:
	Authorized Use Only! Violators will be prosecuted; 
	(version=TLSv1/SSLv3 cipher=AES256-GCM-SHA384 bits=256/256)
	Thu, 9 May 2019 19:26:04 +0100
Received: from d06av25.portsmouth.uk.ibm.com (d06av25.portsmouth.uk.ibm.com
	[9.149.105.61])
	by b06cxnps3075.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with
	ESMTP id x49IQ32C59441336
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256
	verify=OK); Thu, 9 May 2019 18:26:03 GMT
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id E4E1311C052;
	Thu,  9 May 2019 18:26:02 +0000 (GMT)
Received: from d06av25.portsmouth.uk.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1560811C050;
	Thu,  9 May 2019 18:26:02 +0000 (GMT)
Received: from oc2783563651 (unknown [9.145.181.188])
	by d06av25.portsmouth.uk.ibm.com (Postfix) with ESMTP;
	Thu,  9 May 2019 18:26:02 +0000 (GMT)
Date: Thu, 9 May 2019 20:26:00 +0200
From: Halil Pasic <pasic@linux.ibm.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH 08/10] virtio/s390: add indirection to indicators access
In-Reply-To: <a4bf1976-8037-63bb-2cf6-c389edbd2e89@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-9-pasic@linux.ibm.com>
	<716d47ca-016f-e8f4-6d78-7746a7d9f6ba@linux.ibm.com>
	<a4bf1976-8037-63bb-2cf6-c389edbd2e89@linux.ibm.com>
Organization: IBM
X-Mailer: Claws Mail 3.11.1 (GTK+ 2.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-TM-AS-GCONF: 00
x-cbid: 19050918-0028-0000-0000-0000036C075D
X-IBM-AV-DETECTION: SAVI=unused REMOTE=unused XFE=unused
x-cbparentid: 19050918-0029-0000-0000-0000242B8A0E
Message-Id: <20190509202600.4fd6aebe.pasic@linux.ibm.com>
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:, ,
	definitions=2019-05-09_02:, , signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
	priorityscore=1501
	malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 spamscore=0
	clxscore=1015 lowpriorityscore=0 mlxscore=0 impostorscore=0
	mlxlogscore=999 adultscore=0 classifier=spam adjust=0 reason=mlx
	scancount=1 engine=8.0.1-1810050000 definitions=main-1905090105
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

T24gVGh1LCA5IE1heSAyMDE5IDE0OjAxOjAxICswMjAwClBpZXJyZSBNb3JlbCA8cG1vcmVsQGxp
bnV4LmlibS5jb20+IHdyb3RlOgoKPiBPbiAwOC8wNS8yMDE5IDE2OjMxLCBQaWVycmUgTW9yZWwg
d3JvdGU6Cj4gPiBPbiAyNi8wNC8yMDE5IDIwOjMyLCBIYWxpbCBQYXNpYyB3cm90ZToKPiA+PiBU
aGlzIHdpbGwgY29tZSBpbiBoYW5keSBzb29uIHdoZW4gd2UgcHVsbCBvdXQgdGhlIGluZGljYXRv
cnMgZnJvbQo+ID4+IHZpcnRpb19jY3dfZGV2aWNlIHRvIGEgbWVtb3J5IGFyZWEgdGhhdCBpcyBz
aGFyZWQgd2l0aCB0aGUgaHlwZXJ2aXNvcgo+ID4+IChpbiBwYXJ0aWN1bGFyIGZvciBwcm90ZWN0
ZWQgdmlydHVhbGl6YXRpb24gZ3Vlc3RzKS4KPiA+Pgo+ID4+IFNpZ25lZC1vZmYtYnk6IEhhbGls
IFBhc2ljIDxwYXNpY0BsaW51eC5pYm0uY29tPgo+ID4+IC0tLQo+ID4+IMKgIGRyaXZlcnMvczM5
MC92aXJ0aW8vdmlydGlvX2Njdy5jIHwgNDAgCj4gPj4gKysrKysrKysrKysrKysrKysrKysrKysr
Ky0tLS0tLS0tLS0tLS0tLQo+ID4+IMKgIDEgZmlsZSBjaGFuZ2VkLCAyNSBpbnNlcnRpb25zKCsp
LCAxNSBkZWxldGlvbnMoLSkKPiA+Pgo+ID4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3MzOTAvdmly
dGlvL3ZpcnRpb19jY3cuYyAKPiA+PiBiL2RyaXZlcnMvczM5MC92aXJ0aW8vdmlydGlvX2Njdy5j
Cj4gPj4gaW5kZXggYmI3YTkyMzE2ZmM4Li4xZjNlN2Q1NjkyNGYgMTAwNjQ0Cj4gPj4gLS0tIGEv
ZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMKPiA+PiArKysgYi9kcml2ZXJzL3MzOTAv
dmlydGlvL3ZpcnRpb19jY3cuYwo+ID4+IEBAIC02OCw2ICs2OCwxNiBAQCBzdHJ1Y3QgdmlydGlv
X2Njd19kZXZpY2Ugewo+ID4+IMKgwqDCoMKgwqAgdm9pZCAqYWlycV9pbmZvOwo+ID4+IMKgIH07
Cj4gPj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyAqaW5kaWNhdG9ycyhzdHJ1Y3Qgdmly
dGlvX2Njd19kZXZpY2UgKnZjZGV2KQo+ID4+ICt7Cj4gPj4gK8KgwqDCoCByZXR1cm4gJnZjZGV2
LT5pbmRpY2F0b3JzOwo+ID4+ICt9Cj4gPj4gKwo+ID4+ICtzdGF0aWMgaW5saW5lIHVuc2lnbmVk
IGxvbmcgKmluZGljYXRvcnMyKHN0cnVjdCB2aXJ0aW9fY2N3X2RldmljZSAKPiA+PiAqdmNkZXYp
Cj4gPj4gK3sKPiA+PiArwqDCoMKgIHJldHVybiAmdmNkZXYtPmluZGljYXRvcnMyOwo+ID4+ICt9
Cj4gPj4gKwo+ID4+IMKgIHN0cnVjdCB2cV9pbmZvX2Jsb2NrX2xlZ2FjeSB7Cj4gPj4gwqDCoMKg
wqDCoCBfX3U2NCBxdWV1ZTsKPiA+PiDCoMKgwqDCoMKgIF9fdTMyIGFsaWduOwo+ID4+IEBAIC0z
MzcsMTcgKzM0NywxNyBAQCBzdGF0aWMgdm9pZCB2aXJ0aW9fY2N3X2Ryb3BfaW5kaWNhdG9yKHN0
cnVjdCAKPiA+PiB2aXJ0aW9fY2N3X2RldmljZSAqdmNkZXYsCj4gPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIGNjdy0+Y2RhID0gKF9fdTMyKSh1bnNpZ25lZCBsb25nKSB0aGluaW50X2FyZWE7Cj4gPj4g
wqDCoMKgwqDCoCB9IGVsc2Ugewo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCAvKiBwYXlsb2FkIGlz
IHRoZSBhZGRyZXNzIG9mIHRoZSBpbmRpY2F0b3JzICovCj4gPj4gLcKgwqDCoMKgwqDCoMKgIGlu
ZGljYXRvcnAgPSBrbWFsbG9jKHNpemVvZigmdmNkZXYtPmluZGljYXRvcnMpLAo+ID4+ICvCoMKg
wqDCoMKgwqDCoCBpbmRpY2F0b3JwID0ga21hbGxvYyhzaXplb2YoaW5kaWNhdG9ycyh2Y2Rldikp
LAo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIEdGUF9E
TUEgfCBHRlBfS0VSTkVMKTsKPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWYgKCFpbmRpY2F0b3Jw
KQo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJldHVybjsKPiA+PiDCoMKgwqDCoMKg
wqDCoMKgwqAgKmluZGljYXRvcnAgPSAwOwo+ID4+IMKgwqDCoMKgwqDCoMKgwqDCoCBjY3ctPmNt
ZF9jb2RlID0gQ0NXX0NNRF9TRVRfSU5EOwo+ID4+IC3CoMKgwqDCoMKgwqDCoCBjY3ctPmNvdW50
ID0gc2l6ZW9mKCZ2Y2Rldi0+aW5kaWNhdG9ycyk7Cj4gPj4gK8KgwqDCoMKgwqDCoMKgIGNjdy0+
Y291bnQgPSBzaXplb2YoaW5kaWNhdG9ycyh2Y2RldikpOwo+ID4gCj4gPiBUaGlzIGxvb2tzIHN0
cmFuZ2UgdG8gbWUuIFdhcyBhbHJlYWR5IHdlaXJkIGJlZm9yZS4KPiA+IEx1Y2t5IHdlIGFyZSBp
bmRpY2F0b3JzIGFyZSBsb25nLi4uCj4gPiBtYXkgYmUganVzdCBzaXplb2YobG9uZykKPiAKCkkn
bSBub3Qgc3VyZSBJIHVuZGVyc3RhbmQgd2hlcmUgYXJlIHlvdSBjb21pbmcgZnJvbS4uLgoKV2l0
aCBDQ1dfQ01EX1NFVF9JTkQgd2UgdGVsbCB0aGUgaHlwZXJ2aXNvciB0aGUgZ3Vlc3QgcGh5c2lj
YWwgYWRkcmVzcwphdCB3aGljaCB0aGUgc28gY2FsbGVkIGNsYXNzaWMgaW5kaWNhdG9ycy4gVGhl
cmUgaXMgYSBjb21tZW50IHRoYXQKbWFrZXMgdGhpcyBvYnZpb3VzLiBUaGUgYXJndW1lbnQgb2Yg
dGhlIHNpemVvZiB3YXMgYW5kIHJlbWFpbmVkIGEKcG9pbnRlciB0eXBlLiBBRkFJVSB0aGlzIGlz
IHdoYXQgYm90aGVycyB5b3UuIAo+IAo+IEFGQUlLIHRoZSBzaXplIG9mIHRoZSBpbmRpY2F0b3Jz
IChBSVYvQUlTKSBpcyBub3QgcmVzdHJpY3RlZCBieSB0aGUgCj4gYXJjaGl0ZWN0dXJlLgoKVGhl
IHNpemUgb2YgdmNkZXYtPmluZGljYXRvcnMgaXMgcmVzdHJpY3RlZCBvciBkZWZpbmVkIGJ5IHRo
ZSB2aXJ0aW8Kc3BlY2lmaWNhdGlvbi4gUGxlYXNlIGhhdmUgYSBsb29rIGF0ICc0LjMuMi42LjEg
U2V0dGluZyBVcCBDbGFzc2ljIFF1ZXVlCkluZGljYXRvcnMnIGhlcmU6Cmh0dHBzOi8vZG9jcy5v
YXNpcy1vcGVuLm9yZy92aXJ0aW8vdmlydGlvL3YxLjEvY3MwMS92aXJ0aW8tdjEuMS1jczAxLmh0
bWwjeDEtMTYzMDAwMgoKU2luY2Ugd2l0aCBMaW51eCBvbiBzMzkwIG9ubHkgNjQgYml0IGlzIHN1
cHBvcnRlZCwgYm90aCB0aGUgc2l6ZXMgYXJlIGluCmxpbmUgd2l0aCB0aGUgc3BlY2lmaWNhdGlv
bi4gVXNpbmcgdTY0IHdvdWxkIHNlbWFudGljYWxseSBtYXRjaCB0aGUgc3BlYwpiZXR0ZXIsIG1v
ZHVsbyBwcmUgdmlydGlvIDEuMCB3aGljaCBhaW4ndCBzcGVjaWZpZWQuIEkgZGlkIG5vdCB3YW50
IHRvCmRvIGNoYW5nZXMgdGhhdCBhcmUgbm90IG5lY2Vzc2FyeSBmb3Igd2hhdCBJJ20gdHJ5aW5n
IHRvIGFjY29tcGxpc2guIElmCndlIHdhbnQgd2UgY2FuIGNoYW5nZSB0aGVzZSB0byB1NjQgd2l0
aCBhIHBhdGNoIG9uIHRvcC4KCj4gSG93ZXZlciB3ZSBuZXZlciB1c2UgbW9yZSB0aGFuIDY0IGJp
dHMsIGRvIHdlIGV2ZXIgaGF2ZSBhbiBhZGFwdGVyIAo+IGhhdmluZyBtb3JlIHRoYW4gNjQgZGlm
ZmVyZW50IGludGVycnVwdHM/CgpUaGVzZSBhcmUgb25lIHBlciBxdWV1ZS4gVGhlIG51bWJlciBv
ZiBxdWV1ZXMgdXNlZCB0byBiZSBsaW1pdGVkIHRvIDY0CmJ1dCBpdCBhaW4ndCBubyBtb3JlLiBJ
ZiB0aGUgZHJpdmVyIHVzZXMgY2xhc3NpYyBub3RpZmllcnMsIG9ubHkgdGhlCmZpcnN0IDY0IGNh
biBiZSB1c2VkLgoKPiAKPiBNYXkgYmUgd2UgY2FuIHN0YXRlIHRoYW4gd2UgdXNlIGEgbWF4aW1h
bCBudW1iZXIgb2YgQUlTQiBvZiA2NCBhbmQgCj4gdGhlcmVmb3IgdXNlIGluZGljYXRvcnMgd2l0
aCBhIHNpemUgb2YgdW5zaWduZWQgbG9uZywgb3IgX191NjQgb3IgCj4gd2hhdGV2ZXIgaXMgYXBw
cm9wcmlhdGUuIFBsZWFzZSBjbGVhciB0aGlzLgo+IAoKSSB0aGluayB5b3UgYXJlIG1peGluZyB1
cCBhZGFwdGVyIGludGVycnVwdHMgYXMgZGVmaW5lZCBieSB0aGUKYXJjaGl0ZWN0dXJlLCB3aXRo
IHZpcnRpbyBpbmRpY2F0b3JzIHdoaWNoIGFyZSBraW5kIG9mIGEgc3BlY2lhbCBjYXNlCmF0IGJl
c3Q6IHRoZSB0d28gc3RhZ2Ugc3R1ZmYgaXMgbW9kZWxlZCBhZnRlciBBSVNCIGFuZCBBSUJWLiAg
Cgo+IFdpdGggdGhpcyBjbGVhcmVkOgoKSSBob3BlLCBJIG1hbmFnZWQgdG8gY2xlYXIgdGhpcyB1
cCBhIGJpdC4gSWYgbm90IHBsZWFzZSB0cnkgdG8gcmUtc3RhdGUKeW91ciBjb25jZXJuIGluIGRp
ZmZlcmVudCB3b3Jkcy4KCj4gUmV2aWV3ZWQtYnk6IFBpZXJyZSBNb3JlbDxwbW9yZWxAbGludXgu
aWJtLmNvbT4KPiAKClRoYW5rcyBmb3IgeW91ciByZXZpZXchCgpIYWxpbAogCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWls
aW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6
Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRp
b24=
