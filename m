Return-Path: <virtualization-bounces@lists.linux-foundation.org>
X-Original-To: lists.virtualization@lfdr.de
Delivered-To: lists.virtualization@lfdr.de
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DCB221C07
	for <lists.virtualization@lfdr.de>; Thu, 16 Jul 2020 07:42:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by silver.osuosl.org (Postfix) with ESMTP id E3EB2204BC;
	Thu, 16 Jul 2020 05:42:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
	by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYYpeWVd2CB2; Thu, 16 Jul 2020 05:42:24 +0000 (UTC)
Received: from lists.linuxfoundation.org (lf-lists.osuosl.org [140.211.9.56])
	by silver.osuosl.org (Postfix) with ESMTP id 27EDA20490;
	Thu, 16 Jul 2020 05:42:24 +0000 (UTC)
Received: from lf-lists.osuosl.org (localhost [127.0.0.1])
	by lists.linuxfoundation.org (Postfix) with ESMTP id EF0D3C0733;
	Thu, 16 Jul 2020 05:42:23 +0000 (UTC)
X-Original-To: virtualization@lists.linux-foundation.org
Delivered-To: virtualization@lists.linuxfoundation.org
Received: from silver.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists.linuxfoundation.org (Postfix) with ESMTP id 922E5C0733
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 05:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by silver.osuosl.org (Postfix) with ESMTP id 79D5B2045B
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 05:42:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from silver.osuosl.org ([127.0.0.1])
 by localhost (.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CJjJsSojPis9
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 05:42:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.7.6
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-2.mimecast.com
 [205.139.110.61])
 by silver.osuosl.org (Postfix) with ESMTPS id 2F981203D2
 for <virtualization@lists.linux-foundation.org>;
 Thu, 16 Jul 2020 05:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1594878138;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7iOIeIlKEJcsPpbGDHdQOFqlT3P7K/L/+J8sfRdcsv8=;
 b=fwXfMAE+T/165d8pzSbuSR6UP6UfByt6/Fb6XWgkkOrydbUW728csrKCrDIj62KQUf5n0k
 D66xGE8dzwXQzBms7GlXb2vhNmN14yTIymNFL+We0snpM/nymyJNCcF3kppEZVfltPUAhA
 6r4kgH6kCAXkbrqasAZtYFYxlWJ1Qdo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-452-RSv_QRYpNVC68WjF-6c4XQ-1; Thu, 16 Jul 2020 01:42:17 -0400
X-MC-Unique: RSv_QRYpNVC68WjF-6c4XQ-1
Received: by mail-wm1-f69.google.com with SMTP id g138so4015421wme.7
 for <virtualization@lists.linux-foundation.org>;
 Wed, 15 Jul 2020 22:42:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=7iOIeIlKEJcsPpbGDHdQOFqlT3P7K/L/+J8sfRdcsv8=;
 b=IxemQs1hHMpN+Tzsdk5YloMt+sWIpLvCOmSEI1TagjCcqfzohZXzVyf1X+uUyrgcJ/
 J64ya7DDi4XOk3HBmEZP7HqjS51g/+21J27MTOtEAZ5eCV2HaniaWG4T24Ux5/6FATk+
 kNyQhKMl2EJZ/7FCQH2LdK1aEc8cmmpNGbi+iqLf6c/zOStfmRmGHwusowYOaAbR3+ai
 KxixjPX4HR8Bw5yE1fQqFeSGLeXaS7LPSWq0dqgwLphqgXRwUd3+l4urAdI6QfFMg/KM
 1x2QxdAf007dDXVW6uI3RIukdkqnns5ocAYVbtdt1OOTkKuJs7DP7grSAARPKOyHpncw
 kX4A==
