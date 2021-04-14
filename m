Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	by mail.lfdr.de (Postfix) with ESMTPS id 432B335EF2B
	for <lists.virtualization@lfdr.de>; Wed, 14 Apr 2021 10:18:37 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D91840F25;
	Wed, 14 Apr 2021 08:18:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k97wYYGmzELf; Wed, 14 Apr 2021 08:18:34 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [IPv6:2605:bc80:3010:104::8cd3:938])
	by smtp4.osuosl.org (Postfix) with ESMTP id 879AF40F2F;
	Wed, 14 Apr 2021 08:18:33 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id 129ACC0012;
	Wed, 14 Apr 2021 08:18:33 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 520A1C000A
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 08:18:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2AE914013E
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 08:18:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=redhat.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t-3Iv0IYFjFe
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 08:18:31 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E9614400F3
 for <virtualization@lists.linux-foundation.org>;
 Wed, 14 Apr 2021 08:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618388309;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=drGuROoG7lj2vDETDU9JDvj19d1vG70cVaZLfEDasfQ=;
 b=HU4a9PnO3gI8C9EQ2fPCEPmYEHGvsJzLW48bmyOfEuJjK1Intb9XjR5U57wkuvY4jULtGX
 RlzZOhLWYv3IcSn6GPXfRAWTuHgIxw1sUY64wHkzIcDNreeE2vNqbqNNz+6iR4ZPC/6tpI
 zPdb+luymR6tnOb82kNY3RBqsy18ADs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-442-BEpTz7kFPZK4thdSD3eoIQ-1; Wed, 14 Apr 2021 04:18:28 -0400
X-MC-Unique: BEpTz7kFPZK4thdSD3eoIQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 74FE91883527;
 Wed, 14 Apr 2021 08:18:26 +0000 (UTC)
Received: from wangxiaodeMacBook-Air.local (ovpn-13-33.pek2.redhat.com
 [10.72.13.33])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B882B16ED7;
 Wed, 14 Apr 2021 08:18:13 +0000 (UTC)
Subject: Re: [PATCH v6 09/10] vduse: Introduce VDUSE - vDPA Device in Userspace
To: Yongji Xie <xieyongji@bytedance.com>
References: <20210331080519.172-1-xieyongji@bytedance.com>
 <20210331080519.172-10-xieyongji@bytedance.com>
 <c817178a-2ac8-bf93-1ed3-528579c657a3@redhat.com>
 <CACycT3v_KFQXoxRbEj8c0Ve6iKn9RbibtBDgBFs=rf0ZOmTBBQ@mail.gmail.com>
 <091dde74-449b-385c-0ec9-11e4847c6c4c@redhat.com>
 <CACycT3vwATp4+Ao0fjuyeeLQN+xHH=dXF+JUyuitkn4k8hELnA@mail.gmail.com>
 <dc9a90dd-4f86-988c-c1b5-ac606ce5e14b@redhat.com>
 <CACycT3vxO21Yt6+px2c2Q8DONNUNehdo2Vez_RKQCKe76CM2TA@mail.gmail.com>
 <0f386dfe-45c9-5609-55f7-b8ab2a4abf5e@redhat.com>
 <CACycT3vbDhUKM0OX-zo02go09gh2+EEdyZ_YQuz8PXzo3EngXw@mail.gmail.com>
 <a85c0a66-ad7f-a344-f8ed-363355f5e283@redhat.com>
 <CACycT3tHxtfgQhQgv0VyF_U523qASEv1Ydc4XuX43MFRzGVbfw@mail.gmail.com>
From: Jason Wang <jasowang@redhat.com>
Message-ID: <51cd2e3a-5b76-a6f5-da59-b118a7e13923@redhat.com>
Date: Wed, 14 Apr 2021 16:18:11 +0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.9.1
MIME-Version: 1.0
In-Reply-To: <CACycT3tHxtfgQhQgv0VyF_U523qASEv1Ydc4XuX43MFRzGVbfw@mail.gmail.com>
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Cc: Jens Axboe <axboe@kernel.dk>, Jonathan Corbet <corbet@lwn.net>,
 kvm@vger.kernel.org, "Michael S. Tsirkin" <mst@redhat.com>,
 netdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Matthew Wilcox <willy@infradead.org>,
 virtualization@lists.linux-foundation.org,
 Christoph Hellwig <hch@infradead.org>,
 Christian Brauner <christian.brauner@canonical.com>, bcrl@kvack.org,
 viro@zeniv.linux.org.uk, Stefan Hajnoczi <stefanha@redhat.com>,
 linux-fsdevel@vger.kernel.org, Dan Carpenter <dan.carpenter@oracle.com>,
 =?UTF-8?Q?Mika_Penttil=c3=a4?= <mika.penttila@nextfour.com>
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

