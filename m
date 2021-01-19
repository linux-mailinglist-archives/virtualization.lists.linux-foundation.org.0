Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	by mail.lfdr.de (Postfix) with ESMTPS id 682582FAF98
	for <lists.virtualization@lfdr.de>; Tue, 19 Jan 2021 05:50:49 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by whitealder.osuosl.org (Postfix) with ESMTP id 1EFA9869D8;
	Tue, 19 Jan 2021 04:50:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EJxsLzxau0-G; Tue, 19 Jan 2021 04:50:47 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by whitealder.osuosl.org (Postfix) with ESMTP id 2B6F3869E2;
	Tue, 19 Jan 2021 04:50:47 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 0BEACC013A;
	Tue, 19 Jan 2021 04:50:47 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from whitealder.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists.linuxfoundation.org (Postfix) with ESMTP id EE320C013A
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 04:50:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by whitealder.osuosl.org (Postfix) with ESMTP id D5315869D0
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 04:50:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from whitealder.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zU3FmzVmTtoO
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 04:50:44 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by whitealder.osuosl.org (Postfix) with ESMTPS id 206DD869CA
 for <virtualization@lists.linux-foundation.org>;
 Tue, 19 Jan 2021 04:50:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611031842;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+pWJ5GsR3rIWfGKSFBKQvCj+fn1kzsSBRyszU33k/C0=;
 b=JKxg3P5n4Kg5v91AKrdtItc/2Wr29/5d1lLwdYdrXcOisq66AV1dhumOLhJ3CwdeXqdkzP
 HYSOML7oQrDppC4ym2htgKce9sXS3ld72AVo5sH8MZ2xAA435ntg3piEvWcyLi5AnJkmdl
 YBG5i3C8DW/iHrBVFAa1OkO3TAVZUlo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-NUaHJrLCOreuFUI5Xhnylw-1; Mon, 18 Jan 2021 23:50:38 -0500
X-MC-Unique: NUaHJrLCOreuFUI5Xhnylw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 99CFB801817;
 Tue, 19 Jan 2021 04:50:35 +0000 (UTC)
Received: from [10.72.13.139] (ovpn-13-139.pek2.redhat.com [10.72.13.139])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 15FA563657;
 Tue, 19 Jan 2021 04:50:26 +0000 (UTC)
Subject: Re: [PATCH net-next v2 6/7] virtio-net, xsk: implement xsk wakeup
 callback
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, netdev@vger.kernel.org
References: <cover.1609837120.git.xuanzhuo@linux.alibaba.com>
 <cover.1610765285.git.xuanzhuo@linux.alibaba.com>
 <2abdfb0b319d4075b68d50d2be9f441b75735e64.1610765285.git.xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <bf06c9a1-60da-0a6f-23a3-2ea86edc0bde@redhat.com>
Date: Tue, 19 Jan 2021 12:50:25 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <2abdfb0b319d4075b68d50d2be9f441b75735e64.1610765285.git.xuanzhuo@linux.alibaba.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Cc: Song Liu <songliubraving@fb.com>, Martin KaFai Lau <kafai@fb.com>,
 Jesper Dangaard Brouer <hawk@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, "Michael S. Tsirkin" <mst@redhat.com>,
 Yonghong Song <yhs@fb.com>, John Fastabend <john.fastabend@gmail.com>,
 Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>,
 Jonathan Lemon <jonathan.lemon@gmail.com>, KP Singh <kpsingh@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, bpf@vger.kernel.org,
 =?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn.topel@intel.com>,
 virtualization@lists.linux-foundation.org,
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
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

