Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D555354D23
	for <lists.virtualization@lfdr.de>; Tue,  6 Apr 2021 08:56:00 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9A46F60888;
	Tue,  6 Apr 2021 06:55:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0AEbMoZdfJJI; Tue,  6 Apr 2021 06:55:57 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5051960A6B;
	Tue,  6 Apr 2021 06:55:57 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id BE6ABC000A;
	Tue,  6 Apr 2021 06:55:56 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id A9D40C000A
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 06:55:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 828394049C
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 06:55:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HVjF7mla85-S
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 06:55:54 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BC5AE40282
 for <virtualization@lists.linux-foundation.org>;
 Tue,  6 Apr 2021 06:55:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1617692153;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dX5orlTGdb4bJ6Az1N9tjYF5g2lu2ijEDoMKzlNTE8g=;
 b=Yg6M1zWsZZrKMVTMCdOvhqCx/GDaVhE+915kUxnGX5DT/w9HGy8kelYBUFn1E7oC21XiEA
 6DEUgHCfF7YYjAEALJl2vySjHOKNe0giXrl5hetqnTKiz6NlEaaaDUwS6VhEQEvPuwVWfc
 Ns4EaXdlg27pMsAGNp0HW2PYTUe+yas=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-CdEy8GphMMC26czYaIQ2nQ-1; Tue, 06 Apr 2021 02:55:49 -0400
X-MC-Unique: CdEy8GphMMC26czYaIQ2nQ-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7824F1922020;
 Tue,  6 Apr 2021 06:55:47 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-95.pek2.redhat.com
 [10.72.13.95])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 09BD65D9DC;
 Tue,  6 Apr 2021 06:55:37 +0000 (UTC)
Subject: Re: [PATCH net-next v3 5/8] virtio-net: xsk zero copy xmit support
 xsk unaligned mode
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org
References: <20210331071139.15473-1-xuanzhuo@linux.alibaba.com>
 <20210331071139.15473-6-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <44b460db-d852-7151-9833-21fed25ecdc7@redhat.com>
Date: Tue, 6 Apr 2021 14:55:36 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210331071139.15473-6-xuanzhuo@linux.alibaba.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
 Dust Li <dust.li@linux.alibaba.com>, Jonathan Lemon <jonathan.lemon@gmail.com>,
 KP Singh <kpsingh@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 bpf@vger.kernel.org, virtualization@lists.linux-foundation.org,
 "David S. Miller" <davem@davemloft.net>,
 Magnus Karlsson <magnus.karlsson@intel.com>
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

