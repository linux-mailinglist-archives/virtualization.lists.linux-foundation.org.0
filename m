Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	by mail.lfdr.de (Postfix) with ESMTPS id 677B6331CE9
	for <lists.virtualization@lfdr.de>; Tue,  9 Mar 2021 03:23:56 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DF74040159;
	Tue,  9 Mar 2021 02:23:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iXSXKg-L1_fb; Tue,  9 Mar 2021 02:23:54 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp2.osuosl.org (Postfix) with ESMTP id 955574015E;
	Tue,  9 Mar 2021 02:23:53 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 22F60C0001;
	Tue,  9 Mar 2021 02:23:53 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id C09EBC0001
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 02:23:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AFA9B6058F
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 02:23:51 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MsA85k2H5VRj
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 02:23:51 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0B1DB605A2
 for <virtualization@lists.linux-foundation.org>;
 Tue,  9 Mar 2021 02:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615256629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a6wFttvigZ3krFK2Ucp4xgtYD3Ea0xR4Fa2rCnzkxiI=;
 b=flKabHBYlZ4D1eLRFiSVIuHag/hsT2ji931+3x30Cg0Fni3O+w0HdQrrEHrBAIED3Hhf09
 mQRI4yWZa299Q7nOazuMweOvdguFLmiJuIiVg4qAbOX44CQpMREl1PyOEFFiNJGSTOAwar
 gd7+mYtkED7yA/yGLsV28krn0la3dio=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-k_UuP8RgN_63zyLo9g98Lw-1; Mon, 08 Mar 2021 21:23:45 -0500
X-MC-Unique: k_UuP8RgN_63zyLo9g98Lw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9666A1842142;
 Tue,  9 Mar 2021 02:23:44 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-202.pek2.redhat.com
 [10.72.13.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EEBA560C04;
 Tue,  9 Mar 2021 02:23:35 +0000 (UTC)
Subject: Re: [PATCH V2 2/4] vDPA/ifcvf: enable Intel C5000X-PL virtio-net for
 vDPA
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com, lulu@redhat.com
References: <20210308083525.382514-1-lingshan.zhu@intel.com>
 <20210308083525.382514-3-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <d37ea3f4-1c18-087b-a444-0d4e1ebbe417@redhat.com>
Date: Tue, 9 Mar 2021 10:23:34 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210308083525.382514-3-lingshan.zhu@intel.com>
Content-Language: en-GB
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Ck9uIDIwMjEvMy84IDQ6MzUg5LiL5Y2ILCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4gVGhpcyBjb21t
aXQgZW5hYmxlZCBJbnRlbCBGUEdBIFNtYXJ0TklDIEM1MDAwWC1QTCB2aXJ0aW8tbmV0Cj4gZm9y
IHZEUEEKPgo+IFNpZ25lZC1vZmYtYnk6IFpodSBMaW5nc2hhbiA8bGluZ3NoYW4uemh1QGludGVs
LmNvbT4KPiAtLS0KPiAgIGRyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmggfCA1ICsrKysr
Cj4gICBkcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jIHwgNSArKysrKwo+ICAgMiBmaWxl
cyBjaGFuZ2VkLCAxMCBpbnNlcnRpb25zKCspCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy92ZHBh
L2lmY3ZmL2lmY3ZmX2Jhc2UuaCBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9iYXNlLmgKPiBp
bmRleCA2NDY5NmQ2M2ZlMDcuLjc1ZDlhODA1MjAzOSAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3Zk
cGEvaWZjdmYvaWZjdmZfYmFzZS5oCj4gKysrIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jh
c2UuaAo+IEBAIC0yMyw2ICsyMywxMSBAQAo+ICAgI2RlZmluZSBJRkNWRl9TVUJTWVNfVkVORE9S
X0lECTB4ODA4Ngo+ICAgI2RlZmluZSBJRkNWRl9TVUJTWVNfREVWSUNFX0lECTB4MDAxQQo+ICAg
Cj4gKyNkZWZpbmUgQzUwMDBYX1BMX1ZFTkRPUl9JRAkJMHgxQUY0Cj4gKyNkZWZpbmUgQzUwMDBY
X1BMX0RFVklDRV9JRAkJMHgxMDAwCj4gKyNkZWZpbmUgQzUwMDBYX1BMX1NVQlNZU19WRU5ET1Jf
SUQJMHg4MDg2Cj4gKyNkZWZpbmUgQzUwMDBYX1BMX1NVQlNZU19ERVZJQ0VfSUQJMHgwMDAxCgoK
SSBqdXN0IG5vdGljZSB0aGF0IHRoZSBkZXZpY2UgaXMgYSB0cmFuc3RpdGlvbmFsIG9uZS4gQW55
IHJlYXNvbiBmb3IgCmRvaW5nIHRoaXM/CgpOb3RlIHRoYXQgSUZDVkYgaXMgYSBtb2RlbiBkZXZp
Y2UgYW55aG93ICgweDEwNDEpLiBTdXBwb3J0aW5nIGxlZ2FjeSAKZHJpdmUgbWF5IGJyaW5nIG1h
bnkgaXNzdWVzIChlLmcgdGhlIGRlZmluaXRpb24gaXMgbm9uLW5vbWFydGl2ZSkuIE9uZSAKZXhh
bXBsZSBpcyB0aGUgc3VwcG9ydCBvZiBWSVJUSU9fRl9JT01NVV9QTEFURk9STSwgbGVnYWN5IGRy
aXZlciBtYXkgCmFzc3VtZSB0aGUgZGV2aWNlIGNhbiBieXBhc3MgSU9NTVUuCgpUaGFua3MKCgo+
ICsKPiAgICNkZWZpbmUgSUZDVkZfU1VQUE9SVEVEX0ZFQVRVUkVTIFwKPiAgIAkJKCgxVUxMIDw8
IFZJUlRJT19ORVRfRl9NQUMpCQkJfCBcCj4gICAJCSAoMVVMTCA8PCBWSVJUSU9fRl9BTllfTEFZ
T1VUKQkJCXwgXAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5j
IGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYwo+IGluZGV4IGU1MDFlZTA3ZGUxNy4u
MjZhMmRhYjdjYTY2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2Zl9tYWlu
LmMKPiArKysgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gQEAgLTQ4NCw2ICs0
ODQsMTEgQEAgc3RhdGljIHN0cnVjdCBwY2lfZGV2aWNlX2lkIGlmY3ZmX3BjaV9pZHNbXSA9IHsK
PiAgIAkJSUZDVkZfREVWSUNFX0lELAo+ICAgCQlJRkNWRl9TVUJTWVNfVkVORE9SX0lELAo+ICAg
CQlJRkNWRl9TVUJTWVNfREVWSUNFX0lEKSB9LAo+ICsJeyBQQ0lfREVWSUNFX1NVQihDNTAwMFhf
UExfVkVORE9SX0lELAo+ICsJCQkgQzUwMDBYX1BMX0RFVklDRV9JRCwKPiArCQkJIEM1MDAwWF9Q
TF9TVUJTWVNfVkVORE9SX0lELAo+ICsJCQkgQzUwMDBYX1BMX1NVQlNZU19ERVZJQ0VfSUQpIH0s
Cj4gKwo+ICAgCXsgMCB9LAo+ICAgfTsKPiAgIE1PRFVMRV9ERVZJQ0VfVEFCTEUocGNpLCBpZmN2
Zl9wY2lfaWRzKTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51
eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1h
bi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