Ck9uIDIwMjEvMS8xNiDkuIrljYgxMDo1OSwgWHVhbiBaaHVvIHdyb3RlOgo+IFNpbmNlIEkgZGlk
IG5vdCBmaW5kIGFuIGludGVyZmFjZSB0byBkaXJlY3RseSBub3RpZnkgdmlydGlvIHRvIGdlbmVy
YXRlCj4gYSB0eCBpbnRlcnJ1cHQsIEkgc2VudCBzb21lIGRhdGEgdG8gdHJpZ2dlciBhIG5ldyB0
eCBpbnRlcnJ1cHQuCj4KPiBBbm90aGVyIGFkdmFudGFnZSBvZiB0aGlzIGlzIHRoYXQgdGhlIHRy
YW5zbWlzc2lvbiBkZWxheSB3aWxsIGJlCj4gcmVsYXRpdmVseSBzbWFsbCwgYW5kIHRoZXJlIGlz
IG5vIG5lZWQgdG8gd2FpdCBmb3IgdGhlIHR4IGludGVycnVwdCB0bwo+IHN0YXJ0IHNvZnRpcnEu
Cj4KPiBTaWduZWQtb2ZmLWJ5OiBYdWFuIFpodW8gPHh1YW56aHVvQGxpbnV4LmFsaWJhYmEuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy9uZXQvdmlydGlvX25ldC5jIHwgNTEgKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gICAxIGZpbGUgY2hhbmdlZCwgNTEg
aW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYyBi
L2RyaXZlcnMvbmV0L3ZpcnRpb19uZXQuYwo+IGluZGV4IDQyYWE5YWQuLmU1NTJjMmQgMTAwNjQ0
Cj4gLS0tIGEvZHJpdmVycy9uZXQvdmlydGlvX25ldC5jCj4gKysrIGIvZHJpdmVycy9uZXQvdmly
dGlvX25ldC5jCj4gQEAgLTI4NDEsNiArMjg0MSw1NiBAQCBzdGF0aWMgaW50IHZpcnRuZXRfeHNr
X3J1bihzdHJ1Y3Qgc2VuZF9xdWV1ZSAqc3EsCj4gICAJcmV0dXJuIHJldDsKPiAgIH0KPiAgIAo+
ICtzdGF0aWMgaW50IHZpcnRuZXRfeHNrX3dha2V1cChzdHJ1Y3QgbmV0X2RldmljZSAqZGV2LCB1
MzIgcWlkLCB1MzIgZmxhZykKPiArewo+ICsJc3RydWN0IHZpcnRuZXRfaW5mbyAqdmkgPSBuZXRk
ZXZfcHJpdihkZXYpOwo+ICsJc3RydWN0IHNlbmRfcXVldWUgKnNxOwo+ICsJc3RydWN0IHhza19i
dWZmX3Bvb2wgKnBvb2w7Cj4gKwlzdHJ1Y3QgbmV0ZGV2X3F1ZXVlICp0eHE7Cj4gKwo+ICsJaWYg
KCFuZXRpZl9ydW5uaW5nKGRldikpCj4gKwkJcmV0dXJuIC1FTkVURE9XTjsKPiArCj4gKwlpZiAo
cWlkID49IHZpLT5jdXJyX3F1ZXVlX3BhaXJzKQo+ICsJCXJldHVybiAtRUlOVkFMOwo+ICsKPiAr
CXNxID0gJnZpLT5zcVtxaWRdOwo+ICsKPiArCXJjdV9yZWFkX2xvY2soKTsKPiArCj4gKwlwb29s
ID0gcmN1X2RlcmVmZXJlbmNlKHNxLT54c2sucG9vbCk7Cj4gKwlpZiAoIXBvb2wpCj4gKwkJZ290
byBlbmQ7Cj4gKwo+ICsJaWYgKHRlc3RfYW5kX3NldF9iaXQoVklSVE5FVF9TVEFURV9YU0tfV0FL
RVVQLCAmc3EtPnhzay5zdGF0ZSkpCj4gKwkJZ290byBlbmQ7Cj4gKwo+ICsJdHhxID0gbmV0ZGV2
X2dldF90eF9xdWV1ZShkZXYsIHFpZCk7Cj4gKwo+ICsJbG9jYWxfYmhfZGlzYWJsZSgpOwo+ICsJ
X19uZXRpZl90eF9sb2NrKHR4cSwgcmF3X3NtcF9wcm9jZXNzb3JfaWQoKSk7CgoKWW91IGNhbiB1
c2UgX19uZXRpZl90eF9sb2NrX2JoKCkuCgpUaGFua3MKCgo+ICsKPiArCS8qIFNlbmQgcGFydCBv
ZiB0aGUgcGFja2FnZSBkaXJlY3RseSB0byByZWR1Y2UgdGhlIGRlbGF5IGluIHNlbmRpbmcgdGhl
Cj4gKwkgKiBwYWNrYWdlLCBhbmQgdGhpcyBjYW4gYWN0aXZlbHkgdHJpZ2dlciB0aGUgdHggaW50
ZXJydXB0cy4KPiArCSAqCj4gKwkgKiBJZiB0aGUgcGFja2FnZSBpcyBub3QgcHJvY2Vzc2VkLCB0
aGVuIGNvbnRpbnVlIHByb2Nlc3NpbmcgaW4gdGhlCj4gKwkgKiBzdWJzZXF1ZW50IHR4IGludGVy
cnVwdCh2aXJ0bmV0X3BvbGxfdHgpLgo+ICsJICoKPiArCSAqIElmIG5vIHBhY2tldCBpcyBzZW50
IG91dCwgdGhlIHJpbmcgb2YgdGhlIGRldmljZSBpcyBmdWxsLiBJbiB0aGlzCj4gKwkgKiBjYXNl
LCB3ZSB3aWxsIHN0aWxsIGdldCBhIHR4IGludGVycnVwdCByZXNwb25zZS4gVGhlbiB3ZSB3aWxs
IGRlYWwKPiArCSAqIHdpdGggdGhlIHN1YnNlcXVlbnQgcGFja2V0IHNlbmRpbmcgd29yay4KPiAr
CSAqLwo+ICsKPiArCXZpcnRuZXRfeHNrX3J1bihzcSwgcG9vbCwgeHNrX2J1ZGdldCk7Cj4gKwo+
ICsJX19uZXRpZl90eF91bmxvY2sodHhxKTsKPiArCWxvY2FsX2JoX2VuYWJsZSgpOwo+ICsKPiAr
ZW5kOgo+ICsJcmN1X3JlYWRfdW5sb2NrKCk7Cj4gKwlyZXR1cm4gMDsKPiArfQo+ICsKPiAgIHN0
YXRpYyBpbnQgdmlydG5ldF9nZXRfcGh5c19wb3J0X25hbWUoc3RydWN0IG5ldF9kZXZpY2UgKmRl
diwgY2hhciAqYnVmLAo+ICAgCQkJCSAgICAgIHNpemVfdCBsZW4pCj4gICB7Cj4gQEAgLTI4OTUs
NiArMjk0NSw3IEBAIHN0YXRpYyBpbnQgdmlydG5ldF9zZXRfZmVhdHVyZXMoc3RydWN0IG5ldF9k
ZXZpY2UgKmRldiwKPiAgIAkubmRvX3ZsYW5fcnhfa2lsbF92aWQgPSB2aXJ0bmV0X3ZsYW5fcnhf
a2lsbF92aWQsCj4gICAJLm5kb19icGYJCT0gdmlydG5ldF94ZHAsCj4gICAJLm5kb194ZHBfeG1p
dAkJPSB2aXJ0bmV0X3hkcF94bWl0LAo+ICsJLm5kb194c2tfd2FrZXVwCQk9IHZpcnRuZXRfeHNr
X3dha2V1cCwKPiAgIAkubmRvX2ZlYXR1cmVzX2NoZWNrCT0gcGFzc3RocnVfZmVhdHVyZXNfY2hl
Y2ssCj4gICAJLm5kb19nZXRfcGh5c19wb3J0X25hbWUJPSB2aXJ0bmV0X2dldF9waHlzX3BvcnRf
bmFtZSwKPiAgIAkubmRvX3NldF9mZWF0dXJlcwk9IHZpcnRuZXRfc2V0X2ZlYXR1cmVzLAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KVmlydHVhbGl6YXRp
b24gbWFpbGluZyBsaXN0ClZpcnR1YWxpemF0aW9uQGxpc3RzLmxpbnV4LWZvdW5kYXRpb24ub3Jn
Cmh0dHBzOi8vbGlzdHMubGludXhmb3VuZGF0aW9uLm9yZy9tYWlsbWFuL2xpc3RpbmZvL3ZpcnR1
YWxpemF0aW9u
