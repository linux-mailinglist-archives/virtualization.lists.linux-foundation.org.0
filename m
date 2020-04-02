Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id B06F719C3D1
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 16:18:35 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 53B1583B47;
	Thu,  2 Apr 2020 14:18:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WVcqGFjvqGC6; Thu,  2 Apr 2020 14:18:33 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id BAF278527D;
	Thu,  2 Apr 2020 14:18:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id A1BBDC07FF;
	Thu,  2 Apr 2020 14:18:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 25A40C1D74
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id 03C9C811D0
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id w9Mmd264G9re
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:18:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [207.211.31.81])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 02BE687F74
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 14:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585837109;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jwultuJVHkd9Ea7iycYokx+RDR7CVNFkggWBY1P0GTQ=;
 b=elFAHuR+dXlcqTcpGlPBJ+Uq3fRTPoDu2MAXrlLhrVdXQ9uPI2IzRrlc1KoTRBGwPqhX98
 bJRAt3n9gO03lSjAb0VDQhpkOi1lXbxyKm5vvRnUUeozLWWSPGGCLxsT2zuAuEMr6fnUKh
 tRQCE3D/GWTIT9S5QtB9C8UVUjRb9F0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-17-FMcVsSpPMIurF4xDneMD2A-1; Thu, 02 Apr 2020 10:18:28 -0400
X-MC-Unique: FMcVsSpPMIurF4xDneMD2A-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C1188107BAAB;
 Thu,  2 Apr 2020 14:18:26 +0000 (UTC)
Received: from [10.72.12.172] (ovpn-12-172.pek2.redhat.com [10.72.12.172])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BF1C95D9C9;
 Thu,  2 Apr 2020 14:18:18 +0000 (UTC)
Subject: Re: [PATCH] virtio/test: fix up after IOTLB changes
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200401165100.276039-1-mst@redhat.com>
 <921fe999-e183-058d-722a-1a6a6ab066e0@redhat.com>
 <20200402084021-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <481b8f28-e3a9-dda1-bfb7-df72b11e4073@redhat.com>
