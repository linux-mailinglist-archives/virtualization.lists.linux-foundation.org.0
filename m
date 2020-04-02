Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ECA919BA9F
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 05:23:29 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by hemlock.osuosl.org (Postfix) with ESMTP id 9BB3A87E8A;
	Thu,  2 Apr 2020 03:23:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cKZO5ZZZqUDA; Thu,  2 Apr 2020 03:23:27 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by hemlock.osuosl.org (Postfix) with ESMTP id EAE3087E80;
	Thu,  2 Apr 2020 03:23:26 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CE68FC1D8D;
	Thu,  2 Apr 2020 03:23:26 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from fraxinus.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 820C2C089F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 03:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by fraxinus.osuosl.org (Postfix) with ESMTP id 6B61386D24
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 03:23:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from fraxinus.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AdXo0iqRhKP6
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 03:23:24 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by fraxinus.osuosl.org (Postfix) with ESMTPS id 13E6C86CE0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 03:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585797802;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lo4oQtgFAkpJN5E5vhIt9kZ5uAzDrIArkXhNzR8IY6M=;
 b=HE/q2pIuz2A3Bii6mHl2f4P5lMM3AyKXdjsNR90zMtq4sDCwSYuDzoP0QTy3r8TE/wE15T
 nzZ4Zx9z3H5EEqrUZ9R45IlU8EAm1eP6TJ0h3PCh9sLizumYW/fD62Z/WhOhN1R51RAKyE
 FgryWHi7TybJ8zOBieBK2oyqXRJ0zw8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-LVyMK6ydO8Sv_d3yw-jCFQ-1; Wed, 01 Apr 2020 23:23:18 -0400
X-MC-Unique: LVyMK6ydO8Sv_d3yw-jCFQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 125D218A5511;
 Thu,  2 Apr 2020 03:23:16 +0000 (UTC)
