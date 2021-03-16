Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BD033CDCB
	for <lists.virtualization@lfdr.de>; Tue, 16 Mar 2021 07:11:18 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D6A2E4EC2A;
	Tue, 16 Mar 2021 06:11:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9v_ZRD8R9qUa; Tue, 16 Mar 2021 06:11:15 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6BA004EC34;
	Tue, 16 Mar 2021 06:11:15 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 1443EC000A;
	Tue, 16 Mar 2021 06:11:15 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 9C1A7C000A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 06:11:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8A6284EC2A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 06:11:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y6X-6u_G0lOQ
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 06:11:12 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9E70B4EC27
 for <virtualization@lists.linux-foundation.org>;
 Tue, 16 Mar 2021 06:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615875071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PUbH8K+dxP06KIGzIKvVc1Q5rD/dHm6SKImpw8nnM+U=;
 b=dhgJyhl9WDXbSEA0q31dnzsfyHib1RuLIOQgXZJRk1kyYI552RoK9194R9oWgzLZzFqPze
 n2rED+51hyuS8qASg6GEF4PtA6pT7+qu8lu5AGeFtJPFgujctARjZdfzDhjLTEfYDkP1E2
 hZB0OzYCKBnU0nU7wEoi3K2wldlWK90=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-tUY7HdLWNHebOFDKeVnLUw-1; Tue, 16 Mar 2021 02:11:09 -0400
X-MC-Unique: tUY7HdLWNHebOFDKeVnLUw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 16E12760C4;
 Tue, 16 Mar 2021 06:11:08 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-12-216.pek2.redhat.com
 [10.72.12.216])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D1BC66F130;
 Tue, 16 Mar 2021 06:11:00 +0000 (UTC)
Subject: Re: [PATCH V4 3/7] vDPA/ifcvf: rename original IFCVF dev ids to N3000
 ids
To: Zhu Lingshan <lingshan.zhu@intel.com>, mst@redhat.com, lulu@redhat.com,
 leonro@nvidia.com
References: <20210315074501.15868-1-lingshan.zhu@intel.com>
 <20210315074501.15868-4-lingshan.zhu@intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <09a56b2e-f184-d003-a789-007d4a854975@redhat.com>
Date: Tue, 16 Mar 2021 14:10:59 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210315074501.15868-4-lingshan.zhu@intel.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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
Content-Type: text/plain; charset="gbk"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

