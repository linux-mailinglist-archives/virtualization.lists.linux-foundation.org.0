Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7CD19BAD3
	for <lists.virtualization@lfdr.de>; Thu,  2 Apr 2020 06:02:14 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 234E986D78;
	Thu,  2 Apr 2020 04:02:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3nLPhS9xO9Lb; Thu,  2 Apr 2020 04:02:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id F3C8886DDE;
	Thu,  2 Apr 2020 04:02:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id CF139C089F;
	Thu,  2 Apr 2020 04:02:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from hemlock.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id E827FC089F
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 04:02:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by hemlock.osuosl.org (Postfix) with ESMTP id D67C087ECB
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 04:02:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from hemlock.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0OOLkiy9vce5
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 04:02:07 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by hemlock.osuosl.org (Postfix) with ESMTPS id 54B1E87E9D
 for <virtualization@lists.linux-foundation.org>;
 Thu,  2 Apr 2020 04:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585800126;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zSv1WA+rPbGSzOupPYuZO2qP78Tb9ejg8WqBI3qnMo=;
 b=dWDtlgF0kcnAnyS1iJCNBPdxY4xp3s2xySVF3bnsmjYb/BZAi+X3I+At7hiqoJnsdHbQZH
 ipbM3vXD3Syc0zNKiBJp4ixpVSpwpXLXoI8f8/Sd+uacGCW0MyIfWSl8nQhwdtQwzhPS20
 3TcSOxU//yqEsykHom11NZ/trblCoVE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-472-LUxoOoOCPzGXTIuUcfvDzQ-1; Thu, 02 Apr 2020 00:02:04 -0400
X-MC-Unique: LUxoOoOCPzGXTIuUcfvDzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2816E107ACC4;
 Thu,  2 Apr 2020 04:02:03 +0000 (UTC)
Received: from [10.72.13.209] (ovpn-13-209.pek2.redhat.com [10.72.13.209])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F012719C69;
 Thu,  2 Apr 2020 04:01:57 +0000 (UTC)
Subject: Re: [PATCH] virtio/test: fix up after IOTLB changes
To: "Michael S. Tsirkin" <mst@redhat.com>, linux-kernel@vger.kernel.org
References: <20200401165100.276039-1-mst@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <921fe999-e183-058d-722a-1a6a6ab066e0@redhat.com>
Date: Thu, 2 Apr 2020 12:01:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <20200401165100.276039-1-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: =?UTF-8?Q?Eugenio_P=c3=a9rez?= <eperezma@redhat.com>,
 netdev@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMjAvNC8yIOS4iuWNiDEyOjUxLCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gQWxs