CuWcqCAyMDIxLzQvMTMg5LiL5Y2IMTI6MjgsIFlvbmdqaSBYaWUg5YaZ6YGTOgo+IE9uIFR1ZSwg
QXByIDEzLCAyMDIxIGF0IDExOjM1IEFNIEphc29uIFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+
IHdyb3RlOgo+Pgo+PiDlnKggMjAyMS80LzEyIOS4i+WNiDU6NTksIFlvbmdqaSBYaWUg5YaZ6YGT
Ogo+Pj4gT24gTW9uLCBBcHIgMTIsIDIwMjEgYXQgNTozNyBQTSBKYXNvbiBXYW5nIDxqYXNvd2Fu
Z0ByZWRoYXQuY29tPiB3cm90ZToKPj4+PiDlnKggMjAyMS80LzEyIOS4i+WNiDQ6MDIsIFlvbmdq
aSBYaWUg5YaZ6YGTOgo+Pj4+PiBPbiBNb24sIEFwciAxMiwgMjAyMSBhdCAzOjE2IFBNIEphc29u
IFdhbmcgPGphc293YW5nQHJlZGhhdC5jb20+IHdyb3RlOgo+Pj4+Pj4g5ZyoIDIwMjEvNC85IOS4
i+WNiDQ6MDIsIFlvbmdqaSBYaWUg5YaZ6YGTOgo+Pj4+Pj4+Pj4+PiArfTsKPj4+Pj4+Pj4+Pj4g
Kwo+Pj4+Pj4+Pj4+PiArc3RydWN0IHZkdXNlX2Rldl9jb25maWdfZGF0YSB7Cj4+Pj4+Pj4+Pj4+
ICsgICAgIF9fdTMyIG9mZnNldDsgLyogb2Zmc2V0IGZyb20gdGhlIGJlZ2lubmluZyBvZiBjb25m
aWcgc3BhY2UgKi8KPj4+Pj4+Pj4+Pj4gKyAgICAgX191MzIgbGVuOyAvKiB0aGUgbGVuZ3RoIHRv
IHJlYWQvd3JpdGUgKi8KPj4+Pj4+Pj4+Pj4gKyAgICAgX191OCBkYXRhW1ZEVVNFX0NPTkZJR19E
QVRBX0xFTl07IC8qIGRhdGEgYnVmZmVyIHVzZWQgdG8gcmVhZC93cml0ZSAqLwo+Pj4+Pj4+Pj4+
IE5vdGUgdGhhdCBzaW5jZSBWRFVTRV9DT05GSUdfREFUQV9MRU4gaXMgcGFydCBvZiB1QVBJIGl0
IG1lYW5zIHdlIGNhbgo+Pj4+Pj4+Pj4+IG5vdCBjaGFuZ2UgaXQgaW4gdGhlIGZ1dHVyZS4KPj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+IFNvIHRoaXMgbWlnaHQgc3VmZmNpZW50IGZvciBmdXR1cmUgZmVh
dHVyZXMgb3IgYWxsIHR5cGUgb2YgdmlydGlvIGRldmljZXMuCj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+
IERvIHlvdSBtZWFuIDI1NiBpcyBubyBlbm91Z2ggaGVyZe+8nwo+Pj4+Pj4+PiBZZXMuCj4+Pj4+
Pj4+Cj4+Pj4+Pj4gQnV0IHRoaXMgcmVxdWVzdCB3aWxsIGJlIHN1Ym1pdHRlZCBtdWx0aXBsZSB0
aW1lcyBpZiBjb25maWcgbGVuZ2ggaXMKPj4+Pj4+PiBsYXJnZXIgdGhhbiAyNTYuIFNvIGRvIHlv
dSB0aGluayB3aGV0aGVyIHdlIG5lZWQgdG8gZXh0ZW50IHRoZSBzaXplIHRvCj4+Pj4+Pj4gNTEy
IG9yIGxhcmdlcj8KPj4+Pj4+IFNvIEkgdGhpbmsgeW91J2QgYmV0dGVyIGVpdGhlcjoKPj4+Pj4+
Cj4+Pj4+PiAxKSBkb2N1bWVudCB0aGUgbGltaXRhdGlvbiAoMjU2KSBpbiBzb21ld2hlcmUsIChi
ZXR0ZXIgYm90aCB1YXBpIGFuZCBkb2MpCj4+Pj4+Pgo+Pj4+PiBCdXQgdGhlIFZEVVNFX0NPTkZJ
R19EQVRBX0xFTiBkb2Vzbid0IG1lYW4gdGhlIGxpbWl0YXRpb24gb2YKPj4+Pj4gY29uZmlndXJh
dGlvbiBzcGFjZS4gSXQgb25seSBtZWFucyB0aGUgbWF4aW11bSBzaXplIG9mIG9uZSBkYXRhCj4+
Pj4+IHRyYW5zZmVyIGZvciBjb25maWd1cmF0aW9uIHNwYWNlLiBEbyB5b3UgbWVhbiBkb2N1bWVu
dCB0aGlzPwo+Pj4+IFllcywgYW5kIGFub3RoZXIgdGhpbmcgaXMgdGhhdCBzaW5jZSB5b3UncmUg
dXNpbmcKPj4+PiBkYXRhW1ZEVVNFX0NPTkZJR19EQVRBX0xFTl0gaW4gdGhlIHVhcGksIGl0IGlt
cGxpZXMgdGhlIGxlbmd0aCBpcyBhbHdheXMKPj4+PiAyNTYgd2hpY2ggc2VlbXMgbm90IGdvb2Qg
YW5kIG5vdCB3aGF0IHRoZSBjb2RlIGlzIHdyb3RlLgo+Pj4+Cj4+PiBIb3cgYWJvdXQgcmVuYW1p
bmcgVkRVU0VfQ09ORklHX0RBVEFfTEVOIHRvIFZEVVNFX01BWF9UUkFOU0ZFUl9MRU4/Cj4+Pgo+
Pj4gVGhhbmtzLAo+Pj4gWW9uZ2ppCj4+Cj4+IFNvIGEgcXVlc3Rpb24gaXMgdGhlIHJlYXNvbiB0
byBoYXZlIGEgbGltaXRhdGlvbiBvZiB0aGlzIGluIHRoZSB1QVBJPwo+PiBOb3RlIHRoYXQgaW4g
dmhvc3QtdmRwYSB3ZSBkb24ndCBoYXZlIHN1Y2g6Cj4+Cj4+IHN0cnVjdCB2aG9zdF92ZHBhX2Nv
bmZpZyB7Cj4+ICAgICAgICAgICBfX3UzMiBvZmY7Cj4+ICAgICAgICAgICBfX3UzMiBsZW47Cj4+
ICAgICAgICAgICBfX3U4IGJ1ZlswXTsKPj4gfTsKPj4KPiBJZiBzbywgd2UgbmVlZCB0byBjYWxs
IHJlYWQoKS93cml0ZSgpIG11bHRpcGxlIHRpbWVzIGVhY2ggdGltZQo+IHJlY2VpdmluZy9zZW5k
aW5nIG9uZSByZXF1ZXN0IG9yIHJlc3BvbnNlIGluIHVzZXJzcGFjZSBhbmQga2VybmVsLiBGb3IK
PiBleGFtcGxlLAo+Cj4gMS4gcmVhZCBhbmQgY2hlY2sgcmVxdWVzdC9yZXNwb25zZSB0eXBlCj4g
Mi4gcmVhZCBhbmQgY2hlY2sgY29uZmlnIGxlbmd0aCBpZiB0eXBlIGlzIFZEVVNFX1NFVF9DT05G
SUcgb3IgVkRVU0VfR0VUX0NPTkZJRwo+IDMuIHJlYWQgdGhlIHBheWxvYWQKPgo+IE5vdCBzdXJl
IGlmIGl0J3Mgd29ydGggaXQuCj4KPiBUaGFua3MsCj4gWW9uZ2ppCgoKUmlnaHQsIEkgc2VlLgoK
U28gSSdtIGZpbmUgd2l0aCBjdXJyZW50IGFwcHJvYWNoLgoKVGhhbmtzCgoKCj4KCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1h
aWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBsaXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRw
czovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5vcmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXph
dGlvbg==
