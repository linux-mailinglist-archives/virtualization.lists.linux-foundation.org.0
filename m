Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F7D21A0ECC
	for <lists.virtualization@lfdr.de>; Tue,  7 Apr 2020 16:00:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 4B27F87813;
	Tue,  7 Apr 2020 14:00:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P4SqTyUajyTA; Tue,  7 Apr 2020 14:00:21 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 7006C87D51;
	Tue,  7 Apr 2020 14:00:21 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 37248C0177;
	Tue,  7 Apr 2020 14:00:21 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id BF930C0177
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 14:00:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id BA89B2048F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 14:00:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eOfbtV4+jWuV
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 14:00:17 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 by silver.osuosl.org (Postfix) with ESMTPS id 14118203D6
 for <virtualization@lists.linux-foundation.org>;
 Tue,  7 Apr 2020 14:00:17 +0000 (UTC)
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
 by mx2.suse.de (Postfix) with ESMTP id E3B4AADCD;
 Tue,  7 Apr 2020 14:00:13 +0000 (UTC)
Subject: Re: [PATCH RFC v2 02/24] scsi: allocate separate queue for reserved
 commands
To: John Garry <john.garry@huawei.com>, Christoph Hellwig <hch@infradead.org>
References: <1583857550-12049-1-git-send-email-john.garry@huawei.com>
 <1583857550-12049-3-git-send-email-john.garry@huawei.com>
 <20200310183243.GA14549@infradead.org>
 <79cf4341-f2a2-dcc9-be0d-2efc6e83028a@huawei.com>
 <20200311062228.GA13522@infradead.org>
 <b5a63725-722b-8ccd-3867-6db192a248a4@suse.de>
 <9c6ced82-b3f1-9724-b85e-d58827f1a4a4@huawei.com>
From: Hannes Reinecke <hare@suse.de>
Message-ID: <39bc2d82-2676-e329-5d32-8acb99b0a204@suse.de>
Date: Tue, 7 Apr 2020 16:00:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <9c6ced82-b3f1-9724-b85e-d58827f1a4a4@huawei.com>
Content-Language: en-US
Cc: axboe@kernel.dk, Hannes Reinecke <hare@suse.com>, bvanassche@acm.org,
 martin.petersen@oracle.com, chenxiang66@hisilicon.com, jejb@linux.ibm.com,
 esc.storagedev@microsemi.com, linux-kernel@vger.kernel.org,
 ming.lei@redhat.com, linux-block@vger.kernel.org, linux-scsi@vger.kernel.org,
 virtualization@lists.linux-foundation.org
