Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A2518A043
	for <lists.virtualization@lfdr.de>; Wed, 18 Mar 2020 17:14:20 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 2EC2A8484B;
	Wed, 18 Mar 2020 16:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e2REoqPwOKGY; Wed, 18 Mar 2020 16:14:18 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by fraxinus.osuosl.org (Postfix) with ESMTP id 9228985FB0;
	Wed, 18 Mar 2020 16:14:18 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 7640CC013E;
	Wed, 18 Mar 2020 16:14:18 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 08786C18DA
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 16:14:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id EAE5C85F05
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 16:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6auyzHWoQ8Vs
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 16:14:15 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-74.mimecast.com
 (us-smtp-delivery-74.mimecast.com [216.205.24.74])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id A8FB585FD5
 for <virtualization@lists.linux-foundation.org>;
 Wed, 18 Mar 2020 16:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584548054;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=eDe76/dPVTlAY0pMxJYOxoOArILZGQaaQEnMzt+k944=;
 b=fQSvhCSozXj/qehdQwWy7weo00kcv3dxRaxIrGmUhqW4W6kqX0iBD/IT03/rM4DHkKyXNZ
 hq3Ss2qdi85gSHU+SsEsJz8i9IpNMpiJUS6XKpiDChEeqNQVh4hC0DVDJRFykw/hsKehiA
 CxnX9bFVBJokD2k1ea9R2dmyYMEQbWQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-e9P5Y6jkNBKLlGf17_eIBA-1; Wed, 18 Mar 2020 12:14:12 -0400
X-MC-Unique: e9P5Y6jkNBKLlGf17_eIBA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7944C18FF663;
 Wed, 18 Mar 2020 16:14:11 +0000 (UTC)
Received: from [10.36.113.142] (ovpn-113-142.ams2.redhat.com [10.36.113.142])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 924D28B75D;
 Wed, 18 Mar 2020 16:14:06 +0000 (UTC)
Subject: Re: [PATCH] iommu/virtio: Reject IOMMU page granule larger than
 PAGE_SIZE
To: Robin Murphy <robin.murphy@arm.com>,
 Jean-Philippe Brucker <jean-philippe@linaro.org>,
 iommu@lists.linux-foundation.org, virtualization@lists.linux-foundation.org
References: <20200318114047.1518048-1-jean-philippe@linaro.org>
 <f1f3d844-8080-d26d-200e-a38480895480@arm.com>
From: Auger Eric <eric.auger@redhat.com>
Message-ID: <09a32736-ea01-21f9-6bd5-9344b368f90a@redhat.com>
Date: Wed, 18 Mar 2020 17:14:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <f1f3d844-8080-d26d-200e-a38480895480@arm.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Cc: joro@8bytes.org, Bharat Bhushan <bbhushan2@marvell.com>
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