Received: from [10.72.13.209] (ovpn-13-209.pek2.redhat.com [10.72.13.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8EEDE89F0A;
 Thu,  2 Apr 2020 03:22:59 +0000 (UTC)
Subject: Re: [PATCH V9 1/9] vhost: refine vhost and vringh kconfig
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200326140125.19794-1-jasowang@redhat.com>
 <20200326140125.19794-2-jasowang@redhat.com>
 <20200401092004-mutt-send-email-mst@kernel.org>
 <6b4d169a-9962-6014-5423-1507059343e9@redhat.com>
 <20200401100954-mutt-send-email-mst@kernel.org>
 <3dd3b7e7-e3d9-dba4-00fc-868081f95ab7@redhat.com>
 <20200401120643-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <c11c2195-88eb-2096-af47-40f2da5b389f@redhat.com>
Date: Thu, 2 Apr 2020 11:22:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200401120643-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Cc: kvm@vger.kernel.org, mhabets@solarflare.com,
 virtualization@lists.linux-foundation.org, rob.miller@broadcom.com,
 saugatm@xilinx.com, lulu@redhat.com, hanand@xilinx.com, hch@infradead.org,
 eperezma@redhat.com, jgg@mellanox.com, shahafs@mellanox.com,
 parav@mellanox.com, vmireyno@marvell.com, gdawar@xilinx.com, jiri@mellanox.com,
 xiao.w.wang@intel.com, stefanha@redhat.com, zhihong.wang@intel.com,
 zhangweining@ruijie.com.cn, netdev@vger.kernel.org, rdunlap@infradead.org,
 linux-kernel@vger.kernel.org, maxime.coquelin@redhat.com,
 lingshan.zhu@intel.com
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

Ck9uIDIwMjAvNC8yIOS4iuWNiDEyOjA4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
V2VkLCBBcHIgMDEsIDIwMjAgYXQgMTA6Mjk6MzJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gPkZyb20gOWIzYTVkMjNiOGJmNmIwYTExZTY1ZTY4ODMzNWQ3ODJmOGU2YWE1YyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKPj4gRnJvbTogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNv
bT4KPj4gRGF0ZTogV2VkLCAxIEFwciAyMDIwIDIyOjE3OjI3ICswODAwCj4+IFN1YmplY3Q6IFtQ
QVRDSF0gdmhvc3Q6IGxldCBDT05GSUdfVkhPU1QgdG8gYmUgc2VsZWN0ZWQgYnkgZHJpdmVycwo+
Pgo+PiBUaGUgZGVmY29uZmlnIG9uIHNvbWUgYXJjaHMgZW5hYmxlIHZob3N0X25ldCBvciB2aG9z
dF92c29jayBieQo+PiBkZWZhdWx0LiBTbyBpbnN0ZWFkIG9mIGFkZGluZyBDT05GSUdfVkhPU1Q9
bSB0byBhbGwgb2YgdGhvc2UgZmlsZXMsCj4+IHNpbXBseSBsZXR0aW5nIENPTkZJR19WSE9TVCB0
byBiZSBzZWxlY3RlZCBieSBhbGwgb2YgdGhlIHZob3N0Cj4+IGRyaXZlcnMuIFRoaXMgZml4ZXMg
dGhlIGJ1aWxkIG9uIHRoZSBhcmNocyB3aXRoIENPTkZJR19WSE9TVF9ORVQ9bSBpbgo+PiB0aGVp
ciBkZWZjb25maWcuCj4+Cj4+IFNpZ25lZC1vZmYtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJl
ZGhhdC5jb20+Cj4+IC0tLQo+PiAgIGRyaXZlcnMvdmhvc3QvS2NvbmZpZyB8IDE1ICsrKysrKysr
KysrLS0tLQo+PiAgIDEgZmlsZSBjaGFuZ2VkLCAxMSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9u
cygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC9LY29uZmlnIGIvZHJpdmVycy92
aG9zdC9LY29uZmlnCj4+IGluZGV4IDI1MjNhMWQ0MjkwYS4uMzYyYjgzMmY1MzM4IDEwMDY0NAo+
PiAtLS0gYS9kcml2ZXJzL3Zob3N0L0tjb25maWcKPj4gKysrIGIvZHJpdmVycy92aG9zdC9LY29u
ZmlnCj4+IEBAIC0xMSwxOSArMTEsMjMgQEAgY29uZmlnIFZIT1NUX1JJTkcKPj4gICAJICBUaGlz
IG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdoaWNoIG5lZWRzIHRvIGFjY2Vzcwo+
PiAgIAkgIHRoZSBob3N0IHNpZGUgb2YgYSB2aXJ0aW8gcmluZy4KPj4gICAKPj4gLW1lbnVjb25m
aWcgVkhPU1QKPj4gLQl0cmlzdGF0ZSAiSG9zdCBrZXJuZWwgYWNjZWxlcmF0b3IgZm9yIHZpcnRp
byAoVkhPU1QpIgo+PiAtCWRlcGVuZHMgb24gRVZFTlRGRAo+PiArY29uZmlnIFZIT1NUCj4+ICsJ
dHJpc3RhdGUKPj4gICAJc2VsZWN0IFZIT1NUX0lPVExCCj4+ICAgCWhlbHAKPj4gICAJICBUaGlz
IG9wdGlvbiBpcyBzZWxlY3RlZCBieSBhbnkgZHJpdmVyIHdoaWNoIG5lZWRzIHRvIGFjY2Vzcwo+
PiAgIAkgIHRoZSBjb3JlIG9mIHZob3N0Lgo+PiAgIAo+PiAtaWYgVkhPU1QKPj4gK21lbnVjb25m
aWcgVkhPU1RfTUVOVQo+PiArCWJvb2wgIlZIT1NUIGRyaXZlcnMiCj4+ICsJZGVmYXVsdCB5Cj4+
ICsKPj4gK2lmIFZIT1NUX01FTlUKPj4gICAKPj4gICBjb25maWcgVkhPU1RfTkVUCj4+ICAgCXRy
aXN0YXRlICJIb3N0IGtlcm5lbCBhY2NlbGVyYXRvciBmb3IgdmlydGlvIG5ldCIKPj4gICAJZGVw
ZW5kcyBvbiBORVQgJiYgRVZFTlRGRCAmJiAoVFVOIHx8ICFUVU4pICYmIChUQVAgfHwgIVRBUCkK
Pj4gKwlzZWxlY3QgVkhPU1QKPj4gICAJLS0taGVscC0tLQo+PiAgIAkgIFRoaXMga2VybmVsIG1v
ZHVsZSBjYW4gYmUgbG9hZGVkIGluIGhvc3Qga2VybmVsIHRvIGFjY2VsZXJhdGUKPj4gICAJICBn
dWVzdCBuZXR3b3JraW5nIHdpdGggdmlydGlvX25ldC4gTm90IHRvIGJlIGNvbmZ1c2VkIHdpdGgg
dmlydGlvX25ldAo+PiBAQCAtMzUsNiArMzksNyBAQCBjb25maWcgVkhPU1RfTkVUCj4+ICAgY29u
ZmlnIFZIT1NUX1NDU0kKPj4gICAJdHJpc3RhdGUgIlZIT1NUX1NDU0kgVENNIGZhYnJpYyBkcml2
ZXIiCj4+ICAgCWRlcGVuZHMgb24gVEFSR0VUX0NPUkUgJiYgRVZFTlRGRAo+PiArCXNlbGVjdCBW
SE9TVAo+PiAgIAlkZWZhdWx0IG4KPj4gICAJLS0taGVscC0tLQo+PiAgIAlTYXkgTSBoZXJlIHRv
IGVuYWJsZSB0aGUgdmhvc3Rfc2NzaSBUQ00gZmFicmljIG1vZHVsZQo+PiBAQCAtNDMsNiArNDgs
NyBAQCBjb25maWcgVkhPU1RfU0NTSQo+PiAgIGNvbmZpZyBWSE9TVF9WU09DSwo+PiAgIAl0cmlz
dGF0ZSAidmhvc3QgdmlydGlvLXZzb2NrIGRyaXZlciIKPj4gICAJZGVwZW5kcyBvbiBWU09DS0VU
UyAmJiBFVkVOVEZECj4+ICsJc2VsZWN0IFZIT1NUCj4+ICAgCXNlbGVjdCBWSVJUSU9fVlNPQ0tF
VFNfQ09NTU9OCj4+ICAgCWRlZmF1bHQgbgo+PiAgIAktLS1oZWxwLS0tCj4+IEBAIC01Niw2ICs2
Miw3IEBAIGNvbmZpZyBWSE9TVF9WU09DSwo+PiAgIGNvbmZpZyBWSE9TVF9WRFBBCj4+ICAgCXRy
aXN0YXRlICJWaG9zdCBkcml2ZXIgZm9yIHZEUEEtYmFzZWQgYmFja2VuZCIKPj4gICAJZGVwZW5k
cyBvbiBFVkVOVEZECj4+ICsJc2VsZWN0IFZIT1NUCgoKVGhpcyBwYXJ0IGlzIG5vdCBzcXVhc2hl
ZC4KCgo+PiAgIAlzZWxlY3QgVkRQQQo+PiAgIAloZWxwCj4+ICAgCSAgVGhpcyBrZXJuZWwgbW9k
dWxlIGNhbiBiZSBsb2FkZWQgaW4gaG9zdCBrZXJuZWwgdG8gYWNjZWxlcmF0ZQo+IE9LIHNvIEkg
c3F1YXNoZWQgdGhpcyBpbnRvIHRoZSBvcmlnaW5hbCBidWdneSBwYXRjaC4KPiBDb3VsZCB5b3Ug
cGxlYXNlIHBsYXkgd2l0aCB2aG9zdCBicmFuY2ggb2YgbXkgdHJlZSBvbiB2YXJpb3VzCj4gYXJj
aGVzPyBJZiBpdCBsb29rcyBvayB0byB5b3UgbGV0IG1lIGtub3cgSSdsbCBwdXNoCj4gdGhpcyB0
byBuZXh0LgoKCldpdGggdGhlIGFib3ZlIHBhcnQgc3F1YXNoZWQuIEkndmUgdGVzdGVkIGFsbCB0
aGUgYXJjaHMgd2hvc2UgZGVmY29uZmlnIApoYXZlIFZIT1NUX05FVCBvciBWSE9TVF9WU09DSyBl
bmFibGVkLgoKQWxsIGxvb2tzIGZpbmUuCgpUaGFua3MKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0
dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4
Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
