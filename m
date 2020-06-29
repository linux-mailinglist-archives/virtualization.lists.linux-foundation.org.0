Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 43F7920CD8F
	for <lists.virtualization@lfdr.de>; Mon, 29 Jun 2020 11:26:59 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id E8E4E88832;
	Mon, 29 Jun 2020 09:26:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JnnScihZNiQD; Mon, 29 Jun 2020 09:26:56 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id E556088835;
	Mon, 29 Jun 2020 09:26:56 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id C8558C016E;
	Mon, 29 Jun 2020 09:26:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id F1403C016E
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 09:26:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id DEA3A25D5D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 09:26:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Fn7wv45+Nu+7
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 09:26:53 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [207.211.31.81])
 by silver.osuosl.org (Postfix) with ESMTPS id A69952051D
 for <virtualization@lists.linux-foundation.org>;
 Mon, 29 Jun 2020 09:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1593422812;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VTBCMk9G4XAJKBAXCLARkHS+UIPi+qyk4DaOQIxioJ0=;
 b=ZzbWhbqDjxcq6XCV4pDr09ylhtbVAEC62Cp+ERUF0tHdKV6XJPPAolqJEnA+pKnBka5OUk
 aLeTVND5B5xZXTLApsUgLQUnSSznJ3TWieO761JN3CE0AeeqpEncVtPq/LarkH7h5s0zf9
 oFermsTNhoWQGtLCGXAycePqfGUUqm8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-321-wYp5EyKcP4qIXcC_HjmluA-1; Mon, 29 Jun 2020 05:26:17 -0400
X-MC-Unique: wYp5EyKcP4qIXcC_HjmluA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75543107ACCA;
 Mon, 29 Jun 2020 09:26:15 +0000 (UTC)
Received: from [10.72.12.64] (ovpn-12-64.pek2.redhat.com [10.72.12.64])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00A1110013C1;
 Mon, 29 Jun 2020 09:26:04 +0000 (UTC)
Subject: Re: [PATCH RFC 4/5] vhost-vdpa: support IOTLB batching hints
To: "Michael S. Tsirkin" <mst@redhat.com>
References: <20200618055626.25660-1-jasowang@redhat.com>
 <20200618055626.25660-5-jasowang@redhat.com>
 <20200628054940-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <a2216693-cdba-ff53-46f9-abaf47789f5a@redhat.com>
Date: Mon, 29 Jun 2020 17:26:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200628054940-mutt-send-email-mst@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Cc: shahafs@mellanox.com, lulu@redhat.com, saugatm@xilinx.com,
 mhabets@solarflare.com, vmireyno@marvell.com, linux-kernel@vger.kernel.org,
 gdawar@xilinx.com, virtualization@lists.linux-foundation.org,
 eperezma@redhat.com, hanand@xilinx.com, zhangweining@ruijie.com.cn,
 eli@mellanox.com, lingshan.zhu@intel.com, rob.miller@broadcom.com
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

