Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from mail.linuxfoundation.org (mail.linuxfoundation.org [140.211.169.12])
	by mail.lfdr.de (Postfix) with ESMTPS id 64B1CE0483
	for <lists.virtualization@lfdr.de>; Tue, 22 Oct 2019 15:06:34 +0200 (CEST)
Received: from mail.linux-foundation.org (localhost [127.0.0.1])
	by mail.linuxfoundation.org (Postfix) with ESMTP id D697C1057;
	Tue, 22 Oct 2019 13:06:28 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@mail.linuxfoundation.org
Received: from smtp1.linuxfoundation.org (smtp1.linux-foundation.org
	[172.17.192.35])
	by mail.linuxfoundation.org (Postfix) with ESMTPS id 6DDC4D3B
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 13:06:27 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com
	(us-smtp-delivery-1.mimecast.com [205.139.110.120])
	by smtp1.linuxfoundation.org (Postfix) with ESMTP id E6C95896
	for <virtualization@lists.linux-foundation.org>;
	Tue, 22 Oct 2019 13:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1571749585;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=Syfd0H8D/BZLCngMYW2+8Gfqpo3syPeWg7AigfxOHa0=;
	b=T7IdaOvNunr1wNsBP9ffS7PduaqV/tkwfalTxTZHSFu2y5t0mfQs8spb0eri7IZW8uUrtV
	rrb+UFDXuLjq9C914hc/Qfh3z7NWwhFOM7psQZVi80IMd0wQq7xXT9sKS+HmyyHwrji21v
	YGXIuhVoFUdobL2AKLepAiu27t238w4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
	[209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
	us-mta-150-71H0vHNaOHmN2MZTv4qjeg-1; Tue, 22 Oct 2019 09:06:22 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ABD6B800D4E;
	Tue, 22 Oct 2019 13:06:20 +0000 (UTC)
Received: from [10.72.12.23] (ovpn-12-23.pek2.redhat.com [10.72.12.23])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 514B819C69;
	Tue, 22 Oct 2019 13:06:00 +0000 (UTC)
Subject: Re: [RFC 2/2] vhost: IFC VF vdpa layer
To: Zhu Lingshan <lingshan.zhu@linux.intel.com>,
	"Zhu, Lingshan" <lingshan.zhu@intel.com>, mst@redhat.com,
	alex.williamson@redhat.com
References: <20191016013050.3918-1-lingshan.zhu@intel.com>
	<20191016013050.3918-3-lingshan.zhu@intel.com>
	<9495331d-3c65-6f49-dcd9-bfdb17054cf0@redhat.com>
	<f65358e9-6728-8260-74f7-176d7511e989@intel.com>
	<1cae60b6-938d-e2df-2dca-fbf545f06853@redhat.com>
	<ddf412c6-69e2-b3ca-d0c8-75de1db78ed9@linux.intel.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <b2adaab0-bbc3-b7f0-77da-e1e3cab93b76@redhat.com>
Date: Tue, 22 Oct 2019 21:05:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <ddf412c6-69e2-b3ca-d0c8-75de1db78ed9@linux.intel.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: 71H0vHNaOHmN2MZTv4qjeg-1
X-Mimecast-Spam-Score: 0
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	smtp1.linux-foundation.org
Cc: kvm@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	virtualization@lists.linux-foundation.org, zhiyuan.lv@intel.com,
	jason.zeng@intel.com
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: virtualization-bounces@lists.linux-foundation.org
Errors-To: virtualization-bounces@lists.linux-foundation.org

Ck9uIDIwMTkvMTAvMjIg5LiL5Y2IMjo1MywgWmh1IExpbmdzaGFuIHdyb3RlOgo+Cj4gT24gMTAv
MjEvMjAxOSA2OjE5IFBNLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pgo+PiBPbiAyMDE5LzEwLzIxIOS4
i+WNiDU6NTMsIFpodSwgTGluZ3NoYW4gd3JvdGU6Cj4+Pgo+Pj4gT24gMTAvMTYvMjAxOSA2OjE5
IFBNLCBKYXNvbiBXYW5nIHdyb3RlOgo+Pj4+Cj4+Pj4gT24gMjAxOS8xMC8xNiDkuIrljYg5OjMw
LCBaaHUgTGluZ3NoYW4gd3JvdGU6Cj4+Pj4+IFRoaXMgY29tbWl0IGludHJvZHVjZWQgSUZDIFZG
IG9wZXJhdGlvbnMgZm9yIHZkcGEsIHdoaWNoIGNvbXBseXMgdG8KPj4+Pj4gdmhvc3RfbWRldiBp
bnRlcmZhY2VzLCBoYW5kbGVzIElGQyBWRiBpbml0aWFsaXphdGlvbiwKPj4+Pj4gY29uZmlndXJh
dGlvbiBhbmQgcmVtb3ZhbC4KPj4+Pj4KPj4+Pj4gU2lnbmVkLW9mZi1ieTogWmh1IExpbmdzaGFu
IDxsaW5nc2hhbi56aHVAaW50ZWwuY29tPgo+Pj4+PiAtLS0KCgpbLi4uXQoKCj4+Cj4+Cj4+Pgo+
Pj4+Cj4+Pj4KPj4+Pj4gK30KPj4+Pj4gKwo+Pj4+PiArc3RhdGljIGludCBpZmN2Zl9tZGV2X3Nl
dF9mZWF0dXJlcyhzdHJ1Y3QgbWRldl9kZXZpY2UgKm1kZXYsIHU2NCAKPj4+Pj4gZmVhdHVyZXMp
Cj4+Pj4+ICt7Cj4+Pj4+ICvCoMKgwqAgc3RydWN0IGlmY3ZmX2FkYXB0ZXIgKmFkYXB0ZXIgPSBt
ZGV2X2dldF9kcnZkYXRhKG1kZXYpOwo+Pj4+PiArwqDCoMKgIHN0cnVjdCBpZmN2Zl9odyAqdmYg
PSBJRkNfUFJJVkFURV9UT19WRihhZGFwdGVyKTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIHZmLT5y
ZXFfZmVhdHVyZXMgPSBmZWF0dXJlczsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIHJldHVybiAwOwo+
Pj4+PiArfQo+Pj4+PiArCj4+Pj4+ICtzdGF0aWMgdTY0IGlmY3ZmX21kZXZfZ2V0X3ZxX3N0YXRl
KHN0cnVjdCBtZGV2X2RldmljZSAqbWRldiwgdTE2IAo+Pj4+PiBxaWQpCj4+Pj4+ICt7Cj4+Pj4+
ICvCoMKgwqAgc3RydWN0IGlmY3ZmX2FkYXB0ZXIgKmFkYXB0ZXIgPSBtZGV2X2dldF9kcnZkYXRh
KG1kZXYpOwo+Pj4+PiArwqDCoMKgIHN0cnVjdCBpZmN2Zl9odyAqdmYgPSBJRkNfUFJJVkFURV9U
T19WRihhZGFwdGVyKTsKPj4+Pj4gKwo+Pj4+PiArwqDCoMKgIHJldHVybiB2Zi0+dnJpbmdbcWlk
XS5sYXN0X2F2YWlsX2lkeDsKPj4+Pgo+Pj4+Cj4+Pj4gRG9lcyB0aGlzIHJlYWxseSB3b3JrPyBJ
J2QgZXhwZWN0IGl0IHNob3VsZCBiZSBmZXRjaGVkIGZyb20gaHcgCj4+Pj4gc2luY2UgaXQncyBh
biBpbnRlcm5hbCBzdGF0ZS4KPj4+IGZvciBub3csIGl0J3Mgd29ya2luZywgd2UgaW50ZW5kIHRv
IHN1cHBvcnQgTE0gaW4gbmV4dCB2ZXJzaW9uIGRyaXZlcnMuCj4+Cj4+Cj4+IEknbSBub3Qgc3Vy
ZSBJIHVuZGVyc3RhbmQgaGVyZSwgSSBkb24ndCBzZWUgYW55IHN5bmNocm9uaXphdGlvbiAKPj4g
YmV0d2VlbiB0aGUgaGFyZHdhcmUgYW5kIGxhc3RfYXZhaWxfaWR4LCBzbyBsYXN0X2F2YWlsX2lk
eCBzaG91bGQgbm90IAo+PiBjaGFuZ2UuCj4+Cj4+IEJ0dywgd2hhdCBkaWQgIkxNIiBtZWFuIDop
ID8KPgo+IEkgY2FuIGFkZCBiYXIgSU8gb3BlcmF0aW9ucyBoZXJlLCBMTSA9IGxpdmUgbWlncmF0
aW9uLCBzb3JyeSBmb3IgdGhlIAo+IGFiYnJldmlhdGlvbi4KCgpKdXN0IG1ha2Ugc3VyZSBJIHVu
ZGVyc3RhbmQgaGVyZSwgSSBiZWxpZXZlIHlvdSBtZWFuIHJlYWRpbmcgCmxhc3RfYXZhaWxfaWR4
IHRocm91Z2ggSU8gYmFyIGhlcmU/CgpUaGFua3MKCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpWaXJ0dWFsaXphdGlvbiBtYWlsaW5nIGxpc3QKVmlydHVh
bGl6YXRpb25AbGlzdHMubGludXgtZm91bmRhdGlvbi5vcmcKaHR0cHM6Ly9saXN0cy5saW51eGZv
dW5kYXRpb24ub3JnL21haWxtYW4vbGlzdGluZm8vdmlydHVhbGl6YXRpb24=