X-BeenThere: virtualization@lists.linux-foundation.org
X-Mailman-Version: 2.1.15
Precedence: list
List-Id: Linux virtualization <virtualization.lists.linux-foundation.org>
List-Unsubscribe: <https://lists.linuxfoundation.org/mailman/options/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=unsubscribe>
List-Archive: <http://lists.linuxfoundation.org/pipermail/virtualization/>
List-Post: <mailto:virtualization@lists.linux-foundation.org>
List-Help: <mailto:virtualization-request@lists.linux-foundation.org?subject=help>
List-Subscribe: <https://lists.linuxfoundation.org/mailman/listinfo/virtualization>, 
 <mailto:virtualization-request@lists.linux-foundation.org?subject=subscribe>
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gNC83LzIwIDE6NTQgUE0sIEpvaG4gR2Fycnkgd3JvdGU6Cj4gT24gMDYvMDQvMjAyMCAxMDow
NSwgSGFubmVzIFJlaW5lY2tlIHdyb3RlOgo+PiBPbiAzLzExLzIwIDc6MjIgQU0sIENocmlzdG9w
aCBIZWxsd2lnIHdyb3RlOgo+Pj4gT24gVHVlLCBNYXIgMTAsIDIwMjAgYXQgMDk6MDg6NTZQTSAr
MDAwMCwgSm9obiBHYXJyeSB3cm90ZToKPj4+PiBPbiAxMC8wMy8yMDIwIDE4OjMyLCBDaHJpc3Rv
cGggSGVsbHdpZyB3cm90ZToKPj4+Pj4gT24gV2VkLCBNYXIgMTEsIDIwMjAgYXQgMTI6MjU6MjhB
TSArMDgwMCwgSm9obiBHYXJyeSB3cm90ZToKPj4+Pj4+IEZyb206IEhhbm5lcyBSZWluZWNrZSA8
aGFyZUBzdXNlLmNvbT4KPj4+Pj4+Cj4+Pj4+PiBBbGxvY2F0ZSBhIHNlcGFyYXRlICdyZXNlcnZl
ZF9jbWRfcScgZm9yIHNlbmRpbmcgcmVzZXJ2ZWQgY29tbWFuZHMuCj4+Pj4+Cj4+Pj4+IFdoeT/C
oCBSZXNlcnZlZCBjb21tYW5kIHNwZWNpZmljYWxseSBhcmUgbm90IGluIGFueSB3YXkgdGllZCB0
byBxdWV1ZXMuCj4+Pj4+IC4KPj4+Pj4KPj4+Pgo+Pj4+IFNvIHRoZSB2MSBzZXJpZXMgdXNlZCBh
IGNvbWJpbmF0aW9uIG9mIHRoZSBzZGV2IHF1ZXVlIGFuZCB0aGUgcGVyLWhvc3QKPj4+PiByZXNl
cnZlZF9jbWRfcS4gQmFjayB0aGVuIHlvdSBxdWVzdGlvbmVkIHVzaW5nIHRoZSBzZGV2IHF1ZXVl
IGZvciAKPj4+PiB2aXJ0aW8KPj4+PiBzY3NpLCBhbmQgdGhlIHVuY29uZmlybWVkIGNvbmNsdXNp
b24gd2FzIHRvIHVzZSBhIGNvbW1vbiBwZXItaG9zdCBxLiAKPj4+PiBUaGlzIGlzCj4+Pj4gdGhl
IGJlc3QgbGluayBJIGNhbiBmaW5kIG5vdzoKPj4+Pgo+Pj4+IGh0dHBzOi8vd3d3Lm1haWwtYXJj
aGl2ZS5jb20vbGludXgtc2NzaUB2Z2VyLmtlcm5lbC5vcmcvbXNnODMxNzcuaHRtbAo+Pj4KPj4+
IFRoYXQgd2FzIGp1c3QgYSBxdWVzdGlvbiBvbiB3aHkgdmlydGlvIHVzZXMgdGhlIHBlci1kZXZp
Y2UgdGFncywgd2hpY2gKPj4+IGRpZG4ndCBsb29rIGxpa2UgaXQgbWFkZSBhbnkgc2Vuc2UuwqAg
V2hhdCBJJ20gd29ycmllZCBhYm91dCBoZXJlIGlzCj4+PiBtaXhpbmcgdXAgdGhlIGNvbmNlcHQg
b2YgcmVzZXJ2ZWQgdGFncyBpbiB0aGUgdGFnc2V0LCBhbmQgcXVldWVzIHRvIHVzZQo+Pj4gdGhl
bS7CoCBOb3RlIHRoYXQgd2UgYWxyZWFkeSBoYXZlIHRoZSBzY3NpX2dldF9ob3N0X2RldiB0byBh
bGxvY2F0ZQo+Pj4gYSBzY3NpX2RldmljZSBhbmQgdGh1cyBhIHJlcXVlc3RfcXVldWUgZm9yIHRo
ZSBob3N0IGl0c2VsZi7CoCBUaGF0IHNlZW1zCj4+PiBsaWtlIHRoZSBiZXR0ZXIgaW50ZXJmYWNl
IHRvIHVzZSBhIHRhZyBmb3IgYSBob3N0IHdpZGUgY29tbWFuZCB2cwo+Pj4gaW50cm9kdWNpbmcg
YSBwYXJhbGxlbCBwYXRoLgo+Pj4KPj4gVGhpbmtpbmcgYWJvdXQgaXQgc29tZSBtb3JlLCBJIGRv
bid0IHRoaW5rIHRoYXQgc2NzaV9nZXRfaG9zdF9kZXYoKSBpcwo+PiB0aGUgYmVzdCB3YXkgb2Yg
aGFuZGxpbmcgaXQuCj4+IFByb2JsZW0gaXMgdGhhdCBpdCdsbCBjcmVhdGUgYSBuZXcgc2NzaV9k
ZXZpY2Ugd2l0aCA8aG9zdG5vOnRoaXNfaWQ6MD4sCj4+IHdoaWNoIHdpbGwgdGhlbiBzaG93IHVw
IHZpYSBlZyAnbHNzY3NpJy4KPiAKPiBhcmUgeW91IHN1cmU/IERvZXNuJ3QgdGhpcyBmdW5jdGlv
biBqdXN0IGFsbG9jYXRlIHRoZSBzZGV2LCBidXQgZG8gCj4gbm90aGluZyB3aXRoIGl0LCBsaWtl
IHByb2JpbmcgaXQ/Cj4gCj4gSSBibHVkZ2VvbmVkIGl0IGluIGhlcmUgZm9yIFBvQzoKPiAKPiBo
dHRwczovL2dpdGh1Yi5jb20vaGlzaWxpY29uL2tlcm5lbC1kZXYvY29tbWl0L2VmMGFlODU0MDgx
MWUzMjc3NmY2NGE1YjQyYmQ3NmNiZWQxN2JhNDcgCj4gCj4gCj4gQW5kIHRoZW4gc3RpbGw6Cj4g
Cj4gam9obkB1YnVudHU6fiQgbHNzY3NpCj4gWzA6MDowOjBdIGRpc2sgU0VBR0FURcKgIFNUMjAw
ME5NMDA0NcKgIE4wMDTCoCAvZGV2L3NkYQo+IFswOjA6MTowXSBkaXNrIFNFQUdBVEXCoCBTVDIw
MDBOTTAwNDXCoCBOMDA0wqAgL2Rldi9zZGIKPiBbMDowOjI6MF0gZGlzayBBVEFTQU1TVU5HIEhN
MzIwSknCoCAwXzAxwqAgL2Rldi9zZGMKPiBbMDowOjM6MF0gZGlzayBTRUFHQVRFwqAgU1QxMDAw
Tk0wMDIzwqAgMDAwNsKgIC9kZXYvc2RkCj4gWzA6MDo0OjBdIGVuY2xvc3UgSFVBV0VJRXhwYW5k
ZXIgMTJHeDE2wqAgMTI4LQo+IGpvaG5AdWJ1bnR1On4kCj4gCj4gU29tZSBwcm9wZXIgcGx1bWJp
bmcgd291bGQgYmUgbmVlZGVkLCB0aG91Z2guCj4gCj4+IFRoaXMgd291bGQgYmUgb2theSBpZiAn
dGhpc19pZCcgd291bGQgaGF2ZSBiZWVuIGRlZmluZWQgYnkgdGhlIGRyaXZlcjsKPj4gc2FkbHks
IG1vc3QgZHJpdmVycyB3aGljaCBhcmUgYWZmZWN0ZWQgaGVyZSBkbyBzZXQgJ3RoaXNfaWQnIHRv
IC0xLgo+PiBTbyB3ZSB3b3VsZG4ndCBoYXZlIGEgbmljZSB0YXJnZXQgSUQgdG8gYWxsb2NhdGUg
dGhlIGRldmljZSBmcm9tLCBsZXQKPj4gYWxvbmUgdGhlIHByb2JsZW0gdGhhdCB3ZSB3b3VsZCBo
YXZlIHRvIGVtdWxhdGUgYSBjb21wbGV0ZSBzY3NpIGRldmljZQo+PiB3aXRoIGFsbCByZXF1aXJl
ZCBtaW5pbWFsIGNvbW1hbmQgc3VwcG9ydCBldGMuCj4+IEFuZCBJJ20gbm90IHF1aXRlIHN1cmUg
aG93IHdlbGwgdGhhdCB3b3VsZCBwbGF5IHdpdGggdGhlIGV4aXNpbmcgU0NTSQo+PiBob3N0IHRl
bXBsYXRlOyB0aGUgZGV2aWNlIHdlJ2xsIGJlIGFsbG9jYXRpbmcgd291bGQgaGF2ZSBiYXNpY2Fs
bHkKPj4gbm90aGluZyBpbiBjb21tb24gd2l0aCB0aGUgJ25vcm1hbCcgU0NTSSBkZXZpY2VzLgo+
Pgo+PiBXaGF0IHdlIGNvdWxkIGRvLCB0aG91Z2gsIGlzIHRvIHRyeSBpdCB0aGUgb3RoZXIgd2F5
IHJvdW5kOgo+PiBMaWZ0IHRoZSByZXF1ZXN0IHF1ZXVlIGZyb20gc2NzaV9nZXRfaG9zdF9kZXYo
KSBpbnRvIHRoZSBzY3NpIGhvc3QKPj4gaXRzZWxmLCBzbyB0aGF0IHNjc2lfZ2V0X2hvc3RfZGV2
KCkgY2FuIHVzZSB0aGF0IHF1ZXVlLCBidXQgd2UgYWxzbwo+PiB3b3VsZCBiZSBhYmxlIHRvIHVz
ZSBpdCB3aXRob3V0IGEgU0NTSSBkZXZpY2UgYXR0YWNoZWQuCj4gCj4gd291bGRuJ3QgdGhhdCBs
aW1pdCAxeCBzY3NpIGRldmljZSBwZXIgaG9zdCwgbm90IHRoYXQgSSBrbm93IGlmIGFueSBtb3Jl
IAo+IHdvdWxkIGV2ZXIgYmUgcmVxdWlyZWQ/IEJ1dCBpdCBkb2VzIHN0aWxsIHNlZW0gYmV0dGVy
IHRvIHVzZSB0aGUgcmVxdWVzdCAKPiBxdWV1ZSBpbiB0aGUgc2NzaSBkZXZpY2UuCj4gCk15IGNv
bmNlcm4gaXMgdGhpczoKCnN0cnVjdCBzY3NpX2RldmljZSAqc2NzaV9nZXRfaG9zdF9kZXYoc3Ry
dWN0IFNjc2lfSG9zdCAqc2hvc3QpCnsKCVsgLi4gXQoJc3RhcmdldCA9IHNjc2lfYWxsb2NfdGFy
Z2V0KCZzaG9zdC0+c2hvc3RfZ2VuZGV2LCAwLCBzaG9zdC0+dGhpc19pZCk7CglbIC4uIF0KCmFu
ZCB3ZSBoYXZlIHR5cGljYWxseToKCmRyaXZlcnMvc2NzaS9oaXNpX3Nhcy9oaXNpX3Nhc192M19o
dy5jOiAudGhpc19pZCAgICAgICAgICAgICAgICA9IC0xLAoKSXQncyBfdmVyeV8gdW5jb21tb24g
dG8gaGF2ZSBhIG5lZ2F0aXZlIG51bWJlciBhcyB0aGUgU0NTSSB0YXJnZXQgCmRldmljZTsgaW4g
ZmFjdCwgaXQgX2lzXyBhbiB1bnNpZ25lZCBpbnQgYWxyZWFkeS4KCkJ1dCBhbHJpZ2h0LCBJJ2xs
IGdpdmUgaXQgYSBnbzsgbGV0J3Mgc2VlIHdoYXQgSSdsbCBlbmQgdXAgd2l0aC4KCkNoZWVycywK
Ckhhbm5lcwotLSAKRHIuIEhhbm5lcyBSZWluZWNrZSAgICAgICAgICAgIFRlYW1sZWFkIFN0b3Jh
Z2UgJiBOZXR3b3JraW5nCmhhcmVAc3VzZS5kZSAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICArNDkgOTExIDc0MDUzIDY4OApTVVNFIFNvZnR3YXJlIFNvbHV0aW9ucyBHbWJILCBNYXhmZWxk
c3RyLiA1LCA5MDQwOSBOw7xybmJlcmcKSFJCIDM2ODA5IChBRyBOw7xybmJlcmcpLCBHZXNjaMOk
ZnRzZsO8aHJlcjogRmVsaXggSW1lbmTDtnJmZmVyCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFs
aXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91
bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
