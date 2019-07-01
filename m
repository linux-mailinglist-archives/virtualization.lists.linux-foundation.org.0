Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF021B3BE
	for <lists.virtualization@lfdr.de>; Mon, 13 May 2019 12:15:20 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id 2E134C64;
	Mon, 13 May 2019 10:15:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id CD6DAB9E
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 10:15:13 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2DFA182C
	for <virtualization@lists.linux-foundation.org>;
	Mon, 13 May 2019 10:15:13 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
	[10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 78CDF3082B4D;
	Mon, 13 May 2019 10:15:12 +0000 (UTC)
Received: from gondolin (dhcp-192-222.str.redhat.com [10.33.192.222])
	by smtp.corp.redhat.com (Postfix) with ESMTP id BD17560BEC;
	Mon, 13 May 2019 10:15:04 +0000 (UTC)
Date: Mon, 13 May 2019 12:15:02 +0200
From: Cornelia Huck <cohuck@redhat.com>
To: Pierre Morel <pmorel@linux.ibm.com>
Subject: Re: [PATCH 08/10] virtio/s390: add indirection to indicators access
Message-ID: <20190513121502.34d3dc62.cohuck@redhat.com>
In-Reply-To: <89074bc5-78ee-a2e3-0546-791a465f83bd@linux.ibm.com>
References: <20190426183245.37939-1-pasic@linux.ibm.com>
	<20190426183245.37939-9-pasic@linux.ibm.com>
	<716d47ca-016f-e8f4-6d78-7746a7d9f6ba@linux.ibm.com>
	<a4bf1976-8037-63bb-2cf6-c389edbd2e89@linux.ibm.com>
	<20190509202600.4fd6aebe.pasic@linux.ibm.com>
	<c1e03cf0-3773-de00-10ae-d092ffe7ccc5@linux.ibm.com>
	<20190510135421.5363f14a.pasic@linux.ibm.com>
	<89074bc5-78ee-a2e3-0546-791a465f83bd@linux.ibm.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Mon, 13 May 2019 10:15:12 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

T24gRnJpLCAxMCBNYXkgMjAxOSAxNzozNjowNSArMDIwMApQaWVycmUgTW9yZWwgPHBtb3JlbEBs
aW51eC5pYm0uY29tPiB3cm90ZToKCj4gT24gMTAvMDUvMjAxOSAxMzo1NCwgSGFsaWwgUGFzaWMg
d3JvdGU6Cj4gPiBPbiBGcmksIDEwIE1heSAyMDE5IDA5OjQzOjA4ICswMjAwCj4gPiBQaWVycmUg
TW9yZWwgPHBtb3JlbEBsaW51eC5pYm0uY29tPiB3cm90ZToKPiA+ICAgCj4gPj4gT24gMDkvMDUv
MjAxOSAyMDoyNiwgSGFsaWwgUGFzaWMgd3JvdGU6ICAKPiA+Pj4gT24gVGh1LCA5IE1heSAyMDE5
IDE0OjAxOjAxICswMjAwCj4gPj4+IFBpZXJyZSBNb3JlbCA8cG1vcmVsQGxpbnV4LmlibS5jb20+
IHdyb3RlOgo+ID4+PiAgCj4gPj4+PiBPbiAwOC8wNS8yMDE5IDE2OjMxLCBQaWVycmUgTW9yZWwg
d3JvdGU6ICAKPiA+Pj4+PiBPbiAyNi8wNC8yMDE5IDIwOjMyLCBIYWxpbCBQYXNpYyB3cm90ZTog
IAo+ID4+Pj4+PiBUaGlzIHdpbGwgY29tZSBpbiBoYW5keSBzb29uIHdoZW4gd2UgcHVsbCBvdXQg
dGhlIGluZGljYXRvcnMgZnJvbQo+ID4+Pj4+PiB2aXJ0aW9fY2N3X2RldmljZSB0byBhIG1lbW9y
eSBhcmVhIHRoYXQgaXMgc2hhcmVkIHdpdGggdGhlIGh5cGVydmlzb3IKPiA+Pj4+Pj4gKGluIHBh
cnRpY3VsYXIgZm9yIHByb3RlY3RlZCB2aXJ0dWFsaXphdGlvbiBndWVzdHMpLgo+ID4+Pj4+Pgo+
ID4+Pj4+PiBTaWduZWQtb2ZmLWJ5OiBIYWxpbCBQYXNpYyA8cGFzaWNAbGludXguaWJtLmNvbT4K
PiA+Pj4+Pj4gLS0tCj4gPj4+Pj4+ICAgwqAgZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3
LmMgfCA0MAo+ID4+Pj4+PiArKysrKysrKysrKysrKysrKysrKysrKysrLS0tLS0tLS0tLS0tLS0t
Cj4gPj4+Pj4+ICAgwqAgMSBmaWxlIGNoYW5nZWQsIDI1IGluc2VydGlvbnMoKyksIDE1IGRlbGV0
aW9ucygtKQo+ID4+Pj4+Pgo+ID4+Pj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9zMzkwL3ZpcnRp
by92aXJ0aW9fY2N3LmMKPiA+Pj4+Pj4gYi9kcml2ZXJzL3MzOTAvdmlydGlvL3ZpcnRpb19jY3cu
Ywo+ID4+Pj4+PiBpbmRleCBiYjdhOTIzMTZmYzguLjFmM2U3ZDU2OTI0ZiAxMDA2NDQKPiA+Pj4+
Pj4gLS0tIGEvZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMKPiA+Pj4+Pj4gKysrIGIv
ZHJpdmVycy9zMzkwL3ZpcnRpby92aXJ0aW9fY2N3LmMKPiA+Pj4+Pj4gQEAgLTY4LDYgKzY4LDE2
IEBAIHN0cnVjdCB2aXJ0aW9fY2N3X2RldmljZSB7Cj4gPj4+Pj4+ICAgwqDCoMKgwqDCoCB2b2lk
ICphaXJxX2luZm87Cj4gPj4+Pj4+ICAgwqAgfTsKPiA+Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgdW5z
aWduZWQgbG9uZyAqaW5kaWNhdG9ycyhzdHJ1Y3QgdmlydGlvX2Njd19kZXZpY2UgKnZjZGV2KQo+
ID4+Pj4+PiArewo+ID4+Pj4+PiArwqDCoMKgIHJldHVybiAmdmNkZXYtPmluZGljYXRvcnM7Cj4g
Pj4+Pj4+ICt9Cj4gPj4+Pj4+ICsKPiA+Pj4+Pj4gK3N0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9u
ZyAqaW5kaWNhdG9yczIoc3RydWN0IHZpcnRpb19jY3dfZGV2aWNlCj4gPj4+Pj4+ICp2Y2RldikK
PiA+Pj4+Pj4gK3sKPiA+Pj4+Pj4gK8KgwqDCoCByZXR1cm4gJnZjZGV2LT5pbmRpY2F0b3JzMjsK
PiA+Pj4+Pj4gK30KPiA+Pj4+Pj4gKwo+ID4+Pj4+PiAgIMKgIHN0cnVjdCB2cV9pbmZvX2Jsb2Nr
X2xlZ2FjeSB7Cj4gPj4+Pj4+ICAgwqDCoMKgwqDCoCBfX3U2NCBxdWV1ZTsKPiA+Pj4+Pj4gICDC
oMKgwqDCoMKgIF9fdTMyIGFsaWduOwo+ID4+Pj4+PiBAQCAtMzM3LDE3ICszNDcsMTcgQEAgc3Rh
dGljIHZvaWQgdmlydGlvX2Njd19kcm9wX2luZGljYXRvcihzdHJ1Y3QKPiA+Pj4+Pj4gdmlydGlv
X2Njd19kZXZpY2UgKnZjZGV2LAo+ID4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBjY3ctPmNk
YSA9IChfX3UzMikodW5zaWduZWQgbG9uZykgdGhpbmludF9hcmVhOwo+ID4+Pj4+PiAgIMKgwqDC
oMKgwqAgfSBlbHNlIHsKPiA+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgLyogcGF5bG9hZCBp
cyB0aGUgYWRkcmVzcyBvZiB0aGUgaW5kaWNhdG9ycyAqLwo+ID4+Pj4+PiAtwqDCoMKgwqDCoMKg
wqAgaW5kaWNhdG9ycCA9IGttYWxsb2Moc2l6ZW9mKCZ2Y2Rldi0+aW5kaWNhdG9ycyksCj4gPj4+
Pj4+ICvCoMKgwqDCoMKgwqDCoCBpbmRpY2F0b3JwID0ga21hbGxvYyhzaXplb2YoaW5kaWNhdG9y
cyh2Y2RldikpLAo+ID4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIEdGUF9ETUEgfCBHRlBfS0VSTkVMKTsKPiA+Pj4+Pj4gICDCoMKgwqDCoMKgwqDC
oMKgwqAgaWYgKCFpbmRpY2F0b3JwKQo+ID4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIHJldHVybjsKPiA+Pj4+Pj4gICDCoMKgwqDCoMKgwqDCoMKgwqAgKmluZGljYXRvcnAgPSAw
Owo+ID4+Pj4+PiAgIMKgwqDCoMKgwqDCoMKgwqDCoCBjY3ctPmNtZF9jb2RlID0gQ0NXX0NNRF9T
RVRfSU5EOwo+ID4+Pj4+PiAtwqDCoMKgwqDCoMKgwqAgY2N3LT5jb3VudCA9IHNpemVvZigmdmNk
ZXYtPmluZGljYXRvcnMpOwo+ID4+Pj4+PiArwqDCoMKgwqDCoMKgwqAgY2N3LT5jb3VudCA9IHNp
emVvZihpbmRpY2F0b3JzKHZjZGV2KSk7ICAKPiA+Pj4+Pgo+ID4+Pj4+IFRoaXMgbG9va3Mgc3Ry
YW5nZSB0byBtZS4gV2FzIGFscmVhZHkgd2VpcmQgYmVmb3JlLgo+ID4+Pj4+IEx1Y2t5IHdlIGFy
ZSBpbmRpY2F0b3JzIGFyZSBsb25nLi4uCj4gPj4+Pj4gbWF5IGJlIGp1c3Qgc2l6ZW9mKGxvbmcp
ICAKPiA+Pj4+ICAKPiA+Pj4KPiA+Pj4gSSdtIG5vdCBzdXJlIEkgdW5kZXJzdGFuZCB3aGVyZSBh
cmUgeW91IGNvbWluZyBmcm9tLi4uCj4gPj4+Cj4gPj4+IFdpdGggQ0NXX0NNRF9TRVRfSU5EIHdl
IHRlbGwgdGhlIGh5cGVydmlzb3IgdGhlIGd1ZXN0IHBoeXNpY2FsIGFkZHJlc3MKPiA+Pj4gYXQg
d2hpY2ggdGhlIHNvIGNhbGxlZCBjbGFzc2ljIGluZGljYXRvcnMuIFRoZXJlIGlzIGEgY29tbWVu
dCB0aGF0Cj4gPj4+IG1ha2VzIHRoaXMgb2J2aW91cy4gVGhlIGFyZ3VtZW50IG9mIHRoZSBzaXpl
b2Ygd2FzIGFuZCByZW1haW5lZCBhCj4gPj4+IHBvaW50ZXIgdHlwZS4gQUZBSVUgdGhpcyBpcyB3
aGF0IGJvdGhlcnMgeW91LiAgCj4gPj4+Pgo+ID4+Pj4gQUZBSUsgdGhlIHNpemUgb2YgdGhlIGlu
ZGljYXRvcnMgKEFJVi9BSVMpIGlzIG5vdCByZXN0cmljdGVkIGJ5IHRoZQo+ID4+Pj4gYXJjaGl0
ZWN0dXJlLiAgCj4gPj4+Cj4gPj4+IFRoZSBzaXplIG9mIHZjZGV2LT5pbmRpY2F0b3JzIGlzIHJl
c3RyaWN0ZWQgb3IgZGVmaW5lZCBieSB0aGUgdmlydGlvCj4gPj4+IHNwZWNpZmljYXRpb24uIFBs
ZWFzZSBoYXZlIGEgbG9vayBhdCAnNC4zLjIuNi4xIFNldHRpbmcgVXAgQ2xhc3NpYyBRdWV1ZQo+
ID4+PiBJbmRpY2F0b3JzJyBoZXJlOgo+ID4+PiBodHRwczovL2RvY3Mub2FzaXMtb3Blbi5vcmcv
dmlydGlvL3ZpcnRpby92MS4xL2NzMDEvdmlydGlvLXYxLjEtY3MwMS5odG1sI3gxLTE2MzAwMDIK
PiA+Pj4KPiA+Pj4gU2luY2Ugd2l0aCBMaW51eCBvbiBzMzkwIG9ubHkgNjQgYml0IGlzIHN1cHBv
cnRlZCwgYm90aCB0aGUgc2l6ZXMgYXJlIGluCj4gPj4+IGxpbmUgd2l0aCB0aGUgc3BlY2lmaWNh
dGlvbi4gVXNpbmcgdTY0IHdvdWxkIHNlbWFudGljYWxseSBtYXRjaCB0aGUgc3BlYwo+ID4+PiBi
ZXR0ZXIsIG1vZHVsbyBwcmUgdmlydGlvIDEuMCB3aGljaCBhaW4ndCBzcGVjaWZpZWQuIEkgZGlk
IG5vdCB3YW50IHRvCj4gPj4+IGRvIGNoYW5nZXMgdGhhdCBhcmUgbm90IG5lY2Vzc2FyeSBmb3Ig
d2hhdCBJJ20gdHJ5aW5nIHRvIGFjY29tcGxpc2guIElmCj4gPj4+IHdlIHdhbnQgd2UgY2FuIGNo
YW5nZSB0aGVzZSB0byB1NjQgd2l0aCBhIHBhdGNoIG9uIHRvcC4gIAo+ID4+Cj4gPj4gSSBtZWFu
IHlvdSBhcmUgY2hhbmdpbmcgdGhlc2UgbGluZSBhbHJlYWR5LCBzbyB3aHkgbm90IGRvaW5nIGl0
IHJpZ2h0Cj4gPj4gd2hpbGUgYXQgaXQ/Cj4gPj4gIAo+ID4gCj4gPiBUaGlzIHBhdGNoIGlzIGFi
b3V0IGFkZGluZyB0aGUgaW5kaXJlY3Rpb24gc28gd2UgY2FuIG1vdmUgdGhlIG1lbWJlcgo+ID4g
cGFpbmxlc3NseS4gTWl4aW5nIGluIGRpZmZlcmVudCBzdHVmZiB3b3VsZCBiZSBhIGJhZCBwcmFj
dGljZS4KPiA+IAo+ID4gQlRXIEkganVzdCBleHBsYWluZWQgdGhhdCBpdCBhaW4ndCB3cm9uZywg
c28gSSByZWFsbHkgZG8gbm90IHVuZGVyc3RhbmQKPiA+IHdoYXQgZG8geW91IG1lYW4gYnkgICd3
aHkgbm90IGRvaW5nIGl0IHJpZ2h0Jy4gQ2FuIHlvdSBwbGVhc2UgZXhwbGFpbj8KPiA+ICAgCj4g
Cj4gSSBkaWQgbm90IHdhbnRlZCB0byBkaXNjdXNzIGEgbG9uZyB0aW1lIG9uIHRoaXMgYW5kIGdh
dmUgbXkgUi1CLCBzbyAKPiBtZWFuaW5nIHRoYXQgSSBhbSBPSyB3aXRoIHRoaXMgcGF0Y2guCj4g
Cj4gQnV0IGlmIHlvdSBhc2ssIHllcyBJIGNhbiwgaXQgc2VlbXMgcXVpdGUgb2J2aW91cy4KPiBX
aGVuIHlvdSBidWlsZCBhIENDVyB5b3UgZ2l2ZSB0aGUgcG9pbnRlciB0byBDQ1ctPmNkYSBhbmQg
eW91IGdpdmUgdGhlIAo+IHNpemUgb2YgdGhlIHRyYW5zZmVyIGluIENDVy0+Y291bnQuCj4gCj4g
SGVyZSB0aGUgY291bnQgaXMgaW5pdGlhbGl6ZWQgd2l0aCB0aGUgc2l6ZW9mIG9mIHRoZSBwb2lu
dGVyIHVzZWQgdG8gCj4gaW5pdGlhbGl6ZSBDQ1ctPmNkYSB3aXRoLgoKQnV0IHRoZSBjZGEgcG9p
bnRzIHRvIHRoZSBwb2ludGVyIGFkZHJlc3MsIHNvIHRoZSBzaXplIG9mIHRoZSBwb2ludGVyCmlz
IGFjdHVhbGx5IHRoZSBjb3JyZWN0IHZhbHVlIGhlcmUsIGlzbid0IGl0PwoKPiBMdWtpbHkgd2Ug
d29yayBvbiBhIDY0IGJpdHMgbWFjaGluZSB3aXRoIDY0IGJpdHMgcG9pbnRlcnMgYW5kIHRoZSBz
aXplIAo+IG9mIHRoZSBwb2ludGVkIG9iamVjdCBpcyA2NCBiaXRzIHdpZGUgc28uLi4gdGhlIHJl
c3VsdGluZyBjb3VudCBpcyByaWdodC4KPiBCdXQgaXQgaXMgbm90IHRoZSBjb3JyZWN0IHdheSB0
byBkbyBpdC4KCkkgdGhpbmsgaXQgaXMsIGJ1dCB0aGlzIGludGVyZmFjZSByZWFsbHkgaXMgY29u
ZnVzaW5nLgoKPiBUaGF0IGlzIGFsbC4gTm90IGEgYmlnIGNvbmNlcm4sIHlvdSBkbyBub3QgbmVl
ZCB0byBjaGFuZ2UgaXQsIGFzIHlvdSAKPiBzYWlkIGl0IGNhbiBiZSBkb25lIGluIGFub3RoZXIg
cGF0Y2guCj4gCj4gPiBEaWQgeW91IGFncmVlIHdpdGggdGhlIHJlc3Qgb2YgbXkgY29tbWVudD8g
SSBtZWFuIHRoZXJlIHdhcyBtb3JlIHRvIGl0Lgo+ID4gICAKPiAKPiBJIHVuZGVyc3Rvb2QgZnJv
bSB5b3VyIGNvbW1lbnRzIHRoYXQgdGhlIGluZGljYXRvcnMgaW4gTGludXggYXJlIDY0Yml0cyAK
PiB3aWRlIHNvIGFsbCBPSy4KPiAKPiBSZWdhcmRzCj4gUGllcnJlCj4gCj4gCj4gCj4gCj4gCj4g
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFs
aXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlv
bi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8v
dmlydHVhbGl6YXRpb24=