X-Gm-Message-State: AOAM5332Ne7haEO3CTDPs/GejitkPRpGM/SXMl22fn3sUMkZTehE6nJv
 uARBUhyo1RzrXvNKtpeK8jMcGqJLPgLUL9gUerzGcdXjqEis6upi8yqNlueClpZAAYz7Ybj2zeV
 BxfhBBJ5qwaIuAs/y2BeqQMFdmkJELDoO4FSie73rsg==
X-Received: by 2002:a05:600c:2152:: with SMTP id
 v18mr2861026wml.5.1594878135966; 
 Wed, 15 Jul 2020 22:42:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzk2KiSkJtmITnTvlIhxB0cz7evD1urhzNi5ygQuhGm8+M1oimW0b4DZK0pti7JeSPSHt1ykw==
X-Received: by 2002:a05:600c:2152:: with SMTP id
 v18mr2861015wml.5.1594878135700; 
 Wed, 15 Jul 2020 22:42:15 -0700 (PDT)
Received: from redhat.com (bzq-79-182-31-92.red.bezeqint.net. [79.182.31.92])
 by smtp.gmail.com with ESMTPSA id
 k11sm7467756wrd.23.2020.07.15.22.42.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jul 2020 22:42:15 -0700 (PDT)
Date: Thu, 16 Jul 2020 01:42:12 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Jason Wang <jasowang@redhat.com>
Subject: Re: [PATCH RFC don't apply] vdpa_sim: endian-ness for config space
Message-ID: <20200716013306-mutt-send-email-mst@kernel.org>
References: <20200715135540.22832-1-mst@redhat.com>
 <8f39dcc1-0899-7ed8-8a6e-75672417b9e3@redhat.com>
MIME-Version: 1.0
In-Reply-To: <8f39dcc1-0899-7ed8-8a6e-75672417b9e3@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Cc: linux-kernel@vger.kernel.org, virtualization@lists.linux-foundation.org
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: virtualization-bounces@lists.linux-foundation.org
Sender: "Virtualization" <virtualization-bounces@lists.linux-foundation.org>

T24gV2VkLCBKdWwgMTUsIDIwMjAgYXQgMTA6MDI6MzJQTSArMDgwMCwgSmFzb24gV2FuZyB3cm90
ZToKPiAKPiBPbiAyMDIwLzcvMTUg5LiL5Y2IOTo1OCwgTWljaGFlbCBTLiBUc2lya2luIHdyb3Rl
Ogo+ID4gVkRQQSBzaW0gc3RvcmVzIGNvbmZpZyBzcGFjZSBhcyBuYXRpdmUgZW5kaWFuLCBidXQg
dGhhdAo+ID4gaXMgd3Jvbmc6IG1vZGVybiBndWVzdHMgZXhwZWN0IExFLgo+ID4gSSBjb2RlZCB1
cCB0aGUgZm9sbG93aW5nIHRvIGZpeCBpdCB1cCwgYnV0IGl0IGlzIHdyb25nIHRvbzoKPiA+IHZk
cGFzaW1fY3JlYXRlIGlzIGNhbGxlZCBiZWZvcmUgZ3Vlc3QgZmVhdHVyZXMgYXJlIGtub3duLgo+
ID4gCj4gPiBTbyB3aGF0IHNob3VsZCB3ZSBkbz8gTmV3IGlvY3RsIHRvIHNwZWNpZnkgdGhlIGlu
dGVyZmFjZSB1c2VkPwo+ID4gTW9yZSBpZGVhcz8KPiA+IAo+ID4gU2lnbmVkLW9mZi1ieTogTWlj
aGFlbCBTLiBUc2lya2luIDxtc3RAcmVkaGF0LmNvbT4KPiAKPiAKPiBDYW4gd2UgZG8gdGhlIGVu
ZGlhbiBjb252ZXJzaW9uIGluIHNldF9jb25maWcvZ2V0X2NvbmZpZygpPwo+IAo+IFRoYW5rcwoK
VGhhdCBpcyBwcm9ibGVtYXRpYyBhdCBsZWFzdCBmcm9tIHN0YXRpYyBjaGVja2luZyBwb2ludCBv
ZiB2aWV3LgpJdCB3b3VsZCBiZSByZWFzb25hYmxlIHRvIGRvIGl0IGluIHZkcGFzaW1fc2V0X2Zl
YXR1cmVzLCBleGNlcHQKbGVnYWN5IGd1ZXN0cyBtaWdodCBub3Qgc2V0IGZlYXR1cmVzIGF0IGFs
bC4KU28gbXkgcHJvcG9zYWwgaXM6Ci0gc2V0IGNvbmZpZyBpbiB2ZHBhc2ltX3NldF9mZWF0dXJl
cwotIGRvY3VtZW50IHRoYXQgdGhpcyBpcyB3aGVyZSBkZXZpY2VzIHNob3VsZCBpbml0aWFsaXpl
IGNvbmZpZwotIHZkcGEgY29yZSB3aWxsIG1haW50YWluIGEgImZlYXR1cmVzIHNldCIgZmxhZywg
aWYgZ2V0L3NldCBjb25maWcKICBpcyBjYWxsZWQgd2l0aG91dCBzZXQgZmVhdHVyZXMsIGNvcmUg
d2lsbCBjYWxsIHNldCBmZWF0dXJlcwogIGF1dG9tYXRpY2FsbHkgd2l0aCAwIHZhbHVlLgoKVGhv
dWdodHM/CgoKPiAKPiA+IAo+ID4gCj4gPiAtLS0KPiA+ICAgZHJpdmVycy92ZHBhL3ZkcGFfc2lt
L3ZkcGFfc2ltLmMgfCAyMiArKysrKysrKysrKysrKysrKysrKy0tCj4gPiAgIDEgZmlsZSBjaGFu
Z2VkLCAyMCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+ID4gCj4gPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMgYi9kcml2ZXJzL3ZkcGEvdmRwYV9z
aW0vdmRwYV9zaW0uYwo+ID4gaW5kZXggYTliYzVlMGZiMzUzLi5jYzc1NGFlMGVjMTUgMTAwNjQ0
Cj4gPiAtLS0gYS9kcml2ZXJzL3ZkcGEvdmRwYV9zaW0vdmRwYV9zaW0uYwo+ID4gKysrIGIvZHJp
dmVycy92ZHBhL3ZkcGFfc2ltL3ZkcGFfc2ltLmMKPiA+IEBAIC0yNCw2ICsyNCw3IEBACj4gPiAg
ICNpbmNsdWRlIDxsaW51eC9ldGhlcmRldmljZS5oPgo+ID4gICAjaW5jbHVkZSA8bGludXgvdnJp
bmdoLmg+Cj4gPiAgICNpbmNsdWRlIDxsaW51eC92ZHBhLmg+Cj4gPiArI2luY2x1ZGUgPGxpbnV4
L3ZpcnRpb19ieXRlb3JkZXIuaD4KPiA+ICAgI2luY2x1ZGUgPGxpbnV4L3Zob3N0X2lvdGxiLmg+
Cj4gPiAgICNpbmNsdWRlIDx1YXBpL2xpbnV4L3ZpcnRpb19jb25maWcuaD4KPiA+ICAgI2luY2x1
ZGUgPHVhcGkvbGludXgvdmlydGlvX25ldC5oPgo+ID4gQEAgLTcyLDYgKzczLDIzIEBAIHN0cnVj
dCB2ZHBhc2ltIHsKPiA+ICAgCXU2NCBmZWF0dXJlczsKPiA+ICAgfTsKPiA+ICsvKiBUT0RPOiBj
cm9zcy1lbmRpYW4gc3VwcG9ydCAqLwo+ID4gK3N0YXRpYyBpbmxpbmUgYm9vbCB2ZHBhc2ltX2lz
X2xpdHRsZV9lbmRpYW4oc3RydWN0IHZkcGFzaW0gKnZkcGFzaW0pCj4gPiArewo+ID4gKwlyZXR1
cm4gdmlydGlvX2xlZ2FjeV9pc19saXR0bGVfZW5kaWFuKCkgfHwKPiA+ICsJCSh2ZHBhc2ltLT5m
ZWF0dXJlcyAmICgxVUxMIDw8IFZJUlRJT19GX1ZFUlNJT05fMSkpOwo+ID4gK30KPiA+ICsKPiA+
ICtzdGF0aWMgaW5saW5lIHUxNiB2ZHBhc2ltMTZfdG9fY3B1KHN0cnVjdCB2ZHBhc2ltICp2ZHBh
c2ltLCBfX3ZpcnRpbzE2IHZhbCkKPiA+ICt7Cj4gPiArCXJldHVybiBfX3ZpcnRpbzE2X3RvX2Nw
dSh2ZHBhc2ltX2lzX2xpdHRsZV9lbmRpYW4odmRwYXNpbSksIHZhbCk7Cj4gPiArfQo+ID4gKwo+
ID4gK3N0YXRpYyBpbmxpbmUgX192aXJ0aW8xNiBjcHVfdG9fdmRwYXNpbTE2KHN0cnVjdCB2ZHBh
c2ltICp2ZHBhc2ltLCB1MTYgdmFsKQo+ID4gK3sKPiA+ICsJcmV0dXJuIF9fY3B1X3RvX3ZpcnRp
bzE2KHZkcGFzaW1faXNfbGl0dGxlX2VuZGlhbih2ZHBhc2ltKSwgdmFsKTsKPiA+ICt9Cj4gPiAr
Cj4gPiAgIHN0YXRpYyBzdHJ1Y3QgdmRwYXNpbSAqdmRwYXNpbV9kZXY7Cj4gPiAgIHN0YXRpYyBz
dHJ1Y3QgdmRwYXNpbSAqdmRwYV90b19zaW0oc3RydWN0IHZkcGFfZGV2aWNlICp2ZHBhKQo+ID4g
QEAgLTMzMiw4ICszNTAsOCBAQCBzdGF0aWMgc3RydWN0IHZkcGFzaW0gKnZkcGFzaW1fY3JlYXRl
KHZvaWQpCj4gPiAgIAkJZ290byBlcnJfaW9tbXU7Cj4gPiAgIAljb25maWcgPSAmdmRwYXNpbS0+
Y29uZmlnOwo+ID4gLQljb25maWctPm10dSA9IDE1MDA7Cj4gPiAtCWNvbmZpZy0+c3RhdHVzID0g
VklSVElPX05FVF9TX0xJTktfVVA7Cj4gPiArCWNvbmZpZy0+bXR1ID0gY3B1X3RvX3ZkcGFzaW0x
Nih2ZHBhc2ltLCAxNTAwKTsKPiA+ICsJY29uZmlnLT5zdGF0dXMgPSBjcHVfdG9fdmRwYXNpbTE2
KHZkcGFzaW0sIFZJUlRJT19ORVRfU19MSU5LX1VQKTsKPiA+ICAgCWV0aF9yYW5kb21fYWRkcihj
b25maWctPm1hYyk7Cj4gPiAgIAl2cmluZ2hfc2V0X2lvdGxiKCZ2ZHBhc2ltLT52cXNbMF0udnJp
bmcsIHZkcGFzaW0tPmlvbW11KTsKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fClZpcnR1YWxpemF0aW9uIG1haWxpbmcgbGlzdApWaXJ0dWFsaXphdGlvbkBs
aXN0cy5saW51eC1mb3VuZGF0aW9uLm9yZwpodHRwczovL2xpc3RzLmxpbnV4Zm91bmRhdGlvbi5v
cmcvbWFpbG1hbi9saXN0aW5mby92aXJ0dWFsaXphdGlvbg==