b3cgYnVpbGRpbmcgdnJpbmdoIHdpdGhvdXQgSU9UTEIgKHRoYXQncyB0aGUgY2FzZSBmb3IgdXNl
cnNwYWNlCj4gYnVpbGRzLCB3aWxsIGJlIHVzZWZ1bCBmb3IgQ0FJRi9WT0QgZG93biB0aGUgcm9h
ZCB0b28pLgo+IFVwZGF0ZSBmb3IgQVBJIHR3ZWFrcy4KPiBEb24ndCBpbmNsdWRlIHZyaW5naCB3
aXRoIGtlcm5lbCBidWlsZHMuCgoKSSdtIG5vdCBxdWl0ZSBzdXJlIHdlIG5lZWQgdGhpcy4KCkUu
ZyB0aGUgdXNlcnNwYWNlIGFjY2Vzc29yIGlzIG5vdCB1c2VkIGJ5IENBSUYvVk9QLgoKCj4KPiBD
YzogSmFzb24gV2FuZyA8amFzb3dhbmdAcmVkaGF0LmNvbT4KPiBDYzogRXVnZW5pbyBQw6lyZXog
PGVwZXJlem1hQHJlZGhhdC5jb20+Cj4gU2lnbmVkLW9mZi1ieTogTWljaGFlbCBTLiBUc2lya2lu
IDxtc3RAcmVkaGF0LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmhvc3QvdGVzdC5jICAgfCA0ICsr
LS0KPiAgIGRyaXZlcnMvdmhvc3QvdnJpbmdoLmMgfCA1ICsrKysrCj4gICBpbmNsdWRlL2xpbnV4
L3ZyaW5naC5oIHwgMiArKwo+ICAgdG9vbHMvdmlydGlvL01ha2VmaWxlICB8IDMgKystCj4gICA0
IGZpbGVzIGNoYW5nZWQsIDExIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZm
IC0tZ2l0IGEvZHJpdmVycy92aG9zdC90ZXN0LmMgYi9kcml2ZXJzL3Zob3N0L3Rlc3QuYwo+IGlu
ZGV4IDM5NGUyZTVjNzcyZC4uOWEzYTA5MDA1ZTAzIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmhv
c3QvdGVzdC5jCj4gKysrIGIvZHJpdmVycy92aG9zdC90ZXN0LmMKPiBAQCAtMTIwLDcgKzEyMCw3
IEBAIHN0YXRpYyBpbnQgdmhvc3RfdGVzdF9vcGVuKHN0cnVjdCBpbm9kZSAqaW5vZGUsIHN0cnVj
dCBmaWxlICpmKQo+ICAgCXZxc1tWSE9TVF9URVNUX1ZRXSA9ICZuLT52cXNbVkhPU1RfVEVTVF9W
UV07Cj4gICAJbi0+dnFzW1ZIT1NUX1RFU1RfVlFdLmhhbmRsZV9raWNrID0gaGFuZGxlX3ZxX2tp
Y2s7Cj4gICAJdmhvc3RfZGV2X2luaXQoZGV2LCB2cXMsIFZIT1NUX1RFU1RfVlFfTUFYLCBVSU9f
TUFYSU9WLAo+IC0JCSAgICAgICBWSE9TVF9URVNUX1BLVF9XRUlHSFQsIFZIT1NUX1RFU1RfV0VJ
R0hUKTsKPiArCQkgICAgICAgVkhPU1RfVEVTVF9QS1RfV0VJR0hULCBWSE9TVF9URVNUX1dFSUdI
VCwgTlVMTCk7Cj4gICAKPiAgIAlmLT5wcml2YXRlX2RhdGEgPSBuOwo+ICAgCj4gQEAgLTIyNSw3
ICsyMjUsNyBAQCBzdGF0aWMgbG9uZyB2aG9zdF90ZXN0X3Jlc2V0X293bmVyKHN0cnVjdCB2aG9z
dF90ZXN0ICpuKQo+ICAgewo+ICAgCXZvaWQgKnByaXYgPSBOVUxMOwo+ICAgCWxvbmcgZXJyOwo+
IC0Jc3RydWN0IHZob3N0X3VtZW0gKnVtZW07Cj4gKwlzdHJ1Y3Qgdmhvc3RfaW90bGIgKnVtZW07
Cj4gICAKPiAgIAltdXRleF9sb2NrKCZuLT5kZXYubXV0ZXgpOwo+ICAgCWVyciA9IHZob3N0X2Rl
dl9jaGVja19vd25lcigmbi0+ZGV2KTsKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92cmlu
Z2guYyBiL2RyaXZlcnMvdmhvc3QvdnJpbmdoLmMKPiBpbmRleCBlZTA0OTFmNTc5YWMuLjg3OGU1
NjVkZmZmZSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zob3N0L3ZyaW5naC5jCj4gKysrIGIvZHJp
dmVycy92aG9zdC92cmluZ2guYwo+IEBAIC0xMyw5ICsxMywxMSBAQAo+ICAgI2luY2x1ZGUgPGxp
bnV4L3VhY2Nlc3MuaD4KPiAgICNpbmNsdWRlIDxsaW51eC9zbGFiLmg+Cj4gICAjaW5jbHVkZSA8
bGludXgvZXhwb3J0Lmg+Cj4gKyNpZmRlZiBWSE9TVF9JT1RMQgoKCktidWlsZCBib3QgcmVwb3J0
cyBidWlsZCBpc3N1ZXMgd2l0aCB0aGlzLgoKSXQgbG9va3MgdG8gbWUgd2Ugc2hvdWxkIHVzZSAj
aWYgSVNfRU5BQkxFRChDT05GSUdfVkhPU1RfSU9UTEIpIGhlcmUgYW5kIApmb2xsb3dpbmcgY2hl
Y2tzLgoKVGhhbmtzCgoKPiAgICNpbmNsdWRlIDxsaW51eC9idmVjLmg+Cj4gICAjaW5jbHVkZSA8
bGludXgvaGlnaG1lbS5oPgo+ICAgI2luY2x1ZGUgPGxpbnV4L3Zob3N0X2lvdGxiLmg+Cj4gKyNl
bmRpZgo+ICAgI2luY2x1ZGUgPHVhcGkvbGludXgvdmlydGlvX2NvbmZpZy5oPgo+ICAgCj4gICBz
dGF0aWMgX19wcmludGYoMSwyKSBfX2NvbGQgdm9pZCB2cmluZ2hfYmFkKGNvbnN0IGNoYXIgKmZt
dCwgLi4uKQo+IEBAIC0xMDU5LDYgKzEwNjEsOCBAQCBpbnQgdnJpbmdoX25lZWRfbm90aWZ5X2tl
cm4oc3RydWN0IHZyaW5naCAqdnJoKQo+ICAgfQo+ICAgRVhQT1JUX1NZTUJPTCh2cmluZ2hfbmVl
ZF9ub3RpZnlfa2Vybik7Cj4gICAKPiArI2lmZGVmIFZIT1NUX0lPVExCCj4gKwo+ICAgc3RhdGlj
IGludCBpb3RsYl90cmFuc2xhdGUoY29uc3Qgc3RydWN0IHZyaW5naCAqdnJoLAo+ICAgCQkJICAg
dTY0IGFkZHIsIHU2NCBsZW4sIHN0cnVjdCBiaW9fdmVjIGlvdltdLAo+ICAgCQkJICAgaW50IGlv
dl9zaXplLCB1MzIgcGVybSkKPiBAQCAtMTQxNiw1ICsxNDIwLDYgQEAgaW50IHZyaW5naF9uZWVk
X25vdGlmeV9pb3RsYihzdHJ1Y3QgdnJpbmdoICp2cmgpCj4gICB9Cj4gICBFWFBPUlRfU1lNQk9M
KHZyaW5naF9uZWVkX25vdGlmeV9pb3RsYik7Cj4gICAKPiArI2VuZGlmCj4gICAKPiAgIE1PRFVM
RV9MSUNFTlNFKCJHUEwiKTsKPiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC92cmluZ2guaCBi
L2luY2x1ZGUvbGludXgvdnJpbmdoLmgKPiBpbmRleCBiZDA1MDNjYTZmOGYuLmViZmYxMjFjMGIw
MiAxMDA2NDQKPiAtLS0gYS9pbmNsdWRlL2xpbnV4L3ZyaW5naC5oCj4gKysrIGIvaW5jbHVkZS9s
aW51eC92cmluZ2guaAo+IEBAIC0xNCw4ICsxNCwxMCBAQAo+ICAgI2luY2x1ZGUgPGxpbnV4L3Zp
cnRpb19ieXRlb3JkZXIuaD4KPiAgICNpbmNsdWRlIDxsaW51eC91aW8uaD4KPiAgICNpbmNsdWRl
IDxsaW51eC9zbGFiLmg+Cj4gKyNpZmRlZiBWSE9TVF9JT1RMQgo+ICAgI2luY2x1ZGUgPGxpbnV4
L2RtYS1kaXJlY3Rpb24uaD4KPiAgICNpbmNsdWRlIDxsaW51eC92aG9zdF9pb3RsYi5oPgo+ICsj
ZW5kaWYKPiAgICNpbmNsdWRlIDxhc20vYmFycmllci5oPgo+ICAgCj4gICAvKiB2aXJ0aW9fcmlu
ZyB3aXRoIGluZm9ybWF0aW9uIG5lZWRlZCBmb3IgaG9zdCBhY2Nlc3MuICovCj4gZGlmZiAtLWdp
dCBhL3Rvb2xzL3ZpcnRpby9NYWtlZmlsZSBiL3Rvb2xzL3ZpcnRpby9NYWtlZmlsZQo+IGluZGV4
IGYzM2YzMmYxZDIwOC4uZDNmMTUyZjQ2NjBiIDEwMDY0NAo+IC0tLSBhL3Rvb2xzL3ZpcnRpby9N
YWtlZmlsZQo+ICsrKyBiL3Rvb2xzL3ZpcnRpby9NYWtlZmlsZQo+IEBAIC0yMiw3ICsyMiw4IEBA
IE9PVF9DT05GSUdTPVwKPiAgIAlDT05GSUdfVkhPU1Q9bSBcCj4gICAJQ09ORklHX1ZIT1NUX05F
VD1uIFwKPiAgIAlDT05GSUdfVkhPU1RfU0NTST1uIFwKPiAtCUNPTkZJR19WSE9TVF9WU09DSz1u
Cj4gKwlDT05GSUdfVkhPU1RfVlNPQ0s9biBcCj4gKwlDT05GSUdfVkhPU1RfUklORz1uCj4gICBP
T1RfQlVJTEQ9S0NGTEFHUz0iLUkgIiR7T09UX1ZIT1NUfSAke01BS0V9IC1DICR7T09UX0tTUkN9
IFY9JHtWfQo+ICAgb290LWJ1aWxkOgo+ICAgCWVjaG8gIlVOU1VQUE9SVEVEISBEb24ndCB1c2Ug
dGhlIHJlc3VsdGluZyBtb2R1bGVzIGluIHByb2R1Y3Rpb24hIgoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0
ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMu
bGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
