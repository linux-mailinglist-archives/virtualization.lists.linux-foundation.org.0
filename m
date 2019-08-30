Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 9213FA2D95
	for <lists.virtualization@lfdr.de>; Fri, 30 Aug 2019 05:50:00 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id B72165AF9;
	Fri, 30 Aug 2019 03:49:52 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 76EAB5A20
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 03:48:40 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
	by smtp1.linuxfoundation.org (Postfix) with ESMTPS id 2231AF1
	for <virtualization@lists.linux-foundation.org>;
	Fri, 30 Aug 2019 03:48:40 +0000 (UTC)
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9AA7A3082A6C;
	Fri, 30 Aug 2019 03:48:39 +0000 (UTC)
Received: from [10.72.12.92] (ovpn-12-92.pek2.redhat.com [10.72.12.92])
	by smtp.corp.redhat.com (Postfix) with ESMTP id AA6315C1D6;
	Fri, 30 Aug 2019 03:48:35 +0000 (UTC)
Subject: Re: [PATCH] virtio: Change typecasts in vring_init()
To: Matej Genci <matej.genci@nutanix.com>,
	"virtualization@lists.linux-foundation.org"
	<virtualization@lists.linux-foundation.org>, "mst@redhat.com"
	<mst@redhat.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <20190827152000.53920-1-matej.genci@nutanix.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <e6aa7fa1-8f41-fc55-51b2-5f0052cfb2d0@redhat.com>
Date: Fri, 30 Aug 2019 11:48:33 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190827152000.53920-1-matej.genci@nutanix.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.45]);
	Fri, 30 Aug 2019 03:48:39 +0000 (UTC)
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
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

Ck9uIDIwMTkvOC8yNyDkuIvljYgxMToyMCwgTWF0ZWogR2VuY2kgd3JvdGU6Cj4gQ29tcGlsZXJz
IHN1Y2ggYXMgZysrIDcuMyBjb21wbGFpbiBhYm91dCBhc3NpZ25pbmcgdm9pZCogdmFyaWFibGUg
dG8KPiBhIG5vbi12b2lkKiB2YXJpYWJsZSAobGlrZSBzdHJ1Y3QgcG9pbnRlcnMpIGFuZCBwb2lu
dGVyIGFyaXRobWV0aWNzCj4gb24gdm9pZCouCj4KPiBTaWduZWQtb2ZmLWJ5OiBNYXRlaiBHZW5j
aSA8bWF0ZWouZ2VuY2lAbnV0YW5peC5jb20+Cj4gLS0tCj4gIGluY2x1ZGUvdWFwaS9saW51eC92
aXJ0aW9fcmluZy5oIHwgOSArKysrKy0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDUgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9pbmNsdWRlL3VhcGkvbGludXgv
dmlydGlvX3JpbmcuaCBiL2luY2x1ZGUvdWFwaS9saW51eC92aXJ0aW9fcmluZy5oCj4gaW5kZXgg
NGM0ZTI0YzI5MWE1Li4yYzMzOWI5ZTI5MjMgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS91YXBpL2xp
bnV4L3ZpcnRpb19yaW5nLmgKPiArKysgYi9pbmNsdWRlL3VhcGkvbGludXgvdmlydGlvX3Jpbmcu
aAo+IEBAIC0xNjgsMTAgKzE2OCwxMSBAQCBzdGF0aWMgaW5saW5lIHZvaWQgdnJpbmdfaW5pdChz
dHJ1Y3QgdnJpbmcgKnZyLCB1bnNpZ25lZCBpbnQgbnVtLCB2b2lkICpwLAo+ICAJCQkgICAgICB1
bnNpZ25lZCBsb25nIGFsaWduKQo+ICB7Cj4gIAl2ci0+bnVtID0gbnVtOwo+IC0JdnItPmRlc2Mg
PSBwOwo+IC0JdnItPmF2YWlsID0gcCArIG51bSpzaXplb2Yoc3RydWN0IHZyaW5nX2Rlc2MpOwo+
IC0JdnItPnVzZWQgPSAodm9pZCAqKSgoKHVpbnRwdHJfdCkmdnItPmF2YWlsLT5yaW5nW251bV0g
KyBzaXplb2YoX192aXJ0aW8xNikKPiAtCQkrIGFsaWduLTEpICYgfihhbGlnbiAtIDEpKTsKPiAr
CXZyLT5kZXNjID0gKHN0cnVjdCB2cmluZ19kZXNjICopcDsKPiArCXZyLT5hdmFpbCA9IChzdHJ1
Y3QgdnJpbmdfYXZhaWwgKikoKHVpbnRwdHJfdClwCj4gKwkJKyBudW0qc2l6ZW9mKHN0cnVjdCB2
cmluZ19kZXNjKSk7CgoKSXQncyBiZXR0ZXIgdG8gbGV0IHRoZSBjb2RlIHBhc3MgY2hlY2twYXRo
LnBsIGhlcmUuCgpPdGhlciBsb29rcyBnb29kLgoKVGhhbmtzCgoKPiArCXZyLT51c2VkID0gKHN0
cnVjdCB2cmluZ191c2VkICopKCgodWludHB0cl90KSZ2ci0+YXZhaWwtPnJpbmdbbnVtXQo+ICsJ
CSsgc2l6ZW9mKF9fdmlydGlvMTYpICsgYWxpZ24tMSkgJiB+KGFsaWduIC0gMSkpOwo+ICB9Cj4g
IAo+ICBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIHZyaW5nX3NpemUodW5zaWduZWQgaW50IG51bSwg
dW5zaWduZWQgbG9uZyBhbGlnbikKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KVmlydHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxp
c3RzLmxpbnV4LWZvdW5kYXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1YWxpemF0aW9u