Date: Thu, 2 Apr 2020 22:18:16 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200402084021-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvNC8yIOS4i+WNiDg6NTMsIE1pY2hhZWwgUy4gVHNpcmtpbiB3cm90ZToKPiBPbiBU
aHUsIEFwciAwMiwgMjAyMCBhdCAxMjowMTo1NlBNICswODAwLCBKYXNvbiBXYW5nIHdyb3RlOgo+
PiBPbiAyMDIwLzQvMiDkuIrljYgxMjo1MSwgTWljaGFlbCBTLiBUc2lya2luIHdyb3RlOgo+Pj4g
QWxsb3cgYnVpbGRpbmcgdnJpbmdoIHdpdGhvdXQgSU9UTEIgKHRoYXQncyB0aGUgY2FzZSBmb3Ig
dXNlcnNwYWNlCj4+PiBidWlsZHMsIHdpbGwgYmUgdXNlZnVsIGZvciBDQUlGL1ZPRCBkb3duIHRo
ZSByb2FkIHRvbykuCj4+PiBVcGRhdGUgZm9yIEFQSSB0d2Vha3MuCj4+PiBEb24ndCBpbmNsdWRl
IHZyaW5naCB3aXRoIGtlcm5lbCBidWlsZHMuCj4+Cj4+IEknbSBub3QgcXVpdGUgc3VyZSB3ZSBu
ZWVkIHRoaXMuCj4+Cj4+IEUuZyB0aGUgdXNlcnNwYWNlIGFjY2Vzc29yIGlzIG5vdCB1c2VkIGJ5
IENBSUYvVk9QLgo+IFdlbGwgYW55IGV4cG9ydGVkIHN5bWJvbHMgYXJlIGFsd2F5cyBjb21waWxl
ZCBpbiwgcmlnaHQ/Cj4gU28gd2UgY2FuIHNhdmUgc29tZSBrZXJuZWwgbWVtb3J5IGJ5IG5vdCBi
dWlsZGluZyB1bnVzZWQgc3R1ZmYgLi4uCgoKWWVzLCBqdXN0IHdhbnQgdG8gbWVudGlvbiB0aGF0
IHRoZSB0aGVyZSdzIG5vIHVzZXIgZm9yIHVzZXJzcGFjZSAKYWNjZXNzb3JzIG5vdy4KCgo+Cj4K
Pj4+IENjOiBKYXNvbiBXYW5nIDxqYXNvd2FuZ0ByZWRoYXQuY29tPgo+Pj4gQ2M6IEV1Z2VuaW8g
UMOpcmV6IDxlcGVyZXptYUByZWRoYXQuY29tPgo+Pj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBT
LiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPj4+IC0tLQo+Pj4gICAgZHJpdmVycy92aG9zdC90
ZXN0LmMgICB8IDQgKystLQo+Pj4gICAgZHJpdmVycy92aG9zdC92cmluZ2guYyB8IDUgKysrKysK
Pj4+ICAgIGluY2x1ZGUvbGludXgvdnJpbmdoLmggfCAyICsrCj4+PiAgICB0b29scy92aXJ0aW8v
TWFrZWZpbGUgIHwgMyArKy0KPj4+ICAgIDQgZmlsZXMgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygr
KSwgMyBkZWxldGlvbnMoLSkKPj4+Cj4+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC90ZXN0
LmMgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+Pj4gaW5kZXggMzk0ZTJlNWM3NzJkLi45YTNhMDkw
MDVlMDMgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+Pj4gKysrIGIvZHJp
dmVycy92aG9zdC90ZXN0LmMKPj4+IEBAIC0xMjAsNyArMTIwLDcgQEAgc3RhdGljIGludCB2aG9z
dF90ZXN0X29wZW4oc3RydWN0IGlub2RlICppbm9kZSwgc3RydWN0IGZpbGUgKmYpCj4+PiAgICAJ
dnFzW1ZIT1NUX1RFU1RfVlFdID0gJm4tPnZxc1tWSE9TVF9URVNUX1ZRXTsKPj4+ICAgIAluLT52
cXNbVkhPU1RfVEVTVF9WUV0uaGFuZGxlX2tpY2sgPSBoYW5kbGVfdnFfa2ljazsKPj4+ICAgIAl2
aG9zdF9kZXZfaW5pdChkZXYsIHZxcywgVkhPU1RfVEVTVF9WUV9NQVgsIFVJT19NQVhJT1YsCj4+
PiAtCQkgICAgICAgVkhPU1RfVEVTVF9QS1RfV0VJR0hULCBWSE9TVF9URVNUX1dFSUdIVCk7Cj4+
PiArCQkgICAgICAgVkhPU1RfVEVTVF9QS1RfV0VJR0hULCBWSE9TVF9URVNUX1dFSUdIVCwgTlVM
TCk7Cj4+PiAgICAJZi0+cHJpdmF0ZV9kYXRhID0gbjsKPj4+IEBAIC0yMjUsNyArMjI1LDcgQEAg
c3RhdGljIGxvbmcgdmhvc3RfdGVzdF9yZXNldF9vd25lcihzdHJ1Y3Qgdmhvc3RfdGVzdCAqbikK
Pj4+ICAgIHsKPj4+ICAgIAl2b2lkICpwcml2ID0gTlVMTDsKPj4+ICAgIAlsb25nIGVycjsKPj4+
IC0Jc3RydWN0IHZob3N0X3VtZW0gKnVtZW07Cj4+PiArCXN0cnVjdCB2aG9zdF9pb3RsYiAqdW1l
bTsKPj4+ICAgIAltdXRleF9sb2NrKCZuLT5kZXYubXV0ZXgpOwo+Pj4gICAgCWVyciA9IHZob3N0
X2Rldl9jaGVja19vd25lcigmbi0+ZGV2KTsKPj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3Zob3N0
L3ZyaW5naC5jIGIvZHJpdmVycy92aG9zdC92cmluZ2guYwo+Pj4gaW5kZXggZWUwNDkxZjU3OWFj
Li44NzhlNTY1ZGZmZmUgMTAwNjQ0Cj4+PiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCj4+
PiArKysgYi9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCj4+PiBAQCAtMTMsOSArMTMsMTEgQEAKPj4+
ICAgICNpbmNsdWRlIDxsaW51eC91YWNjZXNzLmg+Cj4+PiAgICAjaW5jbHVkZSA8bGludXgvc2xh
Yi5oPgo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L2V4cG9ydC5oPgo+Pj4gKyNpZmRlZiBWSE9TVF9J
T1RMQgo+Pgo+PiBLYnVpbGQgYm90IHJlcG9ydHMgYnVpbGQgaXNzdWVzIHdpdGggdGhpcy4KPj4K
Pj4gSXQgbG9va3MgdG8gbWUgd2Ugc2hvdWxkIHVzZSAjaWYgSVNfRU5BQkxFRChDT05GSUdfVkhP
U1RfSU9UTEIpIGhlcmUgYW5kCj4+IGZvbGxvd2luZyBjaGVja3MuCj4+Cj4+IFRoYW5rcwo+Pgo+
IEluIGZhY3QgSVNfUkVBQ0hFQUJMRSBpcyBwcm9iYWJseSB0aGUgcmlnaHQgdGhpbmcgdG8gZG8u
CgoKWWVzLgoKVGhhbmtzCgoKPgo+Cj4+PiAgICAjaW5jbHVkZSA8bGludXgvYnZlYy5oPgo+Pj4g
ICAgI2luY2x1ZGUgPGxpbnV4L2hpZ2htZW0uaD4KPj4+ICAgICNpbmNsdWRlIDxsaW51eC92aG9z
dF9pb3RsYi5oPgo+Pj4gKyNlbmRpZgo+Pj4gICAgI2luY2x1ZGUgPHVhcGkvbGludXgvdmlydGlv
X2NvbmZpZy5oPgo+Pj4gICAgc3RhdGljIF9fcHJpbnRmKDEsMikgX19jb2xkIHZvaWQgdnJpbmdo
X2JhZChjb25zdCBjaGFyICpmbXQsIC4uLikKPj4+IEBAIC0xMDU5LDYgKzEwNjEsOCBAQCBpbnQg
dnJpbmdoX25lZWRfbm90aWZ5X2tlcm4oc3RydWN0IHZyaW5naCAqdnJoKQo+Pj4gICAgfQo+Pj4g
ICAgRVhQT1JUX1NZTUJPTCh2cmluZ2hfbmVlZF9ub3RpZnlfa2Vybik7Cj4+PiArI2lmZGVmIFZI
T1NUX0lPVExCCj4+PiArCj4+PiAgICBzdGF0aWMgaW50IGlvdGxiX3RyYW5zbGF0ZShjb25zdCBz
dHJ1Y3QgdnJpbmdoICp2cmgsCj4+PiAgICAJCQkgICB1NjQgYWRkciwgdTY0IGxlbiwgc3RydWN0
IGJpb192ZWMgaW92W10sCj4+PiAgICAJCQkgICBpbnQgaW92X3NpemUsIHUzMiBwZXJtKQo+Pj4g
QEAgLTE0MTYsNSArMTQyMCw2IEBAIGludCB2cmluZ2hfbmVlZF9ub3RpZnlfaW90bGIoc3RydWN0
IHZyaW5naCAqdnJoKQo+Pj4gICAgfQo+Pj4gICAgRVhQT1JUX1NZTUJPTCh2cmluZ2hfbmVlZF9u
b3RpZnlfaW90bGIpOwo+Pj4gKyNlbmRpZgo+Pj4gICAgTU9EVUxFX0xJQ0VOU0UoIkdQTCIpOwo+
Pj4gZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvdnJpbmdoLmggYi9pbmNsdWRlL2xpbnV4L3Zy
aW5naC5oCj4+PiBpbmRleCBiZDA1MDNjYTZmOGYuLmViZmYxMjFjMGIwMiAxMDA2NDQKPj4+IC0t
LSBhL2luY2x1ZGUvbGludXgvdnJpbmdoLmgKPj4+ICsrKyBiL2luY2x1ZGUvbGludXgvdnJpbmdo
LmgKPj4+IEBAIC0xNCw4ICsxNCwxMCBAQAo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L3ZpcnRpb19i
eXRlb3JkZXIuaD4KPj4+ICAgICNpbmNsdWRlIDxsaW51eC91aW8uaD4KPj4+ICAgICNpbmNsdWRl
IDxsaW51eC9zbGFiLmg+Cj4+PiArI2lmZGVmIFZIT1NUX0lPVExCCj4+PiAgICAjaW5jbHVkZSA8
bGludXgvZG1hLWRpcmVjdGlvbi5oPgo+Pj4gICAgI2luY2x1ZGUgPGxpbnV4L3Zob3N0X2lvdGxi
Lmg+Cj4+PiArI2VuZGlmCj4+PiAgICAjaW5jbHVkZSA8YXNtL2JhcnJpZXIuaD4KPj4+ICAgIC8q
IHZpcnRpb19yaW5nIHdpdGggaW5mb3JtYXRpb24gbmVlZGVkIGZvciBob3N0IGFjY2Vzcy4gKi8K
Pj4+IGRpZmYgLS1naXQgYS90b29scy92aXJ0aW8vTWFrZWZpbGUgYi90b29scy92aXJ0aW8vTWFr
ZWZpbGUKPj4+IGluZGV4IGYzM2YzMmYxZDIwOC4uZDNmMTUyZjQ2NjBiIDEwMDY0NAo+Pj4gLS0t
IGEvdG9vbHMvdmlydGlvL01ha2VmaWxlCj4+PiArKysgYi90b29scy92aXJ0aW8vTWFrZWZpbGUK
Pj4+IEBAIC0yMiw3ICsyMiw4IEBAIE9PVF9DT05GSUdTPVwKPj4+ICAgIAlDT05GSUdfVkhPU1Q9
bSBcCj4+PiAgICAJQ09ORklHX1ZIT1NUX05FVD1uIFwKPj4+ICAgIAlDT05GSUdfVkhPU1RfU0NT
ST1uIFwKPj4+IC0JQ09ORklHX1ZIT1NUX1ZTT0NLPW4KPj4+ICsJQ09ORklHX1ZIT1NUX1ZTT0NL
PW4gXAo+Pj4gKwlDT05GSUdfVkhPU1RfUklORz1uCj4+PiAgICBPT1RfQlVJTEQ9S0NGTEFHUz0i
LUkgIiR7T09UX1ZIT1NUfSAke01BS0V9IC1DICR7T09UX0tTUkN9IFY9JHtWfQo+Pj4gICAgb290
LWJ1aWxkOgo+Pj4gICAgCWVjaG8gIlVOU1VQUE9SVEVEISBEb24ndCB1c2UgdGhlIHJlc3VsdGlu
ZyBtb2R1bGVzIGluIHByb2R1Y3Rpb24hIgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0
aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0
aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