SGksCgpPbiAzLzE4LzIwIDE6MDAgUE0sIFJvYmluIE11cnBoeSB3cm90ZToKPiBPbiAyMDIwLTAz
LTE4IDExOjQwIGFtLCBKZWFuLVBoaWxpcHBlIEJydWNrZXIgd3JvdGU6Cj4+IFdlIGRvbid0IGN1
cnJlbnRseSBzdXBwb3J0IElPTU1VcyB3aXRoIGEgcGFnZSBncmFudWxlIGxhcmdlciB0aGFuIHRo
ZQo+PiBzeXN0ZW0gcGFnZSBzaXplLiBUaGUgSU9WQSBhbGxvY2F0b3IgaGFzIGEgQlVHX09OKCkg
aW4gdGhpcyBjYXNlLCBhbmQKPj4gVkZJTyBoYXMgYSBXQVJOX09OKCkuCgpBZGRpbmcgQWxleCBp
biBDQyBpbiBjYXNlIGhlIGhhcyB0aW1lIHRvIGp1bXAgaW4uIEF0IHRoZSBtb21lbnQgSSBkb24n
dApnZXQgd2h5IHRoaXMgV0FSTl9PTigpIGlzIGhlcmUuCgpUaGlzIHdhcyBpbnRyb2R1Y2VkIGlu
CmM4ZGJjYTE2NWJiMDkwZjkyNjk5NmE1NzJlYTJiNWI1NzdiMzRiNzAgdmZpby9pb21tdV90eXBl
MTogQXZvaWQgb3ZlcmZsb3cKCj4+Cj4+IEl0IG1pZ2h0IGJlIHBvc3NpYmxlIHRvIHJlbW92ZSB0
aGVzZSBvYnN0YWNsZXMgaWYgbmVjZXNzYXJ5LiBJZiB0aGUgaG9zdAo+PiB1c2VzIDY0a0IgcGFn
ZXMgYW5kIHRoZSBndWVzdCB1c2VzIDRrQiwgdGhlbiBhIGRldmljZSBkcml2ZXIgY2FsbGluZwo+
PiBhbGxvY19wYWdlKCkgZm9sbG93ZWQgYnkgZG1hX21hcF9wYWdlKCkgd2lsbCBjcmVhdGUgYSA2
NGtCIG1hcHBpbmcgZm9yIGEKPj4gNGtCIHBoeXNpY2FsIHBhZ2UsIGFsbG93aW5nIHRoZSBlbmRw
b2ludCB0byBhY2Nlc3MgdGhlIG5laWdoYm91cmluZyA2MGtCCj4+IG9mIG1lbW9yeS4gVGhpcyBw
cm9ibGVtIGNvdWxkIGJlIHdvcmtlZCBhcm91bmQgd2l0aCBib3VuY2UgYnVmZmVycy4KPiAKPiBG
V0lXIHRoZSBmdW5kYW1lbnRhbCBpc3N1ZSBpcyB0aGF0IGNhbGxlcnMgb2YgaW9tbXVfbWFwKCkg
bWF5IGV4cGVjdCB0bwo+IGJlIGFibGUgdG8gbWFwIHR3byBvciBtb3JlIHBhZ2UtYWxpZ25lZCBy
ZWdpb25zIGRpcmVjdGx5IGFkamFjZW50IHRvCj4gZWFjaCBvdGhlciBmb3Igc2NhdHRlci1nYXRo
ZXIgcHVycG9zZXMgKG9yIHJpbmcgYnVmZmVyIHRyaWNrcyksIGFuZAo+IHRoYXQncyBqdXN0IG5v
dCBwb3NzaWJsZSBpZiB0aGUgSU9NTVUgZ3JhbnVsZSBpcyB0b28gYmlnLiBCb3VuY2UKPiBidWZm
ZXJpbmcgd291bGQgYmUgYSB2aWFibGUgd29ya2Fyb3VuZCBmb3IgdGhlIHN0cmVhbWluZyBETUEg
QVBJIGFuZAo+IGNlcnRhaW4gc2ltaWxhciB1c2UtY2FzZXMsIGJ1dCBub3QgaW4gZ2VuZXJhbCAo
ZS5nLiBjb2hlcmVudCBETUEsIFZGSU8sCj4gR1BVcywgZXRjLikKPiAKPiBSb2Jpbi4KPiAKPj4g
Rm9yIHRoZSBtb21lbnQsIHJhdGhlciB0aGFuIHRyaWdnZXJpbmcgdGhlIElPVkEgQlVHX09OKCkg
b24gbWlzbWF0Y2hlZAo+PiBwYWdlIHNpemVzLCBhYm9ydCB0aGUgdmlydGlvLWlvbW11IHByb2Jl
IHdpdGggYW4gZXJyb3IgbWVzc2FnZS4KCkkgdW5kZXJzdGFuZCB0aGlzIGlzIGEgaW50cm9kdWNl
ZCBhcyBhIHRlbXBvcmFyeSBzb2x1dGlvbiBidXQgdGhpcwpzb3VuZHMgYXMgYW4gaW1wb3J0YW50
IGxpbWl0YXRpb24gdG8gbWUuIEZvciBpbnN0YW5jZSB0aGlzIHdpbGwgcHJldmVudApmcm9tIHJ1
bm5pbmcgYSBmZWRvcmEgZ3Vlc3QgZXhwb3NlZCB3aXRoIGEgdmlydGlvLWlvbW11IHdpdGggYSBS
SEVMIGhvc3QuCgpUaGFua3MKCkVyaWMKPj4KPj4gUmVwb3J0ZWQtYnk6IEJoYXJhdCBCaHVzaGFu
IDxiYmh1c2hhbjJAbWFydmVsbC5jb20+Cj4+IFNpZ25lZC1vZmYtYnk6IEplYW4tUGhpbGlwcGUg
QnJ1Y2tlciA8amVhbi1waGlsaXBwZUBsaW5hcm8ub3JnPgo+PiAtLS0KPj4gwqAgZHJpdmVycy9p
b21tdS92aXJ0aW8taW9tbXUuYyB8IDkgKysrKysrKysrCj4+IMKgIDEgZmlsZSBjaGFuZ2VkLCA5
IGluc2VydGlvbnMoKykKPj4KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvaW9tbXUvdmlydGlvLWlv
bW11LmMgYi9kcml2ZXJzL2lvbW11L3ZpcnRpby1pb21tdS5jCj4+IGluZGV4IDZkNGUzYzJhMmRk
Yi4uODBkNWQ4ZjYyMWFiIDEwMDY0NAo+PiAtLS0gYS9kcml2ZXJzL2lvbW11L3ZpcnRpby1pb21t
dS5jCj4+ICsrKyBiL2RyaXZlcnMvaW9tbXUvdmlydGlvLWlvbW11LmMKPj4gQEAgLTk5OCw2ICs5
OTgsNyBAQCBzdGF0aWMgaW50IHZpb21tdV9wcm9iZShzdHJ1Y3QgdmlydGlvX2RldmljZSAqdmRl
dikKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpwYXJlbnRfZGV2ID0gdmRldi0+ZGV2LnBh
cmVudDsKPj4gwqDCoMKgwqDCoCBzdHJ1Y3QgdmlvbW11X2RldiAqdmlvbW11ID0gTlVMTDsKPj4g
wqDCoMKgwqDCoCBzdHJ1Y3QgZGV2aWNlICpkZXYgPSAmdmRldi0+ZGV2Owo+PiArwqDCoMKgIHVu
c2lnbmVkIGxvbmcgdmlvbW11X3BhZ2Vfc2l6ZTsKPj4gwqDCoMKgwqDCoCB1NjQgaW5wdXRfc3Rh
cnQgPSAwOwo+PiDCoMKgwqDCoMKgIHU2NCBpbnB1dF9lbmQgPSAtMVVMOwo+PiDCoMKgwqDCoMKg
IGludCByZXQ7Cj4+IEBAIC0xMDI4LDYgKzEwMjksMTQgQEAgc3RhdGljIGludCB2aW9tbXVfcHJv
YmUoc3RydWN0IHZpcnRpb19kZXZpY2UKPj4gKnZkZXYpCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBn
b3RvIGVycl9mcmVlX3ZxczsKPj4gwqDCoMKgwqDCoCB9Cj4+IMKgICvCoMKgwqAgdmlvbW11X3Bh
Z2Vfc2l6ZSA9IDFVTCA8PCBfX2Zmcyh2aW9tbXUtPnBnc2l6ZV9iaXRtYXApOwo+PiArwqDCoMKg
IGlmICh2aW9tbXVfcGFnZV9zaXplID4gUEFHRV9TSVpFKSB7Cj4+ICvCoMKgwqDCoMKgwqDCoCBk
ZXZfZXJyKGRldiwgImdyYW51bGUgMHglbHggbGFyZ2VyIHRoYW4gc3lzdGVtIHBhZ2Ugc2l6ZQo+
PiAweCVseFxuIiwKPj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmlvbW11X3BhZ2Vfc2l6ZSwg
UEFHRV9TSVpFKTsKPj4gK8KgwqDCoMKgwqDCoMKgIHJldCA9IC1FSU5WQUw7Cj4+ICvCoMKgwqDC
oMKgwqDCoCBnb3RvIGVycl9mcmVlX3ZxczsKPj4gK8KgwqDCoCB9Cj4+ICsKPj4gwqDCoMKgwqDC
oCB2aW9tbXUtPm1hcF9mbGFncyA9IFZJUlRJT19JT01NVV9NQVBfRl9SRUFEIHwKPj4gVklSVElP
X0lPTU1VX01BUF9GX1dSSVRFOwo+PiDCoMKgwqDCoMKgIHZpb21tdS0+bGFzdF9kb21haW4gPSB+
MFU7Cj4+IMKgCj4gCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVhbGl6YXRpb25AbGlzdHMubGlu
dXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZvdW5kYXRpb24ub3JnL21haWxt
YW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