CtTaIDIwMjEvMy8xNSDPws7nMzo0NCwgWmh1IExpbmdzaGFuINC0tcA6Cj4gSUZDVkYgZHJpdmVy
IHByb2JlcyBtdWx0aXBsZSB0eXBlcyBvZiBkZXZpY2VzIG5vdywKPiB0byBkaXN0aW5ndWlzaCB0
aGUgb3JpZ2luYWwgZGV2aWNlIGRyaXZlbiBieSBJRkNWRgo+IGZyb20gb3RoZXJzLCBpdCBpcyBy
ZW5hbWVkIGFzICJOMzAwMCIuCj4KPiBTaWduZWQtb2ZmLWJ5OiBaaHUgTGluZ3NoYW4gPGxpbmdz
aGFuLnpodUBpbnRlbC5jb20+CgoKQWNrZWQtYnk6IEphc29uIFdhbmcgPGphc293YW5nQHJlZGhh
dC5jb20+CgpJZiB5b3Ugd2FudCB0byBoYXZlIGEgZ2VuZXJhbCBkcml2ZXIsIHlvdSBwcm9iYWJ5
IG5lZWQgdG8gcmVuYW1lIHRoZSBkcml2ZXIuCgpUaGFua3MKCgo+IC0tLQo+ICAgZHJpdmVycy92
ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuaCB8IDggKysrKy0tLS0KPiAgIGRyaXZlcnMvdmRwYS9pZmN2
Zi9pZmN2Zl9tYWluLmMgfCA4ICsrKystLS0tCj4gICAyIGZpbGVzIGNoYW5nZWQsIDggaW5zZXJ0
aW9ucygrKSwgOCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL3ZkcGEvaWZj
dmYvaWZjdmZfYmFzZS5oIGIvZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX2Jhc2UuaAo+IGluZGV4
IDc1ZDlhODA1MjAzOS4uNzk0ZDE1MDVkODU3IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvdmRwYS9p
ZmN2Zi9pZmN2Zl9iYXNlLmgKPiArKysgYi9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfYmFzZS5o
Cj4gQEAgLTE4LDEwICsxOCwxMCBAQAo+ICAgI2luY2x1ZGUgPHVhcGkvbGludXgvdmlydGlvX2Nv
bmZpZy5oPgo+ICAgI2luY2x1ZGUgPHVhcGkvbGludXgvdmlydGlvX3BjaS5oPgo+ICAgCj4gLSNk
ZWZpbmUgSUZDVkZfVkVORE9SX0lECQkweDFBRjQKPiAtI2RlZmluZSBJRkNWRl9ERVZJQ0VfSUQJ
CTB4MTA0MQo+IC0jZGVmaW5lIElGQ1ZGX1NVQlNZU19WRU5ET1JfSUQJMHg4MDg2Cj4gLSNkZWZp
bmUgSUZDVkZfU1VCU1lTX0RFVklDRV9JRAkweDAwMUEKPiArI2RlZmluZSBOMzAwMF9WRU5ET1Jf
SUQJCTB4MUFGNAo+ICsjZGVmaW5lIE4zMDAwX0RFVklDRV9JRAkJMHgxMDQxCj4gKyNkZWZpbmUg
TjMwMDBfU1VCU1lTX1ZFTkRPUl9JRAkweDgwODYKPiArI2RlZmluZSBOMzAwMF9TVUJTWVNfREVW
SUNFX0lECTB4MDAxQQo+ICAgCj4gICAjZGVmaW5lIEM1MDAwWF9QTF9WRU5ET1JfSUQJCTB4MUFG
NAo+ICAgI2RlZmluZSBDNTAwMFhfUExfREVWSUNFX0lECQkweDEwMDAKPiBkaWZmIC0tZ2l0IGEv
ZHJpdmVycy92ZHBhL2lmY3ZmL2lmY3ZmX21haW4uYyBiL2RyaXZlcnMvdmRwYS9pZmN2Zi9pZmN2
Zl9tYWluLmMKPiBpbmRleCAyNmEyZGFiN2NhNjYuLmZkNWJlZmM1Y2JjYyAxMDA2NDQKPiAtLS0g
YS9kcml2ZXJzL3ZkcGEvaWZjdmYvaWZjdmZfbWFpbi5jCj4gKysrIGIvZHJpdmVycy92ZHBhL2lm
Y3ZmL2lmY3ZmX21haW4uYwo+IEBAIC00ODAsMTAgKzQ4MCwxMCBAQCBzdGF0aWMgdm9pZCBpZmN2
Zl9yZW1vdmUoc3RydWN0IHBjaV9kZXYgKnBkZXYpCj4gICB9Cj4gICAKPiAgIHN0YXRpYyBzdHJ1
Y3QgcGNpX2RldmljZV9pZCBpZmN2Zl9wY2lfaWRzW10gPSB7Cj4gLQl7IFBDSV9ERVZJQ0VfU1VC
KElGQ1ZGX1ZFTkRPUl9JRCwKPiAtCQlJRkNWRl9ERVZJQ0VfSUQsCj4gLQkJSUZDVkZfU1VCU1lT
X1ZFTkRPUl9JRCwKPiAtCQlJRkNWRl9TVUJTWVNfREVWSUNFX0lEKSB9LAo+ICsJeyBQQ0lfREVW
SUNFX1NVQihOMzAwMF9WRU5ET1JfSUQsCj4gKwkJCSBOMzAwMF9ERVZJQ0VfSUQsCj4gKwkJCSBO
MzAwMF9TVUJTWVNfVkVORE9SX0lELAo+ICsJCQkgTjMwMDBfU1VCU1lTX0RFVklDRV9JRCkgfSwK
PiAgIAl7IFBDSV9ERVZJQ0VfU1VCKEM1MDAwWF9QTF9WRU5ET1JfSUQsCj4gICAJCQkgQzUwMDBY
X1BMX0RFVklDRV9JRCwKPiAgIAkJCSBDNTAwMFhfUExfU1VCU1lTX1ZFTkRPUl9JRCwKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9u
IG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpo
dHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFs
aXphdGlvbg==
