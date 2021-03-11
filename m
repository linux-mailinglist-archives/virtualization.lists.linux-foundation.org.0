Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EE1336AA3
	for <lists.virtualization@lfdr.de>; Thu, 11 Mar 2021 04:26:14 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 253E74B058;
	Thu, 11 Mar 2021 03:26:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yw7fylo1OpGS; Thu, 11 Mar 2021 03:26:11 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC01E4B67B;
	Thu, 11 Mar 2021 03:26:10 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 3EEE0C0001;
	Thu, 11 Mar 2021 03:26:10 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 404B8C0001
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 03:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 278BF4B23B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 03:26:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KdEs7NgWZmGi
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 03:26:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 33E164B058
 for <virtualization@lists.linux-foundation.org>;
 Thu, 11 Mar 2021 03:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615433166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MFqvqdxhcEJJpTkmLszHn4IZfhxa3EbZT89ftgo2+BY=;
 b=fZg5gMBldvBc1/Tw3apKbJR5ejFP0D4nAlOksmCCtiFYLk3IObJm9diJ6wbtLRe37opUQK
 V2KGuCTi5j1ajlnGBdINX73tjSH8L0skPMdQKD8laVr2QRDS2FBED7wdAxThxBMfz9CqvA
 Er3UmgAOy+9Dw3o8FYlNqd2WomkfOxo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-YZ3Xp-TGOkGLGBFEgckrVg-1; Wed, 10 Mar 2021 22:26:05 -0500
X-MC-Unique: YZ3Xp-TGOkGLGBFEgckrVg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 014A41009E2D;
 Thu, 11 Mar 2021 03:26:04 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-9.pek2.redhat.com
 [10.72.13.9])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2129F5D6D7;
 Thu, 11 Mar 2021 03:25:57 +0000 (UTC)
Subject: Re: [PATCH V3 3/6] vDPA/ifcvf: rename original IFCVF dev ids to N3000
 ids
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com, lulu@redhat.com,
 leonro@nvidia.com
References: <20210310090052.4762-1-lingshan.zhu@intel.com>
 <20210310090052.4762-4-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <5e2b22cc-7faa-2987-a30a-ce32f10099b6@redhat.com>
Date: Thu, 11 Mar 2021 11:25:56 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210310090052.4762-4-lingshan.zhu@intel.com>
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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

Ck9uIDIwMjEvMy8xMCA1OjAwIOS4i+WNiCwgWmh1IExpbmdzaGFuIHdyb3RlOgo+IElGQ1ZGIGRy
aXZlciBwcm9iZXMgbXVsdGlwbGUgdHlwZXMgb2YgZGV2aWNlcyBub3csCj4gdG8gZGlzdGluZ3Vp
c2ggdGhlIG9yaWdpbmFsIGRldmljZSBkcml2ZW4gYnkgSUZDVkYKPiBmcm9tIG90aGVycywgaXQg
aXMgcmVuYW1lZCBhcyAiTjMwMDAiLgo+Cj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFuIDxs
aW5nc2hhbi56aHVAaW50ZWwuY29tPgo+IC0tLQo+ICAgZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3Zm
X2Jhc2UuaCB8IDggKysrKy0tLS0KPiAgIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMg
fCA4ICsrKystLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgOCBkZWxl
dGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5o
IGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuaAo+IGluZGV4IDc1ZDlhODA1MjAzOS4u
Nzk0ZDE1MDVkODU3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNl
LmgKPiArKysgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5oCj4gQEAgLTE4LDEwICsx
OCwxMCBAQAo+ICAgI2luY2x1ZGUgPHVhcGkvbGludXgvdmlydGlvX2NvbmZpZy5oPgo+ICAgI2lu
Y2x1ZGUgPHVhcGkvbGludXgvdmlydGlvX3BjaS5oPgo+ICAgCj4gLSNkZWZpbmUgSUZDVkZfVkVO
RE9SX0lECQkweDFBRjQKPiAtI2RlZmluZSBJRkNWRl9ERVZJQ0VfSUQJCTB4MTA0MQo+IC0jZGVm
aW5lIElGQ1ZGX1NVQlNZU19WRU5ET1JfSUQJMHg4MDg2Cj4gLSNkZWZpbmUgSUZDVkZfU1VCU1lT
X0RFVklDRV9JRAkweDAwMUEKPiArI2RlZmluZSBOMzAwMF9WRU5ET1JfSUQJCTB4MUFGNAo+ICsj
ZGVmaW5lIE4zMDAwX0RFVklDRV9JRAkJMHgxMDQxCj4gKyNkZWZpbmUgTjMwMDBfU1VCU1lTX1ZF
TkRPUl9JRAkweDgwODYKPiArI2RlZmluZSBOMzAwMF9TVUJTWVNfREVWSUNFX0lECTB4MDAxQQo+
ICAgCj4gICAjZGVmaW5lIEM1MDAwWF9QTF9WRU5ET1JfSUQJCTB4MUFGNAo+ICAgI2RlZmluZSBD
NTAwMFhfUExfREVWSUNFX0lECQkweDEwMDAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBhL2lm
Y3ZmL2lmY3ZmX21haW4uYyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWluLmMKPiBpbmRl
eCAyNmEyZGFiN2NhNjYuLmZkNWJlZmM1Y2JjYyAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3ZkcGEv
aWZjdmYvaWZjdmZfbWFpbi5jCj4gKysrIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4u
Ywo+IEBAIC00ODAsMTAgKzQ4MCwxMCBAQCBzdGF0aWMgdm9pZCBpZmN2Zl9yZW1vdmUoc3RydWN0
IHBjaV9kZXYgKnBkZXYpCj4gICB9Cj4gICAKPiAgIHN0YXRpYyBzdHJ1Y3QgcGNpX2RldmljZV9p
ZCBpZmN2Zl9wY2lfaWRzW10gPSB7Cj4gLQl7IFBDSV9ERVZJQ0VfU1VCKElGQ1ZGX1ZFTkRPUl9J
RCwKPiAtCQlJRkNWRl9ERVZJQ0VfSUQsCj4gLQkJSUZDVkZfU1VCU1lTX1ZFTkRPUl9JRCwKPiAt
CQlJRkNWRl9TVUJTWVNfREVWSUNFX0lEKSB9LAo+ICsJeyBQQ0lfREVWSUNFX1NVQihOMzAwMF9W
RU5ET1JfSUQsCj4gKwkJCSBOMzAwMF9ERVZJQ0VfSUQsCgoKSSBhbSBub3Qgc3VyZSB0aGUgcGxh
biBmb3IgSW50ZWwgYnV0IEkgd29uZGVyIGlmIHdlIGNhbiBzaW1wbHkgdXNlIApQQ0lfQU5ZX0lE
IGZvciBkZXZpY2UgaWQgaGVyZS4gT3RoZXJld2lzZSB5b3UgbmVlZCB0byBtYWludGFpbiBhIHZl
cnkgCmxvbmcgbGlzdCBvZiBpZHMgaGVyZS4KClRoYW5rcwoKCj4gKwkJCSBOMzAwMF9TVUJTWVNf
VkVORE9SX0lELAo+ICsJCQkgTjMwMDBfU1VCU1lTX0RFVklDRV9JRCkgfSwKPiAgIAl7IFBDSV9E
RVZJQ0VfU1VCKEM1MDAwWF9QTF9WRU5ET1JfSUQsCj4gICAJCQkgQzUwMDBYX1BMX0RFVklDRV9J
RCwKPiAgIAkJCSBDNTAwMFhfUExfU1VCU1lTX1ZFTkRPUl9JRCwKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlz
dApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3Rz
LmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