Ck9uIDIwMjAvNi8yOCDkuIvljYg1OjU4LCBNaWNoYWVsIFMuIFRzaXJraW4gd3JvdGU6Cj4gT24g
VGh1LCBKdW4gMTgsIDIwMjAgYXQgMDE6NTY6MjVQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90ZToK
Pj4gVGhpcyBwYXRjaGVzIGV4dGVuZCB0aGUgdmhvc3QgSU9UTEIgQVBJIHRvIGFjY2VwdCBiYXRj
aCB1cGRhdGluZyBoaW50cwo+PiBmb3JtIHVzZXJzcGFjZS4gV2hlbiB1c2Vyc3BhY2Ugd2FudHMg
dXBkYXRlIHRoZSBkZXZpY2UgSU9UTEIgaW4gYQo+PiBiYXRjaCwgaXQgbWF5IGRvOgo+Pgo+PiAx
KSBXcml0ZSB2aG9zdF9pb3RsYl9tc2cgd2l0aCBWSE9TVF9JT1RMQl9CQVRDSF9CRUdJTiBmbGFn
Cj4+IDIpIFBlcmZvcm0gYSBiYXRjaCBvZiBJT1RMQiB1cGRhdGluZyB2aWEgVkhPU1RfSU9UTEJf
VVBEQVRFL0lOVkFMSURBVEUKPj4gMykgV3JpdGUgdmhvc3RfaW90bGJfbXNnIHdpdGggVkhPU1Rf
SU9UTEJfQkFUQ0hfRU5EIGZsYWcKPiBBcyBsb25nIGFzIHdlIGFyZSBleHRlbmRpbmcgdGhlIGlu
dGVyZmFjZSwKPiBpcyB0aGVyZSBzb21lIHdheSB3ZSBjb3VsZCBjdXQgZG93biB0aGUgbnVtYmVy
IG9mIHN5c3RlbSBjYWxscyBuZWVkZWQKPiBoZXJlPwoKCkknbSBub3Qgc3VyZSBpdCdzIHdvcnRo
IHRvIGRvIHRoYXQgc2luY2UgdXN1YWxseSB3ZSBvbmx5IGhhdmUgbGVzcyB0aGFuIAoxMCByZWdp
b25zLgoKQSBwb3NzaWJsZSBtZXRob2QgaXMgdG8gY2FycnkgbXVsdGlwbGUgdmhvc3RfaW90bGJf
bWVzc2FnZSBpbiBvbmUgc3lzdGVtIApjYWxsLgoKCj4KPgo+PiBWaG9zdC12ZHBhIG1heSBkZWNp
ZGUgdG8gYmF0Y2ggdGhlIElPTU1VL0lPVExCIHVwZGF0aW5nIGluIHN0ZXAgMyB3aGVuCj4+IHZE
UEEgZGV2aWNlIHN1cHBvcnQgc2V0X21hcCgpIG9wcy4gVGhpcyBpcyB1c2VmdWwgZm9yIHRoZSB2
RFBBIGRldmljZQo+PiB0aGF0IHdhbnQgdG8ga25vdyBhbGwgdGhlIG1hcHBpbmdzIHRvIHR3ZWFr
IHRoZWlyIG93biBETUEgdHJhbnNsYXRpb24KPj4gbG9naWMuCj4+Cj4+IEZvciB2RFBBIGRldmlj
ZSB0aGF0IGRvZXNuJ3QgcmVxdWlyZSBzZXRfbWFwKCksIG5vIGJlaGF2aW9yIGNoYW5nZXMuCj4+
Cj4+IFRoaXMgY2FwYWJpbGl0eSBpcyBhZHZlcnRpc2VkIHZpYSBWSE9TVF9CQUNLRU5EX0ZfSU9U
TEJfQkFUQ0ggY2FwYWJpbGl0eS4KPj4KPj4gU2lnbmVkLW9mZi1ieTogSmFzb24gV2FuZyA8amFz
b3dhbmdAcmVkaGF0LmNvbT4KPj4gLS0tCj4+ICAgZHJpdmVycy92aG9zdC92ZHBhLmMgICAgICAg
ICAgICAgfCAzMCArKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0KPj4gICBpbmNsdWRlL3Vh
cGkvbGludXgvdmhvc3QuaCAgICAgICB8ICAyICsrCj4+ICAgaW5jbHVkZS91YXBpL2xpbnV4L3Zo
b3N0X3R5cGVzLmggfCAgNyArKysrKysrCj4+ICAgMyBmaWxlcyBjaGFuZ2VkLCAzMiBpbnNlcnRp
b25zKCspLCA3IGRlbGV0aW9ucygtKQo+Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92aG9zdC92
ZHBhLmMgYi9kcml2ZXJzL3Zob3N0L3ZkcGEuYwo+PiBpbmRleCA0NTMwNTc0MjFmODAuLjhmNjI0
YmJhZmVlNyAxMDA2NDQKPj4gLS0tIGEvZHJpdmVycy92aG9zdC92ZHBhLmMKPj4gKysrIGIvZHJp
dmVycy92aG9zdC92ZHBhLmMKPj4gQEAgLTU2LDcgKzU2LDkgQEAgZW51bSB7Cj4+ICAgfTsKPj4g
ICAKPj4gICBlbnVtIHsKPj4gLQlWSE9TVF9WRFBBX0JBQ0tFTkRfRkVBVFVSRVMgPSAoMVVMTCA8
PCBWSE9TVF9CQUNLRU5EX0ZfSU9UTEJfTVNHX1YyKQo+PiArCVZIT1NUX1ZEUEFfQkFDS0VORF9G
RUFUVVJFUyA9Cj4+ICsJKDFVTEwgPDwgVkhPU1RfQkFDS0VORF9GX0lPVExCX01TR19WMikgfAo+
PiArCSgxVUxMIDw8IFZIT1NUX0JBQ0tFTkRfRl9JT1RMQl9CQVRDSCksCj4+ICAgfTsKPj4gICAK
Pj4gICAvKiBDdXJyZW50bHksIG9ubHkgbmV0d29yayBiYWNrZW5kIHcvbyBtdWx0aXF1ZXVlIGlz
IHN1cHBvcnRlZC4gKi8KPj4gQEAgLTc3LDYgKzc5LDcgQEAgc3RydWN0IHZob3N0X3ZkcGEgewo+
PiAgIAlpbnQgdmlydGlvX2lkOwo+PiAgIAlpbnQgbWlub3I7Cj4+ICAgCXN0cnVjdCBldmVudGZk
X2N0eCAqY29uZmlnX2N0eDsKPj4gKwlpbnQgaW5fYmF0Y2g7Cj4+ICAgfTsKPj4gICAKPj4gICBz
dGF0aWMgREVGSU5FX0lEQSh2aG9zdF92ZHBhX2lkYSk7Cj4+IEBAIC0xMjUsNiArMTI4LDcgQEAg
c3RhdGljIHZvaWQgdmhvc3RfdmRwYV9yZXNldChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdikKPj4gICAJ
Y29uc3Qgc3RydWN0IHZkcGFfY29uZmlnX29wcyAqb3BzID0gdmRwYS0+Y29uZmlnOwo+PiAgIAo+
PiAgIAlvcHMtPnNldF9zdGF0dXModmRwYSwgMCk7Cj4+ICsJdi0+aW5fYmF0Y2ggPSAwOwo+PiAg
IH0KPj4gICAKPj4gICBzdGF0aWMgbG9uZyB2aG9zdF92ZHBhX2dldF9kZXZpY2VfaWQoc3RydWN0
IHZob3N0X3ZkcGEgKnYsIHU4IF9fdXNlciAqYXJncCkKPj4gQEAgLTU0MCw5ICs1NDQsMTAgQEAg
c3RhdGljIGludCB2aG9zdF92ZHBhX21hcChzdHJ1Y3Qgdmhvc3RfdmRwYSAqdiwKPj4gICAKPj4g
ICAJaWYgKG9wcy0+ZG1hX21hcCkKPj4gICAJCXIgPSBvcHMtPmRtYV9tYXAodmRwYSwgaW92YSwg
c2l6ZSwgcGEsIHBlcm0pOwo+PiAtCWVsc2UgaWYgKG9wcy0+c2V0X21hcCkKPj4gLQkJciA9IG9w
cy0+c2V0X21hcCh2ZHBhLCBkZXYtPmlvdGxiKTsKPj4gLQllbHNlCj4+ICsJZWxzZSBpZiAob3Bz
LT5zZXRfbWFwKSB7Cj4+ICsJCWlmICghdi0+aW5fYmF0Y2gpCj4+ICsJCQlyID0gb3BzLT5zZXRf
bWFwKHZkcGEsIGRldi0+aW90bGIpOwo+PiArCX0gZWxzZQo+PiAgIAkJciA9IGlvbW11X21hcCh2
LT5kb21haW4sIGlvdmEsIHBhLCBzaXplLAo+PiAgIAkJCSAgICAgIHBlcm1fdG9faW9tbXVfZmxh
Z3MocGVybSkpOwo+PiAgIAo+PiBAQCAtNTU5LDkgKzU2NCwxMCBAQCBzdGF0aWMgdm9pZCB2aG9z
dF92ZHBhX3VubWFwKHN0cnVjdCB2aG9zdF92ZHBhICp2LCB1NjQgaW92YSwgdTY0IHNpemUpCj4+
ICAgCj4+ICAgCWlmIChvcHMtPmRtYV9tYXApCj4+ICAgCQlvcHMtPmRtYV91bm1hcCh2ZHBhLCBp
b3ZhLCBzaXplKTsKPj4gLQllbHNlIGlmIChvcHMtPnNldF9tYXApCj4+IC0JCW9wcy0+c2V0X21h
cCh2ZHBhLCBkZXYtPmlvdGxiKTsKPj4gLQllbHNlCj4+ICsJZWxzZSBpZiAob3BzLT5zZXRfbWFw
KSB7Cj4+ICsJCWlmICghdi0+aW5fYmF0Y2gpCj4+ICsJCQlvcHMtPnNldF9tYXAodmRwYSwgZGV2
LT5pb3RsYik7Cj4+ICsJfSBlbHNlCj4+ICAgCQlpb21tdV91bm1hcCh2LT5kb21haW4sIGlvdmEs
IHNpemUpOwo+PiAgIH0KPj4gICAKPj4gQEAgLTY1NSw2ICs2NjEsOCBAQCBzdGF0aWMgaW50IHZo
b3N0X3ZkcGFfcHJvY2Vzc19pb3RsYl9tc2coc3RydWN0IHZob3N0X2RldiAqZGV2LAo+PiAgIAkJ
CQkJc3RydWN0IHZob3N0X2lvdGxiX21zZyAqbXNnKQo+PiAgIHsKPj4gICAJc3RydWN0IHZob3N0
X3ZkcGEgKnYgPSBjb250YWluZXJfb2YoZGV2LCBzdHJ1Y3Qgdmhvc3RfdmRwYSwgdmRldik7Cj4+
ICsJc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhID0gdi0+dmRwYTsKPj4gKwljb25zdCBzdHJ1Y3Qg
dmRwYV9jb25maWdfb3BzICpvcHMgPSB2ZHBhLT5jb25maWc7Cj4+ICAgCWludCByID0gMDsKPj4g
ICAKPj4gICAJciA9IHZob3N0X2Rldl9jaGVja19vd25lcihkZXYpOwo+PiBAQCAtNjY4LDYgKzY3
NiwxNCBAQCBzdGF0aWMgaW50IHZob3N0X3ZkcGFfcHJvY2Vzc19pb3RsYl9tc2coc3RydWN0IHZo
b3N0X2RldiAqZGV2LAo+PiAgIAljYXNlIFZIT1NUX0lPVExCX0lOVkFMSURBVEU6Cj4+ICAgCQl2
aG9zdF92ZHBhX3VubWFwKHYsIG1zZy0+aW92YSwgbXNnLT5zaXplKTsKPj4gICAJCWJyZWFrOwo+
PiArCWNhc2UgVkhPU1RfSU9UTEJfQkFUQ0hfQkVHSU46Cj4+ICsJCXYtPmluX2JhdGNoID0gdHJ1
ZTsKPj4gKwkJYnJlYWs7Cj4+ICsJY2FzZSBWSE9TVF9JT1RMQl9CQVRDSF9FTkQ6Cj4+ICsJCWlm
ICh2LT5pbl9iYXRjaCAmJiBvcHMtPnNldF9tYXApCj4+ICsJCQlvcHMtPnNldF9tYXAodmRwYSwg
ZGV2LT5pb3RsYik7Cj4+ICsJCXYtPmluX2JhdGNoID0gZmFsc2U7Cj4+ICsJCWJyZWFrOwo+PiAg
IAlkZWZhdWx0Ogo+PiAgIAkJciA9IC1FSU5WQUw7Cj4+ICAgCQlicmVhazsKPj4gZGlmZiAtLWdp
dCBhL2luY2x1ZGUvdWFwaS9saW51eC92aG9zdC5oIGIvaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0
LmgKPj4gaW5kZXggMGMyMzQ5NjEyZTc3Li41NjVkYTk2ZjU1ZDUgMTAwNjQ0Cj4+IC0tLSBhL2lu
Y2x1ZGUvdWFwaS9saW51eC92aG9zdC5oCj4+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC92aG9z
dC5oCj4+IEBAIC05MSw2ICs5MSw4IEBACj4+ICAgCj4+ICAgLyogVXNlIG1lc3NhZ2UgdHlwZSBW
MiAqLwo+PiAgICNkZWZpbmUgVkhPU1RfQkFDS0VORF9GX0lPVExCX01TR19WMiAweDEKPj4gKy8q
IElPVExCIGNhbiBhY2NwZXQgYmF0Y2hpbmcgaGludHMgKi8KPiB0eXBvCgoKV2lsbCBmaXguCgoK
Pgo+PiArI2RlZmluZSBWSE9TVF9CQUNLRU5EX0ZfSU9UTEJfQkFUQ0ggIDB4Mgo+PiAgIAo+PiAg
ICNkZWZpbmUgVkhPU1RfU0VUX0JBQ0tFTkRfRkVBVFVSRVMgX0lPVyhWSE9TVF9WSVJUSU8sIDB4
MjUsIF9fdTY0KQo+PiAgICNkZWZpbmUgVkhPU1RfR0VUX0JBQ0tFTkRfRkVBVFVSRVMgX0lPUihW
SE9TVF9WSVJUSU8sIDB4MjYsIF9fdTY0KQo+PiBkaWZmIC0tZ2l0IGEvaW5jbHVkZS91YXBpL2xp
bnV4L3Zob3N0X3R5cGVzLmggYi9pbmNsdWRlL3VhcGkvbGludXgvdmhvc3RfdHlwZXMuaAo+PiBp
bmRleCA2Njk0NTdjZTVjNDguLjVjMTJmYWZmZGRlOSAxMDA2NDQKPj4gLS0tIGEvaW5jbHVkZS91
YXBpL2xpbnV4L3Zob3N0X3R5cGVzLmgKPj4gKysrIGIvaW5jbHVkZS91YXBpL2xpbnV4L3Zob3N0
X3R5cGVzLmgKPj4gQEAgLTYwLDYgKzYwLDEzIEBAIHN0cnVjdCB2aG9zdF9pb3RsYl9tc2cgewo+
PiAgICNkZWZpbmUgVkhPU1RfSU9UTEJfVVBEQVRFICAgICAgICAgMgo+PiAgICNkZWZpbmUgVkhP
U1RfSU9UTEJfSU5WQUxJREFURSAgICAgMwo+PiAgICNkZWZpbmUgVkhPU1RfSU9UTEJfQUNDRVNT
X0ZBSUwgICAgNAo+PiArLyogVkhPU1RfSU9UTEJfQkFUQ0hfQkVHSU4gaXMgYSBoaW50IHRoYXQg
dXNlcnNwYWNlIHdpbGwgdXBkYXRlCj4+ICsgKiBzZXZlcmFsIG1hcHBpbmdzIGFmdGVyd2FyZHMu
IFZIT1NUX0lPVExCX0JBVENIX0VORCBpcyBhIGhpbnQgdGhhdAo+PiArICogdXNlcnNwYWNlIGhh
ZCBmaW5pc2hlZCB0aGUgbWFwcGluZyB1cGRhdGluZy4KPgo+IFdlbGwgbm90IGp1c3QgaGludHMg
LSBpbiBmYWN0IHVwZGF0ZXMgZG8gbm90IHRha2UgcGxhY2UKPiB1bnRpbCBfRU5ELgo+Cj4gSG93
IGFib3V0Ogo+Cj4gLyogVkhPU1RfSU9UTEJfQkFUQ0hfQkVHSU4gYW5kIFZIT1NUX0lPVExCX0JB
VENIX0VORCBhbGxvdyBtb2RpZnlpbmcKPiAgICogbXVsdGlwbGUgbWFwcGluZ3MgaW4gb25lIGdv
OiBiZWdpbm5pbmcgd2l0aAo+ICAgKiBWSE9TVF9JT1RMQl9CQVRDSF9CRUdJTiwgZm9sbG93ZWQg
YnkgYW55IG51bWJlciBvZgo+ICAgICBWSE9TVF9JT1RMQl9VUERBVEUgbWVzc2FnZXMsIGFuZCBl
bmRpbmcgd2l0aCBWSE9TVF9JT1RMQl9CQVRDSF9FTkQuCj4gICAqLwoKClRoYXQncyBiZXR0ZXIu
CgoKPgo+Cj4+IFdoZW4gdGhvc2UgdHdvIGZsYWdzCj4+ICsgKiB3ZXJlIHNldCwga2VybmVsIHdp
bGwgaWdub3JlIHRoZSByZXN0IGZpbGVkcyBvZiB0aGUgSU9UTEIgbWVzc2FnZS4KPiBob3cgYWJv
dXQ6Cj4KPiB3aGVuIG9uZSBvZiB0aGVzZSB0d28gdmFsdWVzIGlzIHVzZWQgYXMgdGhlIG1lc3Nh
Z2UgdHlwZSwgdGhlCj4gcmVzdCBvZiB0aGUgZmllbGRzIGluIHRoZSBtZXNzYWdlIGFyZSBpZ25v
cmVkLgoKClllcy4KCldpbGwgZml4LgoKVGhhbmtzCgoKPgo+PiArICovCj4+ICsjZGVmaW5lIFZI
T1NUX0lPVExCX0JBVENIX0JFR0lOICAgIDUKPj4gKyNkZWZpbmUgVkhPU1RfSU9UTEJfQkFUQ0hf
RU5EICAgICAgNgo+PiAgIAlfX3U4IHR5cGU7Cj4+ICAgfTsKPj4gICAKPj4gLS0gCj4+IDIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVh
bGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRp
b24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L3ZpcnR1YWxpemF0aW9u