CtTaIDIwMjEvMy8zMSDPws7nMzoxMSwgWHVhbiBaaHVvINC0tcA6Cj4gSW4geHNrIHVuYWxpZ25l
ZCBtb2RlLCB0aGUgZnJhbWUgcG9pbnRlZCB0byBieSBkZXNjIG1heSBzcGFuIHR3bwo+IGNvbnNl
Y3V0aXZlIHBhZ2VzLCBidXQgbm90IG1vcmUgdGhhbiB0d28gcGFnZXMuCj4KPiBTaWduZWQtb2Zm
LWJ5OiBYdWFuIFpodW8gPHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29tPgo+IFJldmlld2VkLWJ5
OiBEdXN0IExpIDxkdXN0LmxpQGxpbnV4LmFsaWJhYmEuY29tPgoKCkknZCBzcXVhc2ggdGhpcyBw
YXRjaCBpbnRvIHBhdGNoIDQuCgoKPiAtLS0KPiAgIGRyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyB8
IDMwICsrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLQo+ICAgMSBmaWxlIGNoYW5nZWQsIDI0
IGluc2VydGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9u
ZXQvdmlydGlvX25ldC5jIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gaW5kZXggYzhhMzE3
YTkzZWY3Li4yNTlmYWZjZjYwMjggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvdmlydGlvX25l
dC5jCj4gKysrIGIvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gQEAgLTI1NjIsMjQgKzI1NjIs
NDIgQEAgc3RhdGljIHZvaWQgdmlydG5ldF94c2tfY2hlY2tfc3BhY2Uoc3RydWN0IHNlbmRfcXVl
dWUgKnNxKQo+ICAgc3RhdGljIGludCB2aXJ0bmV0X3hza194bWl0KHN0cnVjdCBzZW5kX3F1ZXVl
ICpzcSwgc3RydWN0IHhza19idWZmX3Bvb2wgKnBvb2wsCj4gICAJCQkgICAgc3RydWN0IHhkcF9k
ZXNjICpkZXNjKQo+ICAgewo+ICsJdTMyIG9mZnNldCwgbiwgaSwgY29weSwgY29waWVkOwoKCkxl
dCdzIHVzZSBhIGJldHRlciBuYW1lIHNpbmNlIHdlIGRvbid0IGFjdHVhbGx5IGNvcHkgYW55dGhp
bmcgaGVyZS4KCgo+ICAgCXN0cnVjdCB2aXJ0bmV0X2luZm8gKnZpOwo+ICAgCXN0cnVjdCBwYWdl
ICpwYWdlOwo+ICAgCXZvaWQgKmRhdGE7Cj4gLQl1MzIgb2Zmc2V0Owo+ICsJaW50IGVyciwgbTsK
PiAgIAl1NjQgYWRkcjsKPiAtCWludCBlcnI7Cj4gICAKPiAgIAl2aSA9IHNxLT52cS0+dmRldi0+
cHJpdjsKPiAgIAlhZGRyID0gZGVzYy0+YWRkcjsKPiArCj4gICAJZGF0YSA9IHhza19idWZmX3Jh
d19nZXRfZGF0YShwb29sLCBhZGRyKTsKPiArCj4gICAJb2Zmc2V0ID0gb2Zmc2V0X2luX3BhZ2Uo
ZGF0YSk7Cj4gKwltID0gZGVzYy0+bGVuIC0gKFBBR0VfU0laRSAtIG9mZnNldCk7Cj4gKwkvKiB4
c2sgdW5hbGlnbmVkIG1vZGUsIGRlc2Mgd2lsbCB1c2UgdHdvIHBhZ2UgKi8KPiArCWlmIChtID4g
MCkKPiArCQluID0gMzsKPiArCWVsc2UKPiArCQluID0gMjsKPiAgIAo+IC0Jc2dfaW5pdF90YWJs
ZShzcS0+c2csIDIpOwo+ICsJc2dfaW5pdF90YWJsZShzcS0+c2csIG4pOwo+ICAgCXNnX3NldF9i
dWYoc3EtPnNnLCAmeHNrX2hkciwgdmktPmhkcl9sZW4pOwo+IC0JcGFnZSA9IHhza19idWZmX3hk
cF9nZXRfcGFnZShwb29sLCBhZGRyKTsKPiAtCXNnX3NldF9wYWdlKHNxLT5zZyArIDEsIHBhZ2Us
IGRlc2MtPmxlbiwgb2Zmc2V0KTsKPiAgIAo+IC0JZXJyID0gdmlydHF1ZXVlX2FkZF9vdXRidWYo
c3EtPnZxLCBzcS0+c2csIDIsIE5VTEwsIEdGUF9BVE9NSUMpOwo+ICsJY29waWVkID0gMDsKPiAr
CWZvciAoaSA9IDE7IGkgPCBuOyArK2kpIHsKPiArCQljb3B5ID0gbWluX3QoaW50LCBkZXNjLT5s
ZW4gLSBjb3BpZWQsIFBBR0VfU0laRSAtIG9mZnNldCk7Cj4gKwo+ICsJCXBhZ2UgPSB4c2tfYnVm
Zl94ZHBfZ2V0X3BhZ2UocG9vbCwgYWRkciArIGNvcGllZCk7Cj4gKwo+ICsJCXNnX3NldF9wYWdl
KHNxLT5zZyArIGksIHBhZ2UsIGNvcHksIG9mZnNldCk7Cj4gKwkJY29waWVkICs9IGNvcHk7Cj4g
KwkJaWYgKG9mZnNldCkKPiArCQkJb2Zmc2V0ID0gMDsKPiArCX0KCgpDYW4gd2Ugc2ltcGxpZnkg
dGhlIGNvZGVzIGJ5IHVzaW5nIHdoaWxlIGhlcmU/IFRoZW4gSSB0aGluayB3ZSBkb24ndCAKbmVl
ZCB0byBkZXRlcm1pbmUgdGhlIHZhbHVlIG9mIG4uCgpUaGFua3MKCgo+ICsKPiArCWVyciA9IHZp
cnRxdWV1ZV9hZGRfb3V0YnVmKHNxLT52cSwgc3EtPnNnLCBuLCBOVUxMLCBHRlBfQVRPTUlDKTsK
PiAgIAlpZiAodW5saWtlbHkoZXJyKSkKPiAgIAkJc3EtPnhzay5sYXN0X2Rlc2MgPSAqZGVzYzsK
PiAgIAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmly
dHVhbGl6YXRpb24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5k
YXRpb24ub3JnCmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL3ZpcnR1YWxpemF0aW9u
